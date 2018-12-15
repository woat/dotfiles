package main

import (
	"fmt"
	"io/ioutil"
	"os/exec"
	"os/user"
)

var u, _ = user.Current()
var home = u.HomeDir

func symlink() {
	exclude := make(map[string]struct{})
	exists := struct{}{}
	exclude[".git"] = exists

	files, _ := ioutil.ReadDir(home + "/dotfiles")
	for _, f := range files {
		if string(f.Name()[0]) == "." {
			if _, ok := exclude[f.Name()]; !ok {
				exec.Command("ln", "-sf", home+"/dotfiles/"+f.Name(), home+"/"+f.Name()).Run()
			}
		}
	}
}

func ohmyzsh() {
	o, e := exec.Command("sh", "-c", "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)").Output()
	if e != nil {
		fmt.Println(e)
	}
	fmt.Println(string(o))
}

func vundle() {
	o, e := exec.Command("git", "clone", "https://github.com/VundleVim/Vundle.vim.git", home+"/.vim/bundle/Vundle.vim").Output()
	if e != nil {
		fmt.Println(e)
	}
	fmt.Println(string(o))
}

func main() {
	ohmyzsh()
	//vundle()
	//symlink()
}
