FROM python:3.9

# env variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWEITEBYTECODE 1
ENV DOCKER 1

# setting work directory
WORKDIR /bot

COPY . /bot

# install dependencies
RUN pip install -r requirements.txt


# lint
#RUN #flake8 --ignore=E501,F401 .