FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-devel
ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}

RUN apt update -y && apt -y install git libsndfile1 cmake && git clone https://github.com/NVIDIA/apex && \
    pip install numpy scipy matplotlib librosa==0.8.0 tensorflow==1.15.2 tensorboardX inflect==0.2.5 Unidecode==1.0.22 pillow jupyter jupyterlab pyopenjtalk

RUN cd apex && pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
CMD ["jupyter", "lab", "--allow-root", "--port", "8080", "--ip", "0.0.0.0", "--NotebookApp.token", ""]
