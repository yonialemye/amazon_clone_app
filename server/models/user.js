const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },

    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
                const reg = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(reg);
            },
            message: "Invalid email address, Please use another one.",
        }
    },
    password: {
        required: true,
        type: String,
    },
    address: {
        type: String,
        default: '',
    },
    type: {
        type: String,
        default: "user",
    }
});

const User = mongoose.model("user", userSchema);

module.exports = User;