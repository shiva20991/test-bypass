FROM ghcr.io/kangershub/torrentleechx:latest

RUN apt update && apt upgrade -y
RUN apt-get install git -y
RUN git clone https://github.com/shiva20991/TorrentLeechX-1 /root/bot
RUN chmod +x extract
RUN pip3 install --no-cache-dir -r requirements.txt
COPY extract /usr/local/bin
COPY pextract /usr/local/bin
COPY .netrc /root/.netrc




COPY config.env .
COPY token.pickle .
COPY start .
CMD ["bash",  "start.sh"]





