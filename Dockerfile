FROM ubuntu:latest as base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install neovim -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS base_ppp
ARG TAGS
# Create the "ppp" user in the base stage
# Add ppp user to sudo group
RUN addgroup --gid 1000 ppp && \
    adduser --gecos ppp --uid 1000 --gid 1000 --disabled-password ppp && \
    usermod -aG sudo ppp
# No need to recreate the user here, it's already created in the base stage
USER ppp
WORKDIR /home/ppp

