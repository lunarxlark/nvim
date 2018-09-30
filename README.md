# Neovim with dein.vim

I want to use nvim in docker as same as local nvim.  
Mounting below local volumes to docker container, you can use your init.vim and plugins downloaded by dein.vim.

- `${XDG_CONFIG_HOME}`
- `${XDG_CACHE_HOME}`
- `${XDG_DATA_HOME}`


## Include language runtime

| language | version |
|----------|---------|
| python2  | 2.7.15  |
| python3  | 3.6.6   |
| ruby     | 2.5.1   |
| node.js  | 8.11.4  |


## How to Usage

---
### basic neovim variables

```bash
export XDG_CONFIG_HOME=~/.config/nvim
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
```


---
### alias for nvim

```bash:
alias nvim='docker run -ti --rm -v $(pwd):/opt -v ${XDG_CONFIG_HOME}:/root/.config/nvim -v ${XDG_CACHE_HOME}:/root/.cache -v ${XDG_DATA_HOME}:/root/.local/share -w /opt lunarxlark/nvim:latest "$@"'
```


---
### how to use nvim
```bash
nvim file
```
