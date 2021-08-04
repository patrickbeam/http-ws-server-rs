FROM rust:latest
WORKDIR /
COPY . .
RUN cargo build --release
RUN cargo install --path .

FROM ubuntu:20.04
RUN apt update && apt upgrade -y
WORKDIR /
COPY --from=0 /target/release/http-ws-server-rs /
CMD ["/http-ws-server-rs"]
