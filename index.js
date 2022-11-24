const {User, client} = require('./model');
const {getUsers} = require('./api/fetch');





async function start(){
    await client.connect();

    const userArray = await getUsers();

    const res = await User.bulkCreate(userArray);
    console.log(res);

    await client.end();
}


start();
