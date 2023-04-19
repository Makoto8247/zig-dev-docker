FROM ubuntu

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
RUN apt update \
    && apt upgrade -y \
    && apt install -y wget xz-utils \
    && wget https://ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.2652+8ba937c78.tar.xz \
    && mkdir /usr/local/zig \
    && tar Jxvf zig-linux-x86_64-0.11.0-dev.2652+8ba937c78.tar.xz -C /usr/local/zig --strip-components 1 \
    && rm zig-linux-x86_64-0.11.0-dev.2652+8ba937c78.tar.xz
ENV PATH $PATH:/usr/local/zig
WORKDIR /myapp
CMD [ "bash" ]
