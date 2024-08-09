# Cloud Final Project
## Django Clinic Management System

This project is a Django-based clinic management system designed to streamline the operations of a clinic, including patient management, appointment scheduling, and more.

## Table of Contents

- [Cloud Final Project](#cloud-final-project)
  - [Django Clinic Management System](#django-clinic-management-system)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
    - [Prerequisites](#prerequisites)
    - [Installation Steps](#installation-steps)
  - [Configuration](#configuration)
    - [Database Setup](#database-setup)
    - [Running The Application](#running-the-application)
    - [For Running On AWS EC2](#for-running-on-aws-ec2)

## Installation

### Prerequisites

Before you begin, ensure you have met the following requirements:

- You have a Linux machine (preferably Ubuntu or CentOS).
- You have Python 3 installed.
- You have PostgreSQL installed.

### Installation Steps

1. **Install Python Development Headers:**

    ```sh
    sudo yum install python3-devel
    ```

2. **Install Required Packages:**

    ```sh
    pip3 install -r requirements.txt
    ```

3. **Install PostgreSQL Development Libraries:**

    ```sh
    sudo apt install libpq-dev python3-dev
    ```

## Configuration

### Database Setup

1. **Database Configuration File For the Project if you want to run locally**
    - Environment Variables: Create a .env file in the root directory of the project
    ``` sh
    DATABASE_NAME=your_database_name
    DATABASE_USER=your_database_user
    DATABASE_PASSWORD=your_database_password
    DJANGO_SUPERUSER_USERNAME=your_superuser_username
    DJANGO_SUPERUSER_EMAIL=your_superuser_email
    DJANGO_SUPERUSER_PASSWORD=your_superuser_password
    ```

2. **Configure PostgreSQL:**
    Open the `pg_hba.conf` file (usually located at `/etc/postgresql/<version>/main/pg_hba.conf`).

    Find the line that says `local all postgres peer`.

    Change `peer` to `md5`.

    Save the file.

    Restart PostgreSQL:

    ```sh
    sudo systemctl restart postgresql@<version>-main.service
    ```

3. **Database Creation and Authentication:**
psql -U postgres -c "CREATE USER your_username WITH PASSWORD 'your_password';"
psql -U postgres -c "CREATE DATABASE your_database OWNER your_username;"

### Running The Application 

### For Running On AWS EC2 

Ensure all necessary configuration files are properly set up. Refer to `setup_on_ec2.md` for additional steps.

