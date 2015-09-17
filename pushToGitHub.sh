FILES="~/.emacs ~/.profile ~/.zshrc"

for file in $FILES
do
    echo "file : $file"
    cp -r $file ./
done

git add *
git commit
git push
