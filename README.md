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
2.8 create DB and schema fetched from github
2.8.1 "rails db:create"
2.8.2 "rails db:schema:load"
2.9- auto complete component [https://joelc.io/dynamic-autocomplete-rails-6]
2.9.1- "yarn add jquery"
2.9.2- "yarn add easy-autocomplete"
2.10- calender [https://dzone.com/articles/give-your-dates]
2.10.1- "yarn add bootstrap jquery popper.js flatpickr"
2.10.2- "bundle install"
2.11 resolve error webpacker opensslErrorStack: [ 'error:03000086:digital envelope routines::initialization error' ] [https://github.com/webpack/webpack/issues/14532]
2.11.1- "export NODE_OPTIONS=--openssl-legacy-provider" then rails server
2.22- Update Schema
2.22.1-  "rails generate migration AddEmpIdToCards"
2.22.2- "rails db:migrate"
2.22.3- "Emp.create(name: “Usher”)"
2.22.4- "Card.create(title: “Yeaaa”, emp_id: 1)"
2.22.5- "rails db:seed"
2.23- nested resource example [https://www.digitalocean.com/community/tutorials/how-to-create-nested-resources-for-a-ruby-on-rails-application]
2.24- authentication (login/signup) [https://www.section.io/engineering-education/how-to-setup-user-authentication-from-scratch-with-rails-6/]
2.24.1- authorization [https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8]
2.24.1- devise , CanCanCan libaries complete example [https://softwrap.com.br/blog/index.html@p=92.html]
2.25- adding navigation menu [https://github.com/codeplant/simple-navigation/wiki/Configuration]
2.26- dynamic/nested form
2.26.1- survey->question->answer [http://railscasts.com/episodes/196-nested-model-form-part-1?autoplay=true]
2.26.2.- bulk insert [https://www.bigbinary.com/blog/bulk-insert-support-in-rails-6]
2.27.1- JS changed but not updated in runtime "rake assets:clobber" then "bundle exec rake assets:precompile"
