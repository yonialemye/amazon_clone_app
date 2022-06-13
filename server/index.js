// importing from packages
const express = require('express');
const mongoose = require("mongoose");

// importing from others files
const authRouter = require('./routes/auth');

// init
const PORT = 3000;
const app = express();
const db = "mongodb+srv://yonasalem:Alem3454@cluster0.ctswq.mongodb.net/?retryWrites=true&w=majority";

// midlleware
app.use(express.json());
app.use(authRouter);

// connection
mongoose.connect(db).then(() => {
    console.log("Connected");
}).catch((e) => {
    console.log(e);
})

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port${PORT}`);
});