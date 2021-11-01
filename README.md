1- Cloud9 : create envionrment -> Ubuntu Server 18.04 LTS
2- create ruby app [https://guides.rubyonrails.org/getting_started.html]
2.1- install Yarn "npm install --global yarn"
2.2- install Rails "gem install rails"
2.3- install PostgreSql [https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-18-04]
2.3.3- "sudo apt-get update"
2.3.4- "sudo apt install postgresql postgresql-contrib libpq-dev"
2.4 - create DB [https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-18-04]
2.4.1- "sudo -u postgres createuser -s mez -P"
2.4.2- "gem install pg -v '1.2.3' --source 'https://rubygems.org/'"
2.5- create app with postgresql db "rails new timecardapp --database=postgresql"
2.6- GIT initialization [https://docs.github.com/en/authentication/connecting-to-github-with-ssh]
2.6.1- cd timecardapp -> "git init"
2.6.2- "ls -al ~/.ssh"
2.6.3- "ssh-keygen -t ed25519 -C "ice.man011@gmail.com""
2.6.4- "eval "$(ssh-agent -s)""
2.6.5- "ssh-add ~/.ssh/id_ed25519"
2.6.6- open file "/home/ubuntu/.ssh/id_ed25519.pub" then copy and paste it into github.com->ssh keys
2.6.7- test SSH connection "ssh -T git@github.com"
2.6.8- add remote "git remote add master git@github.com:iceman011/myTimeCardRuby.git"
2.7- merge wat exist on github into newly created rail app 
2.7.1= "git fetch"
2.7.2= "git reset --hard origin/master"
2.8- auto complete component [https://joelc.io/dynamic-autocomplete-rails-6]
2.8.1- "yarn add jquery"
2.8.2- "yarn add easy-autocomplete"
2.9- calender [https://dzone.com/articles/give-your-dates]
2.9.1- "yarn add bootstrap jquery popper.js flatpickr"
2.9.2- "bundle install"