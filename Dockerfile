FROM python:3.14-slim

WORKDIR /app

COPY .github/status_checker.py ./

CMD ["python", "status_checker.py"]
