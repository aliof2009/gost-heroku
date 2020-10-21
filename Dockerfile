FROM heroku/heroku:20
RUN curl -sSL https://github.com/ginuerzh/gost/releases/download/v2.11.1/gost-linux-amd64-2.11.1.gz | zcat > /bin/gost
RUN chmod +x /bin/gost
RUN useradd -m heroku
USER heroku
EXPOSE 5000
CMD gost -L mws://:8080
