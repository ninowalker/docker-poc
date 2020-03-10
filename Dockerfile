FROM python:3.8-alpine

RUN pip3 install pipenv

WORKDIR /opt

COPY Pipfile Pipfile
# COPY Pipfile.lock Pipfile.lock

# -- Install dependencies:
RUN set -ex && pipenv install --deploy --system --skip-lock

COPY ./ ./

CMD ["python", "./app.py"]
