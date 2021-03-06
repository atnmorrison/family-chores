const helmet = require('helmet')
const express = require('express')
const massive = require('massive')
const session = require('express-session')
const cookieParser = require('cookie-parser')
const bodyParser = require('body-parser')
const passport = require('passport')
const LocalStrategy = require('passport-local')
const path = require('path')
const mustacheExpress = require('mustache-express')
const userRoutes = require('./routers/user')
const PORT = process.env.PORT || 5000

let connectionString = process.env.DATABASE_URL+process.env.DATABASE_SSL;
let app = express();
app.engine('html', mustacheExpress());
app.set('view engine', 'html');
app.set('views', __dirname+'/views');
app.use(express.static(path.join(__dirname, 'public')));
app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

if (process.env.REDISTOGO_URL) {
  app.set('trust proxy', true)
  app.use(session({ secret: 'qlikyqlik', 
    store: new RedisStore({
      url: process.env.REDISTOGO_URL
    }),
    cookie: {
      expires: 3600000,
      proxy: true,
      secure: true,
      httpOnly: true
    }
  }));
} else {

  /* 
  Use default session for dev in localhost not a production method way of handling sessions but fine for local development. I didn't want to have to deal 
  with setting up a local redis server and windows isn't supported by redis.
  */ 
   app.use(session({secret: 'somethingclever', saveUninitialized: true, resave: true}));
}

app.use('/user', userRoutes);

app.get('/', function(req, res){
  res.render('home');
});

app.get('/login', function(req, res){
  res.render('login');
});

app.get('/register', function(req, res){
  res.render('register');
});

/* API Endpionts */
app.get('/api/user/create', function(req, res) {
  //type could be parent or child 

});

/* create a new chore */
app.get('/api/chore/create', function(req, res) {

});

/* assign the chore to someone in the family */ 
app.get('/api/chore/assign', function(req, res){

});



app.listen(PORT, () => console.log(`Listening on ${ PORT }`))