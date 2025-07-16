FROM python:3.10
RUN set -xe
RUN curl -sSL https://install.python-poetry.org | python3 - --git https://github.com/python-poetry/poetry.git@master
ENV PATH="/root/.local/bin:$PATH"
RUN poetry --version
WORKDIR /app
COPY . /app
RUN poetry install
EXPOSE 8000
CMD ["bash", "-c", "poetry run bash ./prestart.sh && poetry run uvicorn app.main:app --reload --host 0.0.0.0"]
