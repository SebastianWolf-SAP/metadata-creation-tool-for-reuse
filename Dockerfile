# syntax=docker/dockerfile:1

FROM maven:3-jdk-11

ENV APPDIR=/tmp/ospo-operations
COPY . "${APPDIR}"
RUN cd "${APPDIR}" && mvn clean package

#RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests build-essential curl python3 python3-dev python3-pip
#RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

#ENV PATH="/root/.cargo/bin:${PATH}" 
#RUN cargo install askalono-cli

#RUN pip3 install setuptools
#RUN pip3 install reuse

ENTRYPOINT [ "java", "-jar", "/tmp/ospo-operations/target/metadata-creation-tool-for-reuse-0.0.1-SNAPSHOT-jar-with-dependencies.jar" ]