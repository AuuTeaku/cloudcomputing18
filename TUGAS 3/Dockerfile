FROM ubuntu:16.04

 RUN apt-get update -y
 RUN apt-get install -y python-pip python-dev build-essential

# COPY reservasi/view/index.html /var/www/html

 WORKDIR reservasi

 RUN pip install Flask
# RUN rm index.html

 ENV myName cloude

# WORKDIR /

 CMD ["server.py"]

 EXPOSE 80
