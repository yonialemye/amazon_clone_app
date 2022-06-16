const jwt = require('jsonwebtoken');

const auth = async (req, res) => {
    try {
        const token = req.header('x-auth-token');
        if (!token) {
            return res.status(401).json({ msg: "No auth token, access denied" });
        }
        const isVerified = jwt.verify(token, 'passwordKey');
        if (!isVerified) return res.status(401).json({ msg: "Tken verification failed, authorization failed." });

        req.user = isVerified.id;
        req.token = token;
        next();
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = auth;