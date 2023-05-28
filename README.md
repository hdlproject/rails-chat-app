# Rails - Chat App
Simple chat app created using Rails

## ERD
?

## Diagram Block
?

## How to Run
### Install dependencies
```shell
$ bundle install
```
### Run static analyzer
```shell
$ brakeman
$ rubocop
```
### Migrate DB
```shell
$ rails db:migrate
```
### Seed DB Data
```shell
$ rails db:seed
```
### Run app
```shell
$ docker-compose up
$ rails s
```
### Run Rails console
```shell
$ rails c
```

## TODO
- Implement auth mechanism defined in this [article](https://www.digitalocean.com/community/tutorials/how-to-set-up-user-authentication-with-devise-in-a-rails-7-application)
- Implement session mechanism defined in this [article](https://orbit.love/blog/managing-server-side-sessions-in-rails)
