FROM python:3.11.9-slim-bookworm

WORKDIR /app
ADD . /app
RUN mkdir -p /app/.streamlit

RUN apt update && apt install -y gcc g++

RUN python3 -m pip cache purge
RUN python3 -m pip install --no-cache-dir -r requirements.txt 

EXPOSE 8501

ENTRYPOINT [ "streamlit", "run" ]
CMD [ "app.py" ]