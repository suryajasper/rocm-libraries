#!/usr/bin/env python3
"""
Patch a Wave .rocmasm / .s assembly file for compatibility with AITER kernels
in the hipblaslt combined code object.

Applies two fixes:
  1. Removes `.amdhsa_code_object_version <N>` to let the assembler use its
     default, avoiding ABI version linker errors with AITER objects.
  2. Rewrites `amdhsa.version: [1, 2]` -> `[1, 0]` in the YAML metadata so
     the HIP runtime can resolve all symbols from the linked .co.

Usage:
  python patch_wave_asm.py <input.s> [-o <output.s>] [--kernel-name <name>]

If -o is omitted the file is patched in place.
"""

import argparse
import re
import sys


def patch_wave_asm(asm: str, kernel_name: str | None = None) -> str:
    """Apply compatibility patches to Wave assembly source text."""
    asm = re.sub(
        r"^\s*\.amdhsa_code_object_version\s+\d+\s*\n",
        "",
        asm,
        flags=re.MULTILINE,
    )
    asm = re.sub(
        r"(amdhsa\.version:\s*\n\s*-\s*)1(\s*\n\s*-\s*)\d+",
        r"\g<1>1\g<2>0",
        asm,
    )
    if kernel_name is not None:
        asm = asm.replace("gemm", kernel_name)
    return asm


def main():
    parser = argparse.ArgumentParser(
        description="Patch Wave assembly for hipblaslt code-object compatibility"
    )
    parser.add_argument("input", help="Path to the .s / .rocmasm file to patch")
    parser.add_argument(
        "-o",
        "--output",
        default=None,
        help="Output path (default: overwrite input in place)",
    )
    parser.add_argument(
        "--kernel-name",
        default=None,
        help='Replace every occurrence of "gemm" in the assembly with this name',
    )
    args = parser.parse_args()

    with open(args.input) as f:
        asm = f.read()

    patched = patch_wave_asm(asm, kernel_name=args.kernel_name)

    out_path = args.output or args.input
    with open(out_path, "w") as f:
        f.write(patched)

    print(f"Patched: {args.input} -> {out_path}")


if __name__ == "__main__":
    main()
