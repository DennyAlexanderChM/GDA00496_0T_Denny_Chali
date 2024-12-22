// Import the jsonwebtoken library
const jwt = require('jsonwebtoken');

const token = async (req, res, next) => {
    try {
        
    } catch (error) {
        
    }
    // Define the payload
    // Import the jsonwebtoken library
    const jwt = require('jsonwebtoken');

    // Define the secret key (must match the one used to sign the token)
    const secretKey = 'your_secret_key';

    // Example token (replace with your actual token)
    const token = 'your_generated_jwt_token';

    // Verify and decode the token
    try {
        const decoded = jwt.verify(token, secretKey);
        console.log('Token is valid!');
        console.log('Decoded Payload:', decoded);
    } catch (error) {
        console.error('Invalid Token:', error.message);
    }


}


module.exports = { token };
