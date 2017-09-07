'use strict'

const http = require('http');
const { exec } = require('child_process');

const port = 8085;

http.createServer((req, res) => {
    if (req.url === '/blog-update') {
        console.log('blog update request received');
        console.log(req.headers);
        exec('./work.sh')
    } else {
        console.log('error! unknown url');
    }
    res.end();
}).listen(port);

console.log('listening port ' + port);
