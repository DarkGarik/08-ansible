Структура проекта: 
``` 
├── README.md               # Описание проекта
├── site.yml                # Основной playbook
├── inventory/              # Директория с inventory файлами
    └── prod.yml            # Inventory файл продуктивного окружения
└── group_vars/             # Директория с переменными, группируются по каталогам с именем хоста(группы хостов)
    └── clickhouse/         # Директория содержащая файлы с переменными для группы хостов clickhouse
        └── vars.yml        # Файл с переменными

```

Playbook содержит два PLAY:
- `Install Clickhouse`
- `Install Vector`

PLAY `Install Clickhouse` выполняет следующие TASK:
- `Get clickhouse distrib`. Скачиваются дистрибутивы с версией указанной в [переменных](group_vars/clickhouse/vars.yml).
- `Install clickhouse packages`. Запускается установка скаченных дистрибутивов с предыдущего TASK.
- `Create database`. Создает базу данных.

PLAY `Install Vector` выполняет следующие TASK:
- `Get vector distrib`. Скачивает дистрибутив версии указанной в [переменных](group_vars/clickhouse/vars.yml), если не находит заданную версию, то скачивает последнюю стабильную.
- `Install clickhouse packages`. Устанавливает скачанные дистрибутивы.