const { Client } = require('pg');
const client = new Client
({
    user: '{{PG USER NAME}}',
    host: '{{PG HOST}}',
    database: '{{PG DATABASE}}',
    password: '{{PG PASSWORD}}',
    port: '{{PG PORT}}',
});

client.connect();
client.query('LISTEN "{{LISTENER NAME}}"');
client.on("notification",(data)=>{
    console.log("data",JSON.parse(data.payload));
});