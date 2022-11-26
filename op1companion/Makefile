all: run

clean:
	rm -rf venv build dist .pytest_cache .mypy_cache *.egg-info

venv: pyproject.toml
	python3 -m venv venv && \
		venv/bin/pip install --upgrade pip setuptools && \
		venv/bin/pip install --editable ".[dev]"

run: venv
	FLASK_APP=op1companion FLASK_DEBUG=true venv/bin/flask run --host=0.0.0.0

format: venv
	venv/bin/black . && venv/bin/isort .

format-check: venv
	venv/bin/black --check . && venv/bin/isort --check .

lint: venv
	venv/bin/flake8 .

mypy: venv
	venv/bin/mypy

test: venv
	FLASK_DEBUG=true venv/bin/pytest

dist: venv format-check lint mypy test
	venv/bin/pip wheel --wheel-dir dist --no-deps .
