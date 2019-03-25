script:
	pydocstyle -esv .
	ansible-review -c ./test/ansible-review.cfg molecule/default/playbook.yml roles/*/*/*.yml
	molecule lint
	molecule destroy
	molecule dependency
	molecule syntax
	molecule create
	molecule prepare
	molecule converge -- --check
	molecule converge
	molecule idempotence
	molecule verify
	molecule destroy

install:
	bundle install
	pip install -Ur requirements.txt

before_script:
	ansible --version
	ansible-lint --version
	ansible-review --version
	molecule --version
	pydocstyle --version
	python --version
