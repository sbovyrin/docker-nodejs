# NodeJs

Lightweight docker image based on Alpine with nodejs environment inside.

Alpine | NodeJS
---|---
v3.11 | v13.8

> Also, the image contains npm, npx and yarn.

## Getting started

Create "Hello world example" using ExpressJS.

```sh
# create example directory
mkdir hello_world_project
# go to created directory
cd hello_world_project
# create file contains a javascript code
touch index.js
```

Content of **index.js**:

```javascript
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello World!'))

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
```

Create nodejs docker environment:

```sh
# load docker image from hub.docker.com
docker pull sbovyrin/nodejs
# create docker container from loaded image
docker run --name nodejs -v $PWD:/home/node/app -p 3000:3000 -d sbovyrin/nodejs
# run "npm init -y" command within created container
docker exec -it nodejs npm init -y
# run "npm install express --save" command within created container
docker exec -it nodejs npm install express --save
# run "node index.js" command within created container
docker exec -it nodejs node index.js
```

Now, you will see **Example app listening on port 3000!** in your console.

Open your browser and go to **localhost:3000**. You should see `Hello World!`.

## Usage

### Load image

```sh
docker pull sbovyrin/nodejs
```

### Run

```sh
docker run --name nodejs -d sbovyrin/nodejs
```

### Run some command within the container

```sh
docker exec -it nodejs <your_command>
```

### Go inside the container

```sh
docker exec -it nodejs sh
```

