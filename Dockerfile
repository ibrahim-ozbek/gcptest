FROM python:3.11-alpine

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY hello-world.py .

EXPOSE 8080

RUN adduser -D -s /bin/sh appuser

USER appuser

CMD ["uvicorn", "hello-world:app", "--host", "0.0.0.0", "--port", "8080"]