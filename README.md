# godevenv
A Go Development environment in a container

## Usage

### Step 1:
Clone this repository on a server with Docker.

### Step 2:
Build the container:
```
sudo docker build -t whqtrruhq/godevenv .
```

### Step 3:
Run the container:
```
sudo docker run --name=godevenv -v /home/whqtrruhq/.ssh/:/home/whqtrruhq/.ssh/ -p 3000:3000 -it godevenv
```

### Step 4:
Once inside the container, launch Neovim.
```
nvim
```

### Step 5:
Run GoInstallBinaries to complete vim-go setup
```
:GoInstallBinaries
```
### Step 6:
Exit Neovim and reload the Neovim config file
```
source ~/.config/nvim/init.vim
```
