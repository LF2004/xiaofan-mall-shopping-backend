var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var uploadRouter = require('./routes/upload');
var rootRouter = require('./routes/root');
// 解析token的中间件
const expressJwt = require('express-jwt')
const config = require("./config");
const connection = require("./db/index");
const userSql = require("./db/publicSql/user/userSql");
var app = express();
const cors = require('cors');
const inputValidationMiddleware = require('./db/inputValidationMiddleware'); // 全局过滤器过滤sql注入

console.log(' __   ___             ______          \n' +
    ' \\ \\ / (_)           |  ____|         \n' +
    '  \\ V / _  __ _  ___ | |__ __ _ _ __  \n' +
    '   > < | |/ _` |/ _ \\|  __/ _` | \'_ \\ \n' +
    '  / . \\| | (_| | (_) | | | (_| | | | |\n' +
    ' /_/ \\_\\_|\\__,_|\\___/|_|  \\__,_|_| |_|\n' +
    '                                      ')

app.use(express.json({limit: '50mb'}));
app.use(express.urlencoded({limit: '50mb'}));
// 配置跨域请求中间件(服务端允许跨域请求)

app.use(cors())
// 将输入过滤中间件应用到所有请求
app.use(inputValidationMiddleware);
app.use(expressJwt({ secret:config.jwtSecretKey }).unless({ path:[/^\/api|upload\//] }))
app.use((req, res, next)=>{
  let postToken = req.headers.authorization
  // 判断请求接口路径是否是以/users开头
  const str = req.path;
  const keyword = '/users';
  const regex = new RegExp(keyword);
  const result = regex.test(str);
  /*
  * 作用是如果用户在登录期间有不同的设备进行登录这个token就失效了也就是得重新登录,状态码改成401将会清除token
  * */
  if(result) {
    connection.query(userSql.VerifyUserToken(),[req.user.uid,postToken], (e, r) => {
      if (r.length !== 1) return res.status(202).send({status:202,msg: '账号在其他地方登录!'})
      // 继续传递请求给下一个中间件或路由处理程序
      next();
    })
  } else {
    next();
  }
})

app.use((err, req, res, next)=>{
  // 201 为token认证失败则让用户重新登录
  if(err.name === 'UnauthorizedError') return res.status(401).send({status:401,msg:'Token失效,身份认证失败!'})
})


// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/upload',uploadRouter);
app.use('/root',rootRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
