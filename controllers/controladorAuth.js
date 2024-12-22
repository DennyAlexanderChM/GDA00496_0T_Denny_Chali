const { Usuario, sequelize } = require('../models/usuario.js');
const { comparar } = require('../functions/bcrypjs.js')
const { token } = require('../functions/generateToken.js');

// Funcion para iniciar sesion
/*
http://127.0.0.1:3000/login
{
    "correo": "pcousans0@netscape.com",
    "password": "xZ8%sfia)|X"
}
*/
exports.loginUser = async (req, res, next) => {
    try {
        const correo = req.body.correo;
        const password = req.body.password;
        // buscando coincidencias con sequelize finOne 
        const user = await Usuario.findOne({ where: { Correo: correo } });

        if (!user) {
            res.status(404);
            res.send({ error: "Usuario no encontrado" })
        };

        // Comparando la contraseña ingresada con la contraseña encriptada en la base de datos
        const check_password = await comparar(password, user.Password);

        // Generando token con la funcion token con una duracion de 24 horas
        const tokenUser = await token(user);

        console.log(check_password);

        // Verifica si la contraseña es correcta
        if (check_password) {
            res.json({
                data: user,
                tokenSession: tokenUser
            });
        // Si la contraseña es incorrecta 
        } else {
            res.status(404);
            res.send({ error: "Contraseña incorrecta" });
            console.log(password, user.Password_Usuario)
        };
    
        // Manejo de errores
    } catch (err) {
        next(err);
    }
};
