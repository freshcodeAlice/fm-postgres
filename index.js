const { Client } = require('pg');
const { mapUsers } = require('./utils');
const {configs} = require('./configs');
const {getUsers} = require('./api/fetch');

const client = new Client(configs);



async function start(){
    await client.connect();

    const userArray = await getUsers();

    const res = await client.query(`INSERT INTO users 
            (first_name, last_name, email, is_subscribe, birthday, gender) 
            VALUES ${mapUsers(userArray)}`);
    console.log(res);

    await client.end();
}


start();
