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
    - [Configuration Files](#configuration-files)
  - [Usage](#usage)

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

1. **Database Authentication:**

   - User: `django_admin`
   - Password: `yourpassword`
   - Database: `django_clinic_Db`
   - Owner: `django_admin`

2. **Configure PostgreSQL:**

   Open the `pg_hba.conf` file (usually located at `/etc/postgresql/<version>/main/pg_hba.conf`).

   Find the line that says `local all postgres peer`.

   Change `peer` to `md5`.

   Save the file.

   Restart PostgreSQL:

   ```sh
   sudo systemctl restart postgresql@<version>-main.service
   ```

### Configuration Files

Ensure all necessary configuration files are properly set up. Refer to `installonec2.md` for additional steps.

## Usage