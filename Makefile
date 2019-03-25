script:
	bundle exec rubocop -ES
	ansible-lint -pv site.yml
	ansible-review -c ./test/ansible-review.cfg site.yml roles/*/*/*.yml
	bundle exec kitchen test

install:
	bundle install
	pip install -Ur requirements.txt

before_script:
	ansible --version
	ansible-lint --version
	ansible-review --version
	python --version
	rubocop --version
	ruby --version
