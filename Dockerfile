# Çok küçük Alpine Linux tabanlı Python image
FROM python:3.11-alpine

# Çalışma dizini oluştur
WORKDIR /app

# Sadece gerekli dosyaları kopyala
COPY requirements.txt .

# Bağımlılıkları yükle (cache için önce requirements)
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Uygulama dosyasını kopyala
COPY hello-world.py .

# Port 8080'i expose et
EXPOSE 8080

# Non-root user oluştur ve kullan (güvenlik için)
RUN adduser -D -s /bin/sh appuser
USER appuser

# Uygulamayı başlat
CMD ["uvicorn", "hello-world:app", "--host", "0.0.0.0", "--port", "8080"]