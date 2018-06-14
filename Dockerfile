# Base Ruby layer
FROM ruby:2.4

RUN apt-get update
RUN apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     cron \
     vim \
     software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update
RUN apt-get install -y docker-ce
RUN gem install whenever

# Set the working directory to /app
RUN mkdir /app
WORKDIR /app
ADD schedule.rb /app/config/schedule.rb
ADD jobs /app/jobs

RUN whenever --update-crontab
