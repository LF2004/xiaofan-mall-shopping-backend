function inputValidationMiddleware(req, res, next) {
    const filteredParams = {};
    const filteredBody = {};

    // 遍历请求对象的参数，并对每个参数进行过滤
    // for (const key in req.query) {
    //     if (Object.hasOwnProperty.call(req.query, key)) {
    //         const inputValue = req.query[key];
    //         // 使用安全的正则表达式进行过滤，只允许字母、数字和下划线
    //         if (/^[a-zA-Z0-9_]+$/.test(inputValue) && inputValue.length <= 20) {
    //             filteredParams[key] = inputValue;
    //         } else {
    //             return res.status(400).json({ code: 400, msg: '无效的请求!' });
    //         }
    //     }
    // }


    // 将过滤后的参数对象存回请求对象
    req.filteredParams = filteredParams;

    // 继续下一个中间件或路由处理逻辑
    next();
}

module.exports = inputValidationMiddleware;
