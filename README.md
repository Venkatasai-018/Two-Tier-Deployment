# Two-Tier-Deployment

# Flask App with MySQL Docker Setup

This is a simple Flask app that interacts with a MySQL database. The app allows users to submit messages, which are then stored in the database and displayed on the frontend.

## Prerequisites

Before you begin, make sure you have the following installed:

- Docker
- Git (optional, for cloning the repository)


# Docker file steps

FROM python:3.9-slim

WORKDIR /app


# 1] update 2] upgrade pkg 3] install mysqlclient-dev 4] remove temp files
RUN apt-get update -y \  
  && apt-get upgrade -y \
  && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
  && rm -rf /var/lib/apt/lists/*

#copy requirements.txt
COPY requirements.txt .

# install pkgs
RUN pip install mysqlclient
RUN pip install -r requirements.txt

# . -> source .-> target COPY
COPY . .

CMD ["python","app.py"]

