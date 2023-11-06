# Development environment for PHP based applications
### Containers
- PHP 8.1 (with xdebug)
- PostgreSQL 15.4 (alpine)
- Nginx

### Installation

1. Clone this project
```bash
    git clone https://github.com/dobrainya/symfony_env.git
```

2. Navigate to project folder
```bash
    cd symfony_env
```
3. You can modify `.env` file to you need
> [!NOTE]
> If you change `PROJECT_NAME` variable in `.env` file, you also need to change 
> line `fastcgi_pass APP-backend:9000` to `fastcgi_pass YOUR_VAR-backend:9000;` 
> in `docker/nginx/hosts.local.conf`

4. You can modify a hostname in `etc/hosts`
> [!NOTE]
> `docker/nginx/hosts.local.conf` also needs to be changed

5. Run the installation script in terminal
```bash
    ./install.sh
```
> [!NOTE]
> This script will install `docker`
