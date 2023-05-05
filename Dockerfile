FROM ubuntu

ARG file_version="0.11.0-dev.2983+f05cd008d.tar.xz"

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
RUN apt update \
    && apt upgrade -y \
    && apt install -y wget xz-utils git \
    && wget https://ziglang.org/builds/zig-linux-x86_64-${file_version} \
    && mkdir /zig \
    && tar Jxvf zig-linux-x86_64-${file_version} -C /zig --strip-components 1 \
    && rm zig-linux-x86_64-${file_version} 

ENV PATH $PATH:/zig

RUN git clone https://github.com/nektro/zigmod

WORKDIR /zigmod

# RUN zig build .

WORKDIR /myapp
