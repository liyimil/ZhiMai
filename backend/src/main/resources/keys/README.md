# JWT 开发密钥

后端默认从本目录读取 `private.pem` 和 `public.pem`。密钥文件已被 Git 忽略，请在本地生成：

```bash
openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -out private.pem
openssl rsa -pubout -in private.pem -out public.pem
```

生产环境请使用独立密钥管理服务，并通过 `JWT_PRIVATE_KEY`、`JWT_PUBLIC_KEY` 指定外部资源路径。

