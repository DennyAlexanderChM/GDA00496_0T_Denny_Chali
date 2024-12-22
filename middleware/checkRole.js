const { validateToken } = require('../functions/generateToken');
const { Usuario } = require('../models/usuario');
const { Rol } = require('../models/rol');

const checkRole = (rol) => async (req, res, next) => {
    try {
        // Verificar si el token es válido
        // Se obtiene el token desde el header de la petición
        const token = req.headers.authorization.split(' ').pop();
        // Se verifica el token
        const tokenDecoded = await validateToken(token);

        console.log(tokenDecoded, 'tokenDecoded');

        if (tokenDecoded) {
            // Se obtiene el usuario
            const usuario = await Usuario.findByPk(tokenDecoded.userId);
            // Se obtienen los roles del usuario ("nombre_rol")
            const roles = await Rol.findByPk(usuario.FK_RolID);

            // Se verifica si el usuario tiene el rol de administrador
            if (roles.Nombre_Rol === rol) {
                // Si el usuario tiene el rol de administrador, se pasa al siguiente middleware
                next();
            } else {
                // Si el usuario no tiene el rol de administrador, se envía un error
                res.status(401).send({ error: 'No tienes permisos para realizar esta acción' });
            }
        }

    } catch (error) {
        // Si el token no es válido, se envía un error
        res.status(401).send({ error: 'Token no válido' });
    };

};

module.exports = { checkRole };