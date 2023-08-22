# My Neovim setup

> brah

![Screenshot](https://i.imgur.com/pWJ3cpk.png)


## [TODO](#todo)

* [ ] `eslint`, `volar`, `tsserver` warns import error because modules are in docker container.
I currently use `vetur-vls` instead of `vue-language-server` lsp in mason to avoid error.

```bash
"Request initialize failed with message: Can't find typescript.js or tsserverlibrary.js in /home/xxx/programs/web
apps/enplet/frontend/node_modules/typescript/lib
```

## requirements
* nvim v0.10.0-dev
* gcc (for tree-sitter)
* g++ (for tree-sitter)
* ripgrep (for telescope)

```bash
apt-get install gcc
apt-get install g++
```

## installation

1. clone the repo
2. put these flie to `.config/nvim/`
3. init nvim

## LSP

### Mason requirements

* npm
* luarock
* python3-venv

```bash
# npm (i reccommend installing npm with volta)
curl https://get.volta.sh | bash
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
volta install node

# luarock
sudo apt-get install luarock

# python3-venv
sudo apt-get install python3-venv
```

### list of lsp, linter, formatter.

* formatter
* * prettier
* * black
* * isort
* * stylua

* linter
* * flake8
* * ~~eslint~~
* * luacheck

* lsp
* * jedi-language-server
* * typescript-language-server
* * ~~vue-language-server~~
* * vetur-vls







