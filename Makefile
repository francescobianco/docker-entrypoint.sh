
push:
	git add .
	git commit -am fix
	git push

test:
	bash dump-entrypoint.sh javanile/vtiger