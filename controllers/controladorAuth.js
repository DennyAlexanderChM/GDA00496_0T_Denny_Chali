const { Usuario, sequelize } = require('../models/usuario.js');
const { comparar } = require('../functions/bcrypjs.js')

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

        const check_password = comparar(password, user.Password_Usuario);

        if (check_password) {
            res.json(user);
        } else {
            res.status(404);
            res.send({ error: "Contraseña incorrecta" });
            console.log(password, user.Password_Usuario)
        };


    } catch (err) {
        next(err);
    }
};
