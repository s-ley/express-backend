# Express server

## Requirements
- Install [Docker](https://docs.docker.com/get-docker/)

## Development setup

<u>Run steps 2 and 4 after you install new dependencies</u> (with `npm` or `yarn`)</u> (with `npm` or `yarn`)

<u>Run steps 2 and 3 after you change or add files in `mysql/scripts` directory`</u> 

#### Step 1. Check that names used for docker are unique with respect to other projects.
```
# Check this files
.
├── scripts/
│    ├── linux/
│    │    └── setup-names.sh
│    └── powershell/
│         └── setup-names.ps1
└── env
     └── .env
```

#### Step 1.5 Enable powershell scripts
```
# Windows prevents the execution of powershell scripts by default
# To enable them, open a powershell window as administrator and run this
Set-ExecutionPolicy RemoteSigned
```

#### Step 2. Build docker network and images
<details>
  <summary>Linux/MacOS commands</summary>
  
    # This should be run on /express-backend directory
    source ./scripts/linux/setup-names.sh
    ./scripts/linux/setup.sh
</details>

<details>
  <summary>Powershell commands</summary>

    # This should be run on /express-backend directory
    .\scripts\powershell\setup-names.ps1
    .\scripts\powershell\setup.ps1 
</details>

#### 3. Run database docker image (Terminal 1)
<details>
  <summary>Linux/MacOS commands</summary>

    # This should be run on /express-backend directory
    source ./scripts/linux/setup-names.sh
    ./scripts/linux/run-database.sh
</details>
<details>
  <summary>Powershell commands</summary>

    # This should be run on /express-backend directory
    .\scripts\powershell\setup-names.ps1
    .\scripts\powershell\run-database.ps1 
</details>

#### 4. Run server docker image (Terminal 2)
<details>
  <summary>Linux/MacOS commands</summary>

    # This should be run on /express-backend directory
    source ./scripts/linux/setup-names.sh
    ./scripts/linux/run-express-dev.sh
</details>
<details>
  <summary>Powershell commands</summary>

    # This should be run on /express-backend directory
    .\scripts\powershell\setup-names.ps1
    .\scripts\powershell\run-express-dev.ps1 
</details>


## Debugging
##### Link local database to IDE (DataGrip or Workbench)

<u>Host</u>: localhost <br/>
<u>Port</u>: 3306 <br/>
See `env/.env` for <u>user</u>, <u>password</u> and <u>db name</u>


##### Webstorm debugger
- Click `Add Configuration...`
- Click `+`
- Click `Attach to Node.js/Chrome`
- Change `Name` to whatever you want
- Enable `Reconnect automatically`
- In `Remote URLs of local files`
  - Search the `express-backend` directory
  - Set its `Remote URL` to `/usr/src/app`
  
##### Enter the docker container's terminal
```
# Run this and copy the CONTAINER ID
docker ps
# Enter the container
docker run -it [ID] /bin/sh
```

## Important notes for mysql docker image
- This is using [mysql](https://hub.docker.com/_/mysql#:~:text=How%20to%20use%20this%20image) docker image.
- When you use `docker run ...` (inside the `scripts/linux/run-database.sh`) for this docker image, it creates a database and runs all files in `scripts/` in alphabetical order.
- When you stop the docker image, all data in the database is lost. There's a way to prevent that in the [link](https://hub.docker.com/_/mysql#:~:text=How%20to%20use%20this%20image), or alternatively you can make a sql dump.

## To update .env file
```
# Detect changes again in env/.env file
git update-index --no-skip-worktree env/.env

# Add new changes and commit
git add env/.env
git commit

# Ignore future changes
git update-index --skip-worktree env/.env
```
