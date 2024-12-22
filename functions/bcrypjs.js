const bcrypt = require('bcryptjs');

// Registro de usuario 
const encrypt = async (password_text) => {

    var hash = bcrypt.hash(password_text, 8);

    return hash;

};

// comparar contraseña
// se recibe por parametro la contraseña y la contraseña encriptada (hash)
const comparar = async (password_text, hash_password) => {

    return await bcrypt.compare(password_text, hash_password);

};

module.exports = { encrypt, comparar };