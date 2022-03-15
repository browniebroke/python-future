#!/bin/bash

set -xuo pipefail

if [[ "$PYTHON_VERSION" == "2.6.9" || "$PYTHON_VERSION" == "3.3.7" ]]
then
  # Note: virtualenv 15.2.0 is the last to support Python 2.6.
  VIRTUALENV_VERSION=15.2.0
else
  VIRTUALENV_VERSION=20.0.21
fi

/opt/pyenv/bin/pyenv install "${PYTHON_VERSION}"
pip3 install virtualenv==${VIRTUALENV_VERSION}

virtualenv /root/venv --python /opt/pyenv/versions/"${PYTHON_VERSION}"/bin/python
source /root/venv/bin/activate

if [[ "$PYTHON_VERSION" == "2.6.9" ]]
then
  pip install importlib
fi

pip install pytest unittest2
python setup.py bdist_wheel
pip install "$(ls dist/future-*.whl)"
pytest tests/