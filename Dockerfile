from ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y locales && locale-gen en_US en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && export LANG=en_US.UTF-8

RUN apt install -y --no-install-recommends tzdata && apt install -y keyboard-configuration
RUN apt install -y curl unzip wget gnupg2 lsb-release
RUN apt install -y git
RUN apt install -y python-is-python3 python3-venv

RUN wget https://apt.llvm.org/llvm.sh && chmod u+x llvm.sh && ./llvm.sh 17

RUN wget https://github.com/neovim/neovim-releases/releases/download/nightly/nvim-linux64.deb -O nvim_dist.deb && dpkg -i nvim_dist.deb

RUN useradd -ms /bin/bash mavs
USER mavs

WORKDIR /home/mavs

RUN git clone https://github.com/NvChad/NvChad /home/mavs/.config/nvim --depth 1 && nvim -es

COPY --chown=mavs ./custom/ /home/mavs/.config/nvim/lua/custom/
