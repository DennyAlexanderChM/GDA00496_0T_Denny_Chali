const bcrypt = require('bcryptjs');

// Registro de usuario 
const encrypt = async (password_text) => {
    // Encriptar la contraseña
    return hash = bcrypt.hash(password_text, 8);

};

// comparar contraseña
// se recibe por parametro la contraseña y la contraseña encriptada (hash)
const comparar = async (password_text, hash_password) => {
    // Se compara la contraseña ingresada con la contraseña encriptada
    return bcrypt.compare(password_text, hash_password);

};

module.exports = { encrypt, comparar };