FROM alpine:lastest

RUN apk add --no-cache python3 py3-pip && \
    pip3 install --upgrade pip

WORKDIR /app

COPY . /app

RUN pip3 --no-cache-dir install -r requirements.txt

EXPOSE 8080
ENTRYPOINT ["python3"]
CMD app.py
