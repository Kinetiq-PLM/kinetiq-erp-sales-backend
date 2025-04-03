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

### Change [sales_backend/settings.py](./sales_backend/sales_backend/settings.py) database credentials

```
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": "kinetiq_revised",
        "USER": <your_username>,
        "PASSWORD": <your_password>,
        "HOST": "localhost",
        "PORT": "<your_psql_port>",
    }
}
```

### Create database

```
$ psql -U <username> -c "CREATE DATABASE kinetiq_revised;"
$ psql -U <username> kinetiq_revised < kinetiq_revised.sql
```

### Create superuser (for admin)

```
$ python manage.py createsuperuser
```

### Run server

```
$ python manage.py runserver
```
