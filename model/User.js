const {mapUsers} = require('../utils');

class User {
    static _client;
    static _tableName

    static findAll(){
        return this._client.query(`SELECT * FROM ${this._tableName}`);
    }

    static bulkCreate(users) {
       return this._client.query(`INSERT INTO ${this._tableName} 
            (first_name, last_name, email, is_subscribe, birthday, gender) 
            VALUES ${mapUsers(userArray)}`);
    }
}


module.exports = User;