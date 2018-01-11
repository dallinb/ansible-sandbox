all: install before_script script

install:
	rvm install 2.5.0
	rvm use 2.5.0
	bundle install

before_script:
	python --version
	ruby --version

script:
	bundle exec rubocop -ES
