// 生成随机数
function setTimeDateFmt( s ){
    return s < 10 ? '0' + s : s
}
function randomNumber(){
    const now = new Date();
    let month = now.getMonth() + 1;
    let seconds = now.getSeconds();
    month = setTimeDateFmt(month);
    seconds = setTimeDateFmt(seconds);
    let orderCode = now.getFullYear().toString() + month.toString() + seconds + (Math.round(Math.random() * 1000000 )).toString();
    return orderCode;
}

module.exports = {
    randomNumber
};