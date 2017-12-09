# vermilion
A pure git bridge for git-cinnabar

## Example workflow
~~~
git push <vermilion-remote> :refs/heads/central # incur a remote fetch
git fetch <vermilion-remote> central/branches/default/tip
git checkout FETCH_HEAD
git commit --allow-empty -m 'example commit'
git push <vermilion-remote> HEAD:refs/heads/central
~~~

