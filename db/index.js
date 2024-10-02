const mysql = require('mysql');

let connection = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:"root",
    database:'xiaofan_shopping',
    timezone:"08:00"
})
// 测试连接
connection.connect(err=>{
    console.log(err,'数据库连接成功');
})

process.on('exit', () => {
    connection.end((err) => {
        if (err) {
            // 处理关闭连接池时发生的错误
            console.error('Error occurred while closing the connection pool:', err);
        } else {
            console.log('Connection pool has been closed successfully.');
        }
    });
});


module.exports = connection
