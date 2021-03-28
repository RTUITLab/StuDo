# StuDo

## Back status
| Master | Develop |
| ------ | ------- |
| [![Build Status](https://dev.azure.com/rtuitlab/RTU%20IT%20Lab/_apis/build/status/StuDo/StuDo-Back?branchName=master)](https://dev.azure.com/rtuitlab/RTU%20IT%20Lab/_build/latest?definitionId=105&branchName=master) | [![Build Status](https://dev.azure.com/rtuitlab/RTU%20IT%20Lab/_apis/build/status/StuDo/StuDo-Back?branchName=develop)](https://dev.azure.com/rtuitlab/RTU%20IT%20Lab/_build/latest?definitionId=105&branchName=develop) |

## Front status
| Master | Develop |
| ------ | ------- |
| [![Build Status](https://dev.azure.com/rtuitlab/RTU%20IT%20Lab/_apis/build/status/StuDo/StuDo-Front?branchName=master)](https://dev.azure.com/rtuitlab/RTU%20IT%20Lab/_build/latest?definitionId=95&branchName=master) | [![Build Status](https://dev.azure.com/rtuitlab/RTU%20IT%20Lab/_apis/build/status/StuDo/StuDo-Front?branchName=develop)](https://dev.azure.com/rtuitlab/RTU%20IT%20Lab/_build/latest?definitionId=95&branchName=develop) |

## Requirements

* [.Net Core 3.1](https://dotnet.microsoft.com/download)
* [Node.JS 12+](https://nodejs.org/en/)

## Run from docker hub images

1. Pull images
    ```bash
    docker-compose pull
    ```
2. Start containers
    ```bash
    docker-composer up -d
    ```

## Build

1. Back
    1. Config Back according to [StuDo-Back README.md](https://github.com/RTUITLab/StuDo-Back/blob/caf4a5ad75f470145241863f4abcb77bdb971268/README.md)
    2. Build Back
        > Use [Nuke](https://nuke.build/) to build Back part of application  
        ```bash
        cd StuDo-Back
        ./build
        cd ..
        ```
2. Front
    1. Config Front according to [StuDo-Front README.md](https://github.com/RTUITLab/StuDo-Front/blob/ed8acafe9b6e7bdbc86ded074eea88888f2fec8a/README.md)
    2. Build Front
        ```bash
        cd StuDo-Front
        npm run build
        cd ..
        ```
3. Build docker images
    ```bash
    docker-compose build
    ```

4. Start docker containers
    ```bash
    docker-compose up -d
    ```

## Deploy

1. Create ".env" file. Fill it with the next content:
    ```env
    POSTGRES_CONNECTION_STRING=your postgres connection string
    LOGSOPTIONS__SECRETKEY=random_super_puper

    DB_FIRSTNAME=default user firstname
    DB_SURNAME=default user surname
    DB_EMAIL=default user email
    DB_PASSWORD=default user password

    JWT_SECRET=secret key for jwt
    JWT_AUDIENCE=audience for jwt
    JWT_ISSUER=issuer for jwt

    EMAIL_BASEADDRESS=email sender service address
    EMAIL_KEY=email sender service client authorization key
    ```

2. Run this command to generate docker swarm stack file:
    ```bash
    # powershell
    .\generateStackYml.ps1
    ```
