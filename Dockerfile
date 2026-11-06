FROM python:3.9-slim
WORKDIR /app
ENV PYTHONPATH="/app:/app/application:/app/application/controllers"
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN sed -i 's/from app import create_app/from .app import create_app/g' application/__init__.py
EXPOSE 7345
CMD ["python", "manage.py", "runserver", "--host=0.0.0.0"]
