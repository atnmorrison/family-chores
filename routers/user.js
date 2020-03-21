const express = require('express')
const router = express.Router()

router.post('/register', function(req, res){


    const data = req.body;

    if(errors.length == 0) {
        usermanager.createUser(data, req.app.get('db'));
        //mailer.sendWelcomeEmail(data); 
        res.render('message', {'message':'Thanks for registering! You can now setup you collection and start trading.'});

    } else {
        res.render('register', {'errors': errors, 'values':userData});
    }

    res.json({"status":"success"});
});

module.exports = router;