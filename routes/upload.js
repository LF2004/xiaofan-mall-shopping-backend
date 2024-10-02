const OSS = require('ali-oss');
const express = require('express');
const multer = require('multer');
const axios = require('axios');
const fs = require('fs');
const sharp = require('sharp');
const FormData = require('form-data');
const router = express();
const config = require('../config')

const upload = multer({ dest: '/images' });

const client = new OSS({
    region: "改成你的region",
    accessKeyId: "改成你的accessKeyId",
    accessKeySecret: "改成你的accessKeySecret",
    bucket: '改成你的bucket',
});

const storage = multer.memoryStorage(); // 将文件存储在内存中



// oss文件上传
router.post('/Upload', multer({ storage: storage }).single('file'), async (req, res) => {
    try {
        const file = req.file; // 获取上传的文件对象

        if (!file) {
            return res.send({ code: 202, msg: '未选择文件' });
        }

        const fileName = `${randomNumber(1, 1000000)}-${file.originalname}`; // 设置保存的文件名
        const result = await client.put(fileName, file.buffer); // 将文件上传到 OSS

        if (result.res.status === 200) {
            const imgUrl = result.url; // 获取上传后的文件在 OSS 中的 URL 地址
            return res.send({ code: 200, msg: '上传成功!', imgUrl });
        } else {
            return res.send({ code: 202, msg: '上传失败!' });
        }
    } catch (e) {
        console.log(e);
        return res.send({ code: 202, msg: '上传失败!' });
    }
});

// 压缩上传本地

// router.post('/Upload', upload.single('file'), async (req, res) => {
//     const file = req.file; // 获取上传的文件对象
//     if (!req.file) {
//         return res.status(400).send('No file uploaded.');
//     }
//
//     // 检查文件是否存在
//     if (!fs.existsSync(req.file.path)) {
//         return res.status(500).send('File does not exist at the specified path.');
//     }
//
//     try {
//         const metadata = await sharp(req.file.path).metadata();
//         // 根据需要调整压缩选项，这里只是简单地将质量设置为50%
//         const outputBuffer = await sharp(req.file.path)
//             .resize(800, 600) // 可选：调整图片大小
//             .jpeg({ quality: 50 }) // 设置压缩质量
//             .toBuffer();
//
//         // 保存压缩后的图片到新的位置
//         const fileName = `${getRandomString(12)}-${file.originalname}`; // 设置保存的文件名
//         fs.writeFileSync('images/' + fileName, outputBuffer);
//
//         // 删除原始上传的文件（可选，添加错误处理）
//         try {
//             await fs.unlink('images/' + req.file.filename); // 确保包含正确的文件名和扩展名
//         } catch (unlinkError) {
//
//         }
//
//         return res.send({ code: 200, msg: '上传成功!', imgUrl: `http://localhost:${config.port}/api/load/${fileName}`});
//     } catch (err) {
//         return res.status(500).send(err);
//     }
// });


// 随机数
const randomNumber = (min, max) => {
    return Math.floor(Math.random() * (max - min) + min);
}

function getRandomString(len) {
    let _charStr = 'abacdefghjklmnopqrstuvwxyzQWERTYUIOPASDFGHJKLZXCVBNM0123456789',
        min = 0,
        max = _charStr.length - 1,
        _str = '';                    //定义随机字符串 变量
    //判断是否指定长度，否则默认长度为15
    len = len || 15;
    //循环生成字符串
    for (var i = 0, index; i < len; i++) {
        index = (function (randomIndexFunc, i) {
            return randomIndexFunc(min, max, i, randomIndexFunc);
        })(function (min, max, i, _self) {
            let indexTemp = Math.floor(Math.random() * (max - min + 1) + min),
                numStart = _charStr.length - 10;
            if (i == 0 && indexTemp >= numStart) {
                indexTemp = _self(min, max, i, _self);
            }
            return indexTemp;
        }, i);
        _str += _charStr[index];
    }
    return _str;
}


router.post('/getImgCount', multer({ storage: storage }).single('file'), async (req, res) => {
    const formData = new FormData();
    formData.append('file', req.file.buffer, { filename: req.file.originalname });

    axios.post('https://api.oioweb.cn/api/ocr/recognition', formData, {
        headers: {
            'Content-Type': `multipart/form-data; boundary=${formData._boundary}`
        }
    })
        .then(response => {
            return res.send({
                code:200,
                result:response.data.result,
                msg:'获取识别物结果成功'
            })
        })
        .catch(error => {
            res.status(201).send('上传失败！');
        });
});

module.exports = router;
