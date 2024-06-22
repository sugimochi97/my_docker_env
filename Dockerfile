# ベースイメージとしてUbuntuを使用
FROM ubuntu:20.04

# 環境変数の設定
ENV DEBIAN_FRONTEND=noninteractive

# 基本的なツールのインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    wget \
    git \
    vim \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Pythonのインストール
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Node.jsとTypeScriptのインストール
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g typescript

# Javaのインストール
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    && rm -rf /var/lib/apt/lists/*

# C言語のインストール
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Bashプロンプトの設定を追加
RUN echo 'left_prompt() {' >> ~/.bashrc && \
    echo '    local user="\[\033[0;32m\]\u🐎\[\033[0m\]"' >> ~/.bashrc && \
    echo '    local dir="\[\033[0;93m\][\w]\[\033[0m\]"' >> ~/.bashrc && \
    echo '    local next="\[\033[0;36m\]>\[\033[0m\] "' >> ~/.bashrc && \
    echo '    echo -e "\n${user} ${dir}\n${next}"' >> ~/.bashrc && \
    echo '}' >> ~/.bashrc && \
    echo 'PS1="$(left_prompt)"' >> ~/.bashrc

# 作業ディレクトリの設定
WORKDIR /workspace

# コンテナのエントリーポイント
CMD ["bash"]
