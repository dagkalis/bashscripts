PS1=""
branch=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
if [ $branch != "" ]; then 
PS1="\nGit Branch=>\e[38;5;1m$branch\e[0m\n"
else
PS1=""
fi
PS1="${PS1}\e[34m\e[1m\w\e[0m:$ "

