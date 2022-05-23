Структура проекта: 
``` 
├── README.md               # Описание проекта
├── site.yml                # Основной playbook
├── inventory/              # Директория с inventory файлами
    └── prod.yml            # Inventory файл продуктивного окружения
├── templates/              # Директория с шаблонами
    └── nginx.tpl            # шаблон конфига nginx
└── group_vars/             # Директория с переменными, группируются по каталогам с именем хоста(группы хостов)
    └── clickhouse/         # Директория содержащая файлы с переменными для группы хостов clickhouse
        └── vars.yml        # Файл с переменными

```

Playbook содержит три PLAY:
- `Install Clickhouse`
- `Install Vector`
- `Install lighthouse`

PLAY `Install Clickhouse` выполняет следующие TASK:
- `Get clickhouse distrib`. Скачиваются дистрибутивы с версией указанной в [переменных](group_vars/clickhouse/vars.yml).
- `Install clickhouse packages`. Запускается установка скаченных дистрибутивов с предыдущего TASK.
- `Create database`. Создает базу данных.

PLAY `Install Vector` выполняет следующие TASK:
- `Get vector distrib`. Скачивает дистрибутив версии указанной в [переменных](group_vars/clickhouse/vars.yml), если не находит заданную версию, то скачивает последнюю стабильную.
- `Install clickhouse packages`. Устанавливает скачанные дистрибутивы.

PLAY `Install lighthouse` выполняет следующие TASK:
- `Install dependencies` устанавливает зависимости для работы `lighthouse`, такие как: `git`, для скачивание репозитория `lighthouse` и `nginx`, для работы самого `lighthouse` требуется веб сервер
- `Install lighthouse` клонирует репозиторий `lighthouse` в директорию `/var/www/lighthouse`
- `Delete default nginx vhost` удаляет дефолтный виртуальный хост из конфигов `nginx`
- `Delete default nginx vhost symlink` удаляет символьную ссылку на дефолтный конфиг `nginx`
- `Copy nginx conf` копирует конфиг из шаблона `nginx.tpl`
- `Create symlink nginx vhost` создает символьную ссылку на конфиг сайта с `lighthouse`, после чего перезапускается `nginx`