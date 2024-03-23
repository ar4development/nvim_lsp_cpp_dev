from ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y locales && locale-gen en_US en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && export LANG=en_US.UTF-8

RUN apt install -y --no-install-recommends tzdata && apt install -y keyboard-configuration
RUN apt install -y curl unzip wget gnupg2 lsb-release software-properties-common
RUN apt install -y git
RUN apt install -y python-is-python3 python3-venv
RUN apt install -y clang lldb lld  make cmake

RUN wget https://github.com/neovim/neovim-releases/releases/download/nightly/nvim-linux64.deb -O nvim_dist.deb && dpkg -i nvim_dist.deb

RUN apt update && apt install -y ca-certificates && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN NODE_MAJOR=20 && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt update && apt install -y nodejs

RUN apt install -y ripgrep pip

RUN useradd -ms /bin/bash mavs
USER mavs

WORKDIR /home/mavs

RUN git clone https://github.com/NvChad/starter /home/mavs/.config/nvim

COPY --chown=mavs ./custom/init.lua /home/mavs/.config/nvim/lua/plugins/init.lua
COPY --chown=mavs ./custom/lspconfig.lua /home/mavs/.config/nvim/lua/configs/lspconfig.lua
COPY --chown=mavs ./sample_cpp_project /home/mavs/sample_cpp_project

RUN mkdir /home/mavs/sample_cpp_project/build 
WORKDIR /home/mavs/sample_cpp_project

RUN cd build && cmake .. && cmake --build .
