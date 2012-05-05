# Artii API

               _____  _____ _____ _____              _              _____ _____ 
        /\    / ____|/ ____|_   _|_   _|            | |       /\   |  __ \_   _|
       /  \  | (___ | |      | |   | |     __ _ _ __| |_     /  \  | |__) || |  
      / /\ \  \___ \| |      | |   | |    / _` | '__| __|   / /\ \ |  ___/ | |  
     / ____ \ ____) | |____ _| |_ _| |_  | (_| | |  | |_   / ____ \| |    _| |_ 
    /_/    \_\_____/ \_____|_____|_____|  \__,_|_|   \__| /_/    \_\_|   |_____|


## Build Status [![Build Status](https://secure.travis-ci.org/potomak/artii-api.png?branch=master)](http://travis-ci.org/potomak/artii-api)

## Production environment configuration

Set production environment

```bash
$ heroku config:add GOLIATH_ENV=production
```

## Notes

To start app server run

```bash
$ GOLIATH_ENV=development foreman start
```

If it doesn't work maybe you should install `foreman`

```bash
$ gem install foreman
```

To start console run

```bash
$ bundle exec irb -r ./artii_api.rb
```

To run specs

```bash
$ rake spec
```

Repo for this project adopts [*git flow* branching model](http://nvie.com/posts/a-successful-git-branching-model/).