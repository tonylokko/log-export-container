---
layout: default
title: Local deployment
parent: Deploy LEC
nav_order: 9
---
# Local environment

## Environment configuration

### Ruby

#### Install RVM
```
brew install gnupg
gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
```
For Linux see: http://rvm.io/

#### Configure RVM and dependencies
```
rvm install 2.6.3
rvm use 2.6.3@log-export-container --create
gem install bundler -v '~> 1.17.3'
bundle install
```

## Run

### Ruby tests
```
ruby test/run_test.rb
```

### Python tests
```
pytest
dev-tools/start-local.sh
```
