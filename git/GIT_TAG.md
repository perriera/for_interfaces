### git-tag-delete-local-and-remote.sh
- [git-tag-delete-local-and-remote.sh](https://gist.github.com/mobilemind/7883996)
```
# delete local tag '12345'
git tag -d 12345
# delete remote tag '12345' (eg, GitHub version too)
git push origin :refs/tags/12345
# alternative approach
git push --delete origin tagName
git tag -d tagName
```
