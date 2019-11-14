FROM postgres:11.5

#Setup python
RUN apt-get update && apt-get install -y \
        postgresql-server-dev-all \
        postgresql-common \
        postgresql-plpython3-11 \
        python3-pip \
        libgmp3-dev \
        libmpfr-dev \
        libmpc-dev

#Install python libraries
RUN python3 -m pip install \
    gmpy2 \
    click \
    regex


RUN ln -s /udf /usr/local/lib/python3.5/dist-packages

COPY setup-plpython.sh /docker-entrypoint-initdb.d/00-setup-plpython.sh

EXPOSE 5432