FROM nvidia/cuda:11.2.2-cudnn8-devel-ubuntu20.04

# Instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    libcurl4-openssl-dev \
    libssl-dev \
    libjansson-dev \
    automake \
    && rm -rf /var/lib/apt/lists/*

# Clonar e compilar o ccminer
RUN git clone https://github.com/tpruvot/ccminer.git /opt/ccminer \
    && cd /opt/ccminer \
    && ./build.sh

# Definir o ponto de entrada para o ccminer
ENTRYPOINT ["/opt/ccminer/ccminer"]
