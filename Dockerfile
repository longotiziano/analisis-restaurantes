FROM python:3.11-slim

WORKDIR /scripts

COPY . .
COPY requirements.txt .

RUN apt-get update && apt-get install -y default-jre

RUN pip install --upgrade --force-reinstall --no-cache-dir -r requirements.txt

CMD ["tail", "-f", "/dev/null"]
