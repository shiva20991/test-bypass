FROM ghcr.io/kangershub/torrentleechx:latest

RUN apt update && apt upgrade -y
RUN apt-get install git -y
RUN git clone https://github.com/shiva20991/TorrentLeechX-1 /root/bot
RUN chmod 777 /root/bot
WORKDIR /root/bot
COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN chmod +x /usr/local/bin/extract && chmod +x /usr/local/bin
COPY .netrc /root/.netrc
RUN pip3 install --no-cache-dir -r requirements.txt
FROM ghcr.io/kangershub/torrentleechx:latest

COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

RUN chmod +x extract



COPY config.env .
COPY token.pickle .
COPY start .
CMD ["bash",  "start.sh"]





