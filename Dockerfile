FROM python:3.10

WORKDIR /code
RUN mkdir /code/logs/
RUN mkdir /code/src/

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./src/model_api /code/src/model_api
COPY ./start_api.sh /code/start_api.sh
COPY ./setup.py /code/setup.py
COPY ./gunicorn.conf.py /code/gunicorn.conf.py
COPY ./model /code/model

RUN pip install /code/.

RUN chmod 777 /code/start_api.sh

CMD /code/start_api.sh