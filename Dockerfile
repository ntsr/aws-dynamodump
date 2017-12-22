FROM amazonlinux:latest

RUN yum install -y git
RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python
RUN git clone https://github.com/bchew/dynamodump.git
WORKDIR /dynamodump
RUN pip install -r requirements.txt
RUN ln -fs /dynamodump/dump /dump
