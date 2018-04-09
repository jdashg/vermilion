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
su -s /bin/bash -l git
# -l makes it a login-shell, so .profile is triggered, updating your PATH.

cd
mkdir .ssh
cd .ssh
cat > authorized_keys
# Paste in your public keys
^C # when done
ssh-keygen -t rsa -b 4096 -C "git@machinename" # don't use a passphrase
# You'll need to add this new public key to your hg endpoint auth.

# You'll also need to add git-cinnabar to your PATH, probably in /home/git/.profile.

cd
git init --bare foo.git
cd foo.git
git config fetch.prune

# git gc is heavy-weight, and should probably not be done automatically by the server.
git config gc.auto 0

# git-shell doesn't pick up PATH, so our scripts manually add it based on cinnabar.path.
git config cinnabar.path '/path/to/git-cinnabar-repo'

git remote add bar hg::ssh://user@www.bar.org/bar

git fetch bar
git gc

<vermilion-path>/install.sh
~~~
