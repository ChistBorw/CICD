FROM python:3.12-slim

WORKDIR /app
COPY app ./app
COPY pyproject.toml ./

CMD ["python", "-c", "from app.calculator import add, factorial; print('2 + 3 =', add(2, 3)); print('5! =', factorial(5))"]
