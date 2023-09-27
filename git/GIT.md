
### notes on git 
>- [How can I undo pushed commits using git?](https://stackoverflow.com/questions/22682870/how-can-i-undo-pushed-commits-using-git)
>- [How do I delete a file from a Git repository?](https://stackoverflow.com/questions/2047465/how-do-i-delete-a-file-from-a-git-repository)
```
git reset --hard 'xxxxx' 
git clean -f -d 
git push -f 
```
>- [How do I fix a Git detached head?](https://stackoverflow.com/questions/10228760/how-do-i-fix-a-git-detached-head) *(see below)*
>
Detached head means you are no longer on a branch, you have checked out a single commit in the history (in this case the commit previous to HEAD, i.e. HEAD^).

## If you want to _keep_ your changes associated with the detached HEAD

1.  Run `git branch tmp` - this will save your changes in a new branch called `tmp`.
2.  Run `git checkout master`
3.  If you would like to incorporate the changes you made into `master`, run `git merge tmp` from the `master` branch. You should be on the `master` branch after running `git checkout master`.

## If you want to _delete_ your changes associated with the detached HEAD

You only need to checkout the branch you were on, e.g.

```
git checkout master
```

Next time you have changed a file and want to restore it to the state it is in the index, don't delete the file first, just do

```
git checkout -- path/to/foo
```

This will restore the file foo to the state it is in the index.


# where 'xxxxx' is a tag or branch id

###

Use git rm.

If you want to remove the file from the Git repository and the filesystem, use:

git rm file1.txt
git commit -m "remove file1.txt"
But if you want to remove the file only from the Git repository and not remove it from the filesystem, use:

git rm --cached file1.txt
git commit -m "remove file1.txt"
And to push changes to remote repo

git push origin branch_name
