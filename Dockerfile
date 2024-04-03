FROM debian:bookworm
RUN apt-get update
RUN apt-get install neovim -y
