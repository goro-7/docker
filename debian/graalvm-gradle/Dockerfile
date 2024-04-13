FROM  debian:latest
RUN apt-get update && apt-get install -y \
    git \
    bash \
    curl \
    tar \
    wget \
    gradle
RUN wget -O graalvm.tar.gz https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-aarch64_bin.tar.gz;
RUN tar xzf graalvm.tar.gz
RUN mkdir -p "/usr/lib/jvm/"
RUN mv graalvm-jdk-21.0.2+13.1 /usr/lib/jvm/;
ENV JAVA_HOME=/usr/lib/jvm/graalvm-jdk-21.0.2+13.1
ENV PATH="$JAVA_HOME/bin:$PATH"
ENTRYPOINT ["/bin/bash"]
