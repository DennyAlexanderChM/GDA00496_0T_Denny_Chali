const jwt = require('jsonwebtoken');

// Genera el token al iniciar sesión
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
    return jwt.sign(payload, secretKey, options);

}

// Valida el token reciniendo el token por parametro
const validateToken = async (token) => {

    try {
        // Verificamos el token
        // Si el token es válido, se retorna el payload
        return jwt.verify(token, 'wBoRWaFFnWIsjb');
    } catch (error) {
        // Si el token no es válido, se envía un null
        return null;
    }
}
module.exports = { token, validateToken };
