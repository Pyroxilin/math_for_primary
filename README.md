# README

## Installation

#### 1. Install ruby

```bash
sudo apt-get install curl
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.bash_profile
rvm install 2.6.3
rvm use 2.6.3 --default
```

#### 2. Install & setup postgresql

```bash
sudo apt-get install postgresql postgresql-client libpq-dev
sudo su -l -c "createuser -s $(whoami)" postgres
```

#### 2. Clone & setup

```bash
git clone git@github.com:pyroxilin/math_for_primary.git
cd math_for_primary
bundle install
yarn install
rails db:create db:migrate
```

## Running

```bash
rails s
```

