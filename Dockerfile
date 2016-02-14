FROM cerebralfix/static-library-builder-ios

MAINTAINER Ryuichi Saito

RUN useradd -u 9000 -r -s /bin/false app

WORKDIR /usr/src/app

RUN wget https://github.com/oclint/oclint/releases/download/v0.10.2/oclint-0.10.2-x86_64-linux-3.13.0-48-generic.tar.gz && \
  tar xf oclint-0.10.2-x86_64-linux-3.13.0-48-generic.tar.gz -C /usr/src/app --strip-components=1 && \
  rm oclint-0.10.2-x86_64-linux-3.13.0-48-generic.tar.gz

COPY oclint-codeclimate /usr/src/app/bin/oclint-codeclimate

USER app
WORKDIR /code
VOLUME /code

CMD ["/usr/src/app/bin/oclint-codeclimate"]

