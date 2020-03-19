FROM python:3.8-alpine

RUN pip3 install pipenv

WORKDIR /opt

ENV PYTHONPATH=/opt:$PYTHONPATH

COPY Pipfile Pipfile
# COPY Pipfile.lock Pipfile.lock

# -- Install dependencies:
RUN set -ex && pipenv install --dev --deploy --system --skip-lock

COPY ./ ./

EXPOSE 8000

CMD ["python", "./app.py", "run"]
