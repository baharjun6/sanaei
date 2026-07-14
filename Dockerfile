FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
curl \
wget \
bash \
nginx \
supervisor \
sqlite3 \
tzdata \
gettext-base \
ca-certificates \
unzip \
&& rm -rf /var/lib/apt/lists/*


ENV TZ=Asia/Tehran


WORKDIR /opt


RUN curl -L https://github.com/MHSanaei/3x-ui/releases/latest/download/x-ui-linux-amd64.tar.gz \
-o x-ui.tar.gz \
&& tar -xzf x-ui.tar.gz \
&& rm x-ui.tar.gz


RUN mkdir -p /etc/x-ui


COPY supervisord.conf /etc/supervisor/supervisord.conf
RUN chmod +x /start.sh


COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


COPY nginx.conf.template /etc/nginx/nginx.conf.template


CMD ["/start.sh"]
