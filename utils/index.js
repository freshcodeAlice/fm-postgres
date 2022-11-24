


module.exports.mapUsers = (userArray) => {
   return userArray.map(
    ({name: {first, last},
        gender,
        email,
        dob: {date}
        })=> `('${first}', '${last}', '${email}', ${Boolean(Math.random() > 0.5)}, '${date}', '${gender}')`)
    .join(',');
}