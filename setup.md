##Getting Set Up

###Install

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
 
If you have the error:
Gem::RemoteFetcher::FetchError: SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed (https://rubygems.org/gems/rake-11.1.1.gem)
An error occurred while installing rake (11.1.1), and Bundler cannot continue.  Make sure that 'gem install rake -v '11.1.1' succeeds before bundling.

This is an issue that results from needing to have the certificate updated.  You can find a guide on how to correct this here:
https://gist.github.com/luislavena/f064211759ee0f806c88

After you have gone through the sets, attempt to run the command 'bundle install'.  If this succeeds, the formerly missing rake has been installed.

When you are starting work on the project:
In order to make sure that you have all of the current structures being used in it, you will need to open the Command Prompt with Ruby and Rails and run these commands:
1.  'cd writers-website'
2.  'git pull origin master'
3.  'bundle install'
4.  'rake db:migrate'

Tips:
* use double quote in git commit -m "commit message here"

####Nitrous 

Create an account on https://nitrous.io
- you'll need an email address and password
- free account gives 50 hours of coding per month

Create a new project, Ubuntu based and accept the default name.  

Select IDE once your project is deployed.

You'll be working at the command line.  Command line is also called terminal or shell.  When in Nitrous you have two panels; the code editor and the shell.  Create a new shell panel by clicking the plus symbol `+` and maximizing the window.

Install RVM (Ruby Version Manager)

`gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`

`curl -sSL https://get.rvm.io | bash -s stable`

`source /home/nitrous/.rvm/scripts/rvm`

Clone this repository

`git clone https://github.com/womenwhocode-renotahoe/writers-website.git`

Install Ruby and Rails
_When you enter the local repo for the first time, you'll be prompted to install Ruby._

`cd writers-website`

`rvm install ruby-2-2-2`

Once the install of Ruby has completed, confirm you have version 2.2.  Then back out of the writers-website directory and enter it again to get the gemset to take.

`cd ..`

`cd writers-website`

Confirm the gemset is set to writers-website.

`rvm gemset list`

Install Postgres (database) and configure user.  When prompted, enter Y to continue.

`sudo apt-get install postgresql postgresql-contrib libpq-dev`

`sudo su - postgres`

`createuser --interactive`
Enter **nitrous** as user

`createdb writers_website_development`

`logout`

Configure environment variables for database user and password.
`cd ..`

`nano .zshrc`
At the bottom of the file add the following and save (control X).
export WRITERS_WEBSITE_DATABASE_USERNAME=nitrous
export WRITERS_WEBSITE_DATABASE_PASSWORD=SomethingSecret

Refresh shell by closing shell window using X and then entering a new shell.  

Install Bundler, node-js and Rails
`cd writers-website`

`gem install bundler`

`sudo apt-get install node-js`
Enter 'Y' to continue

`bundle install`

Confirm version of rails is 4.2.5
`rails -v`

Define database schema and run migrations.
`rake db:migrate`

Run Rails
`rails s -b 0.0.0.0`

View app via Preview button in menu.

Tips:
To shut down Rails, type Control C.

Your Nitrous workstation will shut down when inactive.  When you log in, click "Start Workstation" to start it and begin using your workspace again.

If you have trouble getting Nitrous to function well in one browser, switch to another.

