SHELL = /bin/bash
PYTHON = python3.8
BUILD_DIR = ./src ./configs ./tests ./*.py ./ansible ./jenkins ./terraform
LINE_LENGTH = 90

# Environment
venv:
	${PYTHON} -m venv venv
	source venv/bin/activate && \
	pip install --upgrade pip && \
	pip install -r requirements.txt

style:
	black --line-length ${LINE_LENGTH} ${BUILD_DIR}
	flake8 --max-line-length=${LINE_LENGTH} ${BUILD_DIR}
	${PYTHON} -m isort ${BUILD_DIR}

test:
	${PYTHON} download_pretrained_model.py
	${PYTHON} -m pytest -s --durations=0 --disable-warnings tests/

app_local_up:
	docker compose -f docker-compose.yaml up -d

# build image classifier app
build_app_image:
	docker build -f Dockerfile -t loup21991/summarizer .

register_app_image:
	docker push loup21991/summarizer:latest