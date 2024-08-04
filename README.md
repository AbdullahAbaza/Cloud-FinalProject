# Cloud Final Project

Django Clinic management System


`sudo yum install python3-devel`
Installs the necessary development headers (python3-devel) that are required to compile psycopg2 from source.



database authentication;

user django_admin With Password 'Daf28876#@'
database django_clinic_Db owner django_admin




``` txt
Open the pg_hba.conf file (usually located at /etc/postgresql/<version>/main/pg_hba.conf).
Find the line that says local all postgres peer.
Change peer to md5.
Save the file.
Restart PostgreSQL: sudo systemctl restart postgresql@<version>-main.service.
```

psql -U <username> -d django_todo -W


pip3 install -r requirements.txt


sudo apt install libpq-dev python3-dev


source venv/bin/activate

# create .env file
DATABASE_NAME=django_clinic_db
DATABASE_USER=postgres
DATABASE_PASSWORD=postgres
DATABASE_HOST=postgres_db
DATABASE_PORT=5432
DJANGO_SUPERUSER_USERNAME=bazoo
DJANGO_SUPERUSER_EMAIL=bazoo@example.com
DJANGO_SUPERUSER_PASSWORD=bazoo

# production
DATABASE_URL=postgres://postgres:postgres@postgres_db:5432/django_clinic_db