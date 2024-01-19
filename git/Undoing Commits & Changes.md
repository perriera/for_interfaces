### Undoing Commits & Changes 
>- [Undoing Commits & Changes ](https://www.atlassian.com/git/tutorials/undoing-changes)
>- [git undo all uncommitted or unsaved changes](https://stackoverflow.com/questions/14075581/git-undo-all-uncommitted-or-unsaved-changes)

To sum it up: executing commands below is basically equivalent to fresh git clone from original source (but it does not re-download anything, so is much faster):

```
git reset
git checkout .
git clean -fdx
```
or
```
git reset; git checkout .; git clean -fdx
```

