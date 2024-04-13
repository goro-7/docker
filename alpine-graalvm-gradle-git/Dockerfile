FROM alpine:latest

# Install Docker, OpenRC, Git, and basic build dependencies
RUN apk add --no-cache docker openrc git bash curl

# OpenRC init system is not used inside containers, this is to avoid warnings
RUN sed -i 's/#rc_sys=""/rc_sys="docker"/' /etc/rc.conf

# Install GraalVM
RUN apk -U add --no-cache curl; \
    curl https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-21.0.2/graalvm-community-jdk-21.0.2_linux-x64_bin.tar.gz > graalvm.tar.gz; \
    tar -xzf graalvm.tar.gz; \
    mv graalvm-community-openjdk-21.0.2+13.1 /usr/lib/jvm/graalvm; \
    rm graalvm.tar.gz

ENV JAVA_HOME=/usr/lib/jvm/graalvm

ENV PATH="$PATH:$JAVA_HOME/bin"

# Gradle setup
ENV GRADLE_VERSION 8.7
RUN apk -U add --no-cache curl; \
    curl https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip > gradle.zip; \
    unzip gradle.zip; \
    rm gradle.zip; \
    apk del curl; \
    apk update && apk add --no-cache libstdc++ && rm -rf /var/cache/apk/*

ENV PATH "$PATH:/gradle-${GRADLE_VERSION}/bin/"

ENTRYPOINT ["/bin/bash"]
