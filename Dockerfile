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

WORKDIR /opt/ccminer

# Copiar os arquivos da pasta ccminer para o diretório de trabalho
COPY . /opt/ccminer

# Configurar permissões de execução para build.sh
RUN chmod +x /opt/ccminer/build.sh

# Executar o script build.sh
RUN /bin/bash /opt/ccminer/build.sh

# Definir o ponto de entrada para o ccminer
ENTRYPOINT ["/opt/ccminer/ccminer"]
