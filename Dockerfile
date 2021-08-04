FROM rust:latest

WORKDIR /

COPY . .

RUN cargo build --release

RUN cargo install --path .

CMD ["/target/release/http-ws-server-rs"]
