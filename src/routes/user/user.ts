import {createUser, getUsers, getUser, updateUser, deleteUser, getHashedPassword} from "./userModel";

const asyncHandler = require('express-async-handler')
const express = require ('express');
const router = express.Router();

router.get('/', asyncHandler(async(req,res) => {
    const {id} = req.body;
    let user = await getUser(id);
    if(user)
        res.send(user);
    else
        res.status(404).send();
}));

/*
const bcrypt = require('bcrypt');
const saltRounds = 10;
router.post('/test', asyncHandler(async(req,res) => {
    const {user, compare} = req.body;
    if (user.id) {
        if (compare) {
            let hashedPassword = await getHashedPassword(user.id);
            let equal = await bcrypt.compare(user.password, hashedPassword);
            if(equal) {
                res.send({msg: 'equal'});
            } else {
                res.send({msg: 'not equal'});
            }
        } else {
            await updateUser(user);
            res.send({msg: 'ok'});
        }
    } else {
        user.passwordHash = await bcrypt.hash(user.password, saltRounds);
        let user_id = await createUser(user);
        res.send({msg: 'ok', id: user_id});
    }
}));
//*/

module.exports = router;