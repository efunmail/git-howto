## SPARSE Checkout

*"Is it possible to do a sparse checkout
without checking out the whole repository first?"*

https://stackoverflow.com/a/63786181

```sh
# Works in git v2.37.1+

git clone --filter=blob:none --no-checkout --depth 1 --sparse <project-url>
cd <project>

# Specify the folders you want to clone
git sparse-checkout add <folder1> <folder2>
git checkout
```

Some comments:

> Instead of `blob:none`, consider `tree:0`

> Remark: even **if you do not add** any folder
> you should run `git checkout` else `git status`
> shows all files in the repo as deleted
> and the deletions as added to the index
> (so you **risk to commit the deletion**).
> (tested on 2.39.2.windows.1).
> Or **do not pass** `--no-checkout`
