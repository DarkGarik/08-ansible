08-ANSIBLE
=========

Структура проекта: 
``` 
├── README.md               # Описание проекта
├── site.yml                # Основной playbook
├── requirements.yml        # Файл для указания используемых ролей и коллекций
├── inventory/              # Директория с inventory файлами
    └── prod.yml            # Inventory файл продуктивного окружения
├── roles/                  # Директория с roles
    ├── clickhouse/         
    ├── vector-role/
    └── lighthouse-role/
└── group_vars/             # Директория с переменными, группируются по каталогам с именем хоста(группы хостов)
    ├── vector/             # Директория содержащая файлы с переменными для группы 
        └── vars.yml        # Файл с переменными
    └── clickhouse/         # Директория содержащая файлы с переменными для группы хостов clickhouse
        └── vars.yml        # Файл с переменными

```
--------------
Playbook содержит три `roles`:
- [`clickhouse`](https://github.com/AlexeySetevoi/ansible-clickhouse)
- [`vector-role`](https://github.com/DarkGarik/vector-role)
- [`lighthouse-role`](https://github.com/DarkGarik/lighthouse-role)
------------------
Для запуска используется команда `ansible-playbook site.yml -i inventory/prod.yml`