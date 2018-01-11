all: install before_script script

install:
	bundle install

before_script:
	python --version
	ruby --version

script:
	bundle exec rubocop -ES
