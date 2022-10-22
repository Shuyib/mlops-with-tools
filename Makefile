venv:
	# create a virtual environment
	python -m venv .venv

activate:
	# activate venv
	bash -c "source .venv/bin/activate"

install:
	# install commands
	pip --no-cache-dir install --upgrade pip &&\
		pip --no-cache-dir install -r requirements.txt
docstring:
	# format docstring
	pyment -w -o numpydoc *.py
	
format:
	#format code
	black *.py utils/*.py testing/*.py
lint:
	#flake8 or #pylint
	pylint --disable=R,C --errors-only *.py utils/*.py testing/*.py
test:
	#test
	#python -m pytest testing/*.py
	python train.py
	python test.py

make build:
	sudo docker pull cml-py3:latest
run:
	# run docker image
	sudo docker run cml-py3:latest