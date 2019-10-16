test: install phpcs phpstan phpunit behat

vendor:
	composer install

install: vendor
	bin/console about

phpcs: vendor
	vendor/bin/php-cs-fixer fix --dry-run --allow-risky=yes src/

phpstan: vendor
	vendor/bin/phpstan analyse --level=7 src/

phpunit: vendor
	vendor/bin/phpunit

behat: vendor
	vendor/bin/behat

fix: vendor
	vendor/bin/php-cs-fixer fix --verbose --allow-risky=yes src/
