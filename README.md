# NEOVIM CONFIG

Configuration for neovim, with Java, Lua and other langauge servers installed and configured.

To use this config run the install script in the root folder to install neovim
then create a nvim folder in ~/.config/ folder.

## Note

When using the Java language server after gradle dependencies have been refreshed, you need to call
:JdtWipeDataAndRestart with in NeoVim so it restarts the language the server and rebuilds the project metadata. Also the configuration is for linux but it can be easily set up for MAC and Windows. Please usse the following URLs.

- https://github.com/mfussenegger/nvim-jdtls

- https://github.com/eclipse-jdtls/eclipse.jdt.ls

- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
