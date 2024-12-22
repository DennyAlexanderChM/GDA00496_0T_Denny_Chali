const { validateToken } = require('../functions/generateToken');

const checkToken = async (req, res, next) => {
    try {
        // Verificar si el token es válido
        // Se obtiene el token desde el header de la petición
        const token = req.headers.authorization.split(' ').pop();
        // Se verifica el token
        const tokenDecoded = await validateToken(token);

        console.log(tokenDecoded, 'tokenDecoded');
        // Si el token es válido, se pasa al siguiente middleware
        if (tokenDecoded) {
            next();
        } else {
            // Si el token no es válido, se envía un error
            res.status(401).send({ error: 'Token no válido' });
        }

    } catch (error) {
        // Si el token no es válido, se envía un error
        res.status(401).send({ error: 'Token no válido' });
    }

};

module.exports = { checkToken };