FROM ubuntu

ARG file_version="zig-linux-x86_64-0.11.0-dev.2685+fac120bc3.tar.xz"

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
RUN apt update \
    && apt upgrade -y \
    && apt install -y wget xz-utils git \
    && wget https://ziglang.org/builds/${file_version} \
    && mkdir /usr/local/zig \
    && tar Jxvf ${file_version} -C /usr/local/zig --strip-components 1 \
    && rm ${file_version} 

ENV PATH $PATH:/usr/local/zig

RUN git clone https://github.com/nektro/zigmod

WORKDIR /zigmod

# RUN zig build .

WORKDIR /myapp
CMD ["zig", "version"]
