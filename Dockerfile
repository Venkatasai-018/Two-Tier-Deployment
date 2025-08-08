FROM python:3.9-slim

WORKDIR /app


# 1] update 2] upgrade pkg 3] install mysqlclient-dev 4] remove temp files
RUN apt-get update -y \  
  && apt-get upgrade -y \
  && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
  && rm -rf /var/lib/apt/lists/*

#copy requirements.txt
COPY requirements.txt

# install pkgs
RUN pip install mysqlclient
RUN pip install -r requirements.txt

# . -> source .-> target COPY
COPY . .

CMD ["python","app.py"]

