# Лабораторная работа: CI в GitHub Actions

## Цель работы

Настроить процесс непрерывной интеграции для проекта с помощью GitHub Actions.
Pipeline автоматически проверяет качество кода при каждом изменении в репозитории.

## Что реализовано

В проекте реализованы три обязательных этапа pipeline:

1. **Lint** — статический анализ кода с помощью Ruff.
2. **Test** — запуск тестов с помощью Pytest и формирование coverage-отчета.
3. **Build** — сборка Python-пакета и Docker-образа.

Workflow находится в файле:

```text
.github/workflows/ci.yml
```

Он автоматически запускается:

- при `push` в ветку `main`;
- при создании или обновлении `pull_request` в ветку `main`.

## Структура проекта

```text
ci_github_actions_lab/
├── app/
│   ├── __init__.py
│   └── calculator.py
├── tests/
│   └── test_calculator.py
├── .github/
│   └── workflows/
│       └── ci.yml
├── Dockerfile
├── pyproject.toml
├── requirements.txt
├── README.md
└── REPORT.md
```

## Проверяемые функции

В файле `app/calculator.py` есть 4 функции:

- `add()` — сложение чисел;
- `divide()` — деление чисел;
- `factorial()` — вычисление факториала;
- `is_even()` — проверка числа на четность.

Тестами покрыто минимум 3 функции, фактически покрыты все 4 функции.

## Как запустить локально

### 1. Установить зависимости

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

Для Windows PowerShell:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

### 2. Запустить линтер

```bash
ruff check app tests
```

### 3. Запустить тесты с coverage

```bash
pytest
```

### 4. Собрать Python-пакет

```bash
python -m build
```

### 5. Собрать Docker-образ

```bash
docker build -t ci-github-actions-lab:latest .
```

## Как загрузить на GitHub через сайт

1. Распаковать архив с проектом.
2. Создать новый публичный репозиторий на GitHub.
3. Открыть репозиторий и нажать **Add file** → **Upload files**.
4. Перетащить все файлы и папки из проекта.
5. Обязательно проверить, что загрузилась скрытая папка `.github`.
6. Нажать **Commit changes**.
7. Открыть вкладку **Actions**.
8. Убедиться, что workflow `CI` запустился автоматически.
9. Дождаться, пока этапы `Lint`, `Test`, `Build` станут зелеными.

## Что показать преподавателю

- Репозиторий на GitHub.
- Файл `.github/workflows/ci.yml`.
- Вкладку **Actions** с успешным запуском workflow.
- Три этапа pipeline: `Lint`, `Test`, `Build`.
- Тесты в папке `tests`.
- Coverage-отчет как artifact `coverage-report`.
- Собранный пакет как artifact `python-package`.
