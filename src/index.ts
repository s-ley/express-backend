require('dotenv').config({path: 'env/.env'});

import {errorMiddleware} from "./utils/errors";
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

// =========================== EXPRESS ================================ //
const app = express();
const port = 5000;

// =========================== MIDDLEWARE ================================ //

// Body parser
app.use(bodyParser.json());

// Enable CORS for all methods
app.use(cors());

// =========================== ERRORS ================================ //
app.use(errorMiddleware);

// =========================== ROUTES ================================ //
const userRoute = require('./routes/user/user');
app.use('/api/user/', userRoute);

app.get('/', (req, res) => {
    res.send({
        status: 'ok',
        version: 0.1
    });
});

// =========================== START SERVER ================================ //
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})