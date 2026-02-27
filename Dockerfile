FROM rocm/pytorch:latest AS builder

RUN apt update && apt-get install -y --no-install-recommends \
    libzstd-dev \
    libnuma1 \
    libmsgpack-dev \
    libboost-all-dev \
    llvm \
    git \
    cmake \
    ninja-build \
    python3-venv \
    python3-pip \
    python3-dev \
    gfortran \
    pkg-config \
    wget \
    curl \
    vim \
    ca-certificates \
    # Runtime deps for TheRock components (e.g. compression libs)
    zstd \
    libzstd-dev \
    # Common deps for hipBLASLt build
    libnuma1 \
    libmsgpack-dev \
    libboost-dev \
    libboost-program-options-dev \
    libboost-filesystem-dev \
    libdrm-dev \
    # Build tools
    make \
    build-essential 

WORKDIR /workspace

RUN git clone --recursive https://github.com/ROCm/rocm-libraries.git rocm-libraries

WORKDIR /workspace/rocm-libraries/projects/hipblaslt
RUN cmake \
    -DCMAKE_INSTALL_PREFIX=${PWD}/install \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_CXX_COMPILER=/opt/rocm/bin/amdclang++ \
    -DCMAKE_C_COMPILER=/opt/rocm/bin/amdclang \
    -DCMAKE_PREFIX_PATH=/opt/rocm \
    -S /workspace/rocm-libraries/projects/hipblaslt/ \
    -B ./build/ \
    -G Ninja \
    -DGPU_TARGETS=gfx950 \
    -DHIPBLASLT_ENABLE_BLIS=0 \
    -DPython3_EXECUTABLE=$(which python) \
    -DHIPBLASLT_BUILD_SHARED_LIBS=1 \
    -DHIPBLASLT_ENABLE_CLIENT=1 \
    -DHIPBLASLT_ENABLE_DEVICE=1 \
    -DHIPBLASLT_ENABLE_HOST=1 \
    -DHIPBLASLT_ENABLE_ROCROLLER=1
RUN ninja -C ./build/ hipblaslt-bench

ENV LD_LIBRARY_PATH=/workspace/rocm-libraries/projects/hipblaslt/build/library:/opt/rocm/llvm/lib:$LD_LIBRARY_PATH
ENV PATH=/workspace/rocm-libraries/projects/hipblaslt/build/clients:/opt/rocm/llvm/bin:$PATH

CMD ["/bin/bash"]