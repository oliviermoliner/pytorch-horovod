FROM nvcr.io/nvidia/pytorch:20.11-py3

ARG HOROVOD_VERSION=0.20.2

# install horovod
RUN ldconfig /usr/local/cuda/targets/x86_64-linux/lib/stubs && \
  HOROVOD_NCCL_LINK=SHARED \
  HOROVOD_GPU_ALLREDUCE=NCCL \
  HOROVOD_GPU_BROADCAST=NCCL \
  HOROVOD_WITH_PYTORCH=1 \
  pip install --no-cache-dir horovod==${HOROVOD_VERSION} && \
  ldconfig
  
COPY reduction.py /opt/conda/lib/python3.6/multiprocessing/reduction.py
