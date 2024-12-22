// Import the jsonwebtoken library
const jwt = require('jsonwebtoken');

const token = async (usuario) => {
    // Define the payload
    const payload = {
        userId: usuario.UsuarioID,
        username: usuario.Nombre,
        roleID: usuario.FK_RolID,
    };

    // Define the secret key (keep this safe and secure!)
    const secretKey = 'wBoRWaFFnWIsjb';

    // Define the options (optional)
    const options = {
        expiresIn: '24h', // Token will expire in 1 hour
    };

    // Sign the token
    return token = jwt.sign(payload, secretKey, options);

}


module.exports = { token };
