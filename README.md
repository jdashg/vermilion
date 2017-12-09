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

## Example installation
~~~
sudo su
useradd -m -s /usr/bin/git-shell git
su -s /bin/bash git
cd
mkdir .ssh
cd .ssh
cat > authorized_keys
# Paste in your public keys
^C # when done
ssh-keygen -t rsa -b 4096 -C "git@machinename" # don't use a passphrase
# You'll need to add this new public key to your hg endpoint auth.

cd
git init --bare foo.git
cd foo.git
git config cinnabar.path '/usr/share/git-cinnabar' # Or wherever it is, if it's not in the default paths.
git config fetch.prune
git remote add bar hg::ssh://www.bar.org/bar
<vermilion-path>/install.sh

git fetch bar
git gc
~~~

