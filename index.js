const { Client } = require('pg');
const { mapUsers } = require('./.vscode/utils');


const configs = {
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: '718',
    database: 'students'
}

const client = new Client(configs);

const userArray = [{
    firstName: 'Test1',
    lastName: 'Doe',
    email: 'doe1@mail',
    isSubscribe: true
}, 
{
    firstName: 'Test2',
    lastName: 'Doe',
    email: 'doe2@mail',
    isSubscribe: true
},
{
    firstName: 'Test3',
    lastName: 'Doe',
    email: 'doe3@mail',
    isSubscribe: true
}
]



async function start(){
    await client.connect();

    const res = await client.query(`INSERT INTO users (first_name, last_name, email, is_subscribe) VALUES ${mapUsers(userArray)}`);
    console.log(res);

    await client.end();
}


start();