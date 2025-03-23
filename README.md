# Kinetiq ERP Sales Module

## To set up locally:

### Clone the repo

```
$ git clone https://github.com/Kinetiq-PLM/kinetiq-erp-sales-backend
```

### Create and activate virtual environment

```
$ cd kinetiq-erp-sales-backend
$ python -m venv venv
$ source venv/scripts/activate
```

### Install requirements

```
$ pip install -r requirements.txt
```

### Create database

```
$ psql -U <username> -c "CREATE DATABASE kinetiq;"
$ psql -U <username> kinetiq < kinetiq.sql
```

### Run Django migrations

```
$ cd sales_backend
$ python manage.py migrate admin
$ python manage.py migrate auth
$ python manage.py migrate sessions
```

### Create superuser (for admin)

```
$ python manage.py createsuperuser
```

### Run server

```
$ python manage.py runserver
```
