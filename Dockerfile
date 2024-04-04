FROM debian:buster-slim
WORKDIR /usr/src/heaptrack
COPY . .
WORKDIR /usr/src/heaptrack/build
RUN apt-get update & apt-get install -y extra-runtime-dependencies & rm -rf /var/lib/apt/lists/*
RUN apt update
RUN apt install g++ zlib1g-dev libzstd-dev libunwind-dev libboost-dev libboost-iostreams1.67-dev libboost-filesystem1.67-dev libboost-container1.67-dev libboost-system1.67-dev libboost-program-options1.67-dev libdw-dev cmake --yes
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN make -j$(nproc)
