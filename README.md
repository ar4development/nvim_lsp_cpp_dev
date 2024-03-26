# A simple quick-start for developing cpp and python apps in NVIM-based IDE

includes:
- cpp compiler `clang` and debugger `lldb` (version `16`)
- c++20 standard support
- cmake
- python
- cpp language server
- python language server
- cmake language server
- nvim-dap
- nvimdap-ui

mappings:
- `<leader>db` - toggle breakpoint
- `<leader>dc` - run/continue debugging
- `<leader>ds` - stop debugging
- `<leader>du` - toggle debug ui

How to run:
- clone repo
- build: `sudo docker build -t <YOUR_TAG> .`
- run `sudo docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -ti <YOUR_TAG> /bin/bash`
- execute `nvim`
- wait while plugins are loaded
- press `q`
- in normal mode type `:MasonInstallAll`
- wait for Mason to complete downloading
- press `q`
- Press `Ctrl + N`. You're now in a sample CPP project. Use your new neovim IDE.
