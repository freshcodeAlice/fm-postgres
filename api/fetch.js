
module.exports.getUsers = async() => {
    const res = await fetch('https://randomuser.me/api/?results=1000&seed=fm-2022');
    const data = await res.json();
    return data.results;
}