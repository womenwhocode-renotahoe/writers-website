* obviously unfinished... join our InstallFest(s) on ([Sat, 4/2 at 1pm](http://www.meetup.com/Women-Who-Code-Reno-Tahoe/events/229896130/) and ([Wed, 4/13 at 6pm] (http://www.meetup.com/Women-Who-Code-Reno-Tahoe/events/229896130/)). 

##Getting Set Up

###Checking your Version
open terminal/console/command prompt

- Rails
type `rails -v`

- Ruby
type `ruby -v`

- Git
type `git --version`

- Foundation and Devise

- Postgress

###Install
Virtual Options ([Cloud 9](https://c9.io/new) and [Nitrous.io](https://www.nitrous.io/app/#/signup))

####Mac
- Homebrew
type 
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
`brew update`
`brew upgrade`

- Git
type`brew install git`

- Rails
type `sudo gem install rails`
check version, confirm 4.2 `rails -v`

- Ruby (remove old versions and install ruby 2.3)
type 
`brew uninstall ruby` (skip if you don't have ruby)
`brew install ruby`
check version, confirm 2.3 `ruby -v`
if not, and you're on a mac, you might have a mac version of ruby, too
type 
`brew install gpg`
`gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`
`\curl -sSL https://get.rvm.io | bash -s stable`
`source /Users/sueting/.rvm/scripts/rvm`

*note: if you use a rails installer on Windows, your sites directory is on the C: drive (root directory)

####Windows
