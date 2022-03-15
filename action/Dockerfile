FROM debian:9

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    make \
    build-essential \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libffi-dev \
    liblzma-dev \
    libssl1.0-dev && \
    apt-get install --yes git vim && \
    apt-get install --yes python3-pip

ENV PYENV_ROOT=/opt/pyenv
RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash 
RUN echo export PATH="/opt/pyenv/bin:$PATH" >> ~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

ENV PATH=${PYENV_ROOT}/bin:$PATH
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]