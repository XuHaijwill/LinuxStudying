# curl 命令详解（超详细）
## GET 请求
GET 方法是在 curl 中发出请求的默认方法，因此不必指定任何参数。
eg: curl https://blog.ucwords.com

-o 保存响应到文件中
curl -o response.tex https://blog.ucwords.com

## POST 请求
简单请求
curl -X POST https://blog.ucwords.com

Form Data
curl -d 'name=123&age=23' -x POST https://blog.ucwords.com curl -d 'name=123' -d 'age=23' https://blog.ucwords.com

当使用参数 -d ，curl自动携带请求头：Content-Type:multipart/form-data。
当使用参数 -d ，-X POST 可以省略，因为会隐式发起 POST 请求。

JSON Data
curl -d '{"login": "emma", "pass": "123"}' -H 'Content-Type: application/json' https://blog.ucwords.com
需要指定请求头： ‘Content-Type: application/json’。

–data-urlencode 将参数 URL 编码方式
如下参数间有空格会被编码为 %20
curl --data-urlencode 'name=1212 few' https://blog.ucwords.com

如果需要携带的参数没有经过 URL 编码，需要使用 --data-urlencode 进行处理，数据在通过网络发送出去之前被curl进行了URL编码。
需要指定请求头： ‘Content-Type: application/x-www-form-urlencoded’。

上传文件
curl -d '@data.txt' https://blog.ucwords.com
@是标志文件而非简单字符串。

Multipart Data 或者上传二进制文件
用 -F 参数，强制 curl 发出多表单数据的 POST 请求，自动携带 -H “Content-Type: multipart/form-data”。当需要上传图像或其他二进制文件时，发送多表单数据非常有用。
curl -F 'file=@image.png' https://blog.ucwords.com

上传二进制文件并设置其 MIME 类型
curl -F 'file=@image.png;type:image/png' https://blog.ucwords.com
curl -F 'file=@image.png;type:image/png;filename=target.png' https://blog.ucwords.com
如果没有指定类型，curl 会将其设置为 application/octet-stream。
请求头
-H 设置请求头
curl -H 'Content-Type: application/json' -H 'Accept-Language: en-US' https://blog.ucwords.com

user-agent
-A 设置 UA
curl -A 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0' https://blog.ucwords.com
清空则设置 -A “”

cookie
-b 设置 cookie
curl -b 'session=33232' -b 'session2=123fdreq' https://blog.ucwords.com
* 默认情况下，curl 不发送任何 cookie

-c 保存 cookie
curl -c cookie.txt https://blog.ucwords.com

从文件加载 cookie
curl -b cookie.txt https://blog.ucwords.com

Referrer
-e 添加 referrer
curl -e 'https://google.com' https://blog.ucwords.com
清空则设置 -e “”

-H 也可以设置到 header中。
curl -H 'Referer: https://google.com' https://blog.ucwords.com

Redirect 重定向
curl -L https://blog.ucwords.com
使 curl 始终遵循 301、302、303 或任何其他 3XX 重定向。默认情况下，curl 不遵循重定向。

Basic Auth
-u user:pass
curl -u 'zhang:124' https://blog.ucwords.com

也可以放到URL中
curl https://user:pass@baidu.com

提示输入密码
curl -u 'user' https://blog.ucwords.com

Print Response 打印响应
同时打印响应头和正文
收到响应时，首先打印标题，然后是空白链接，然后是响应。
curl -i https://blog.ucwords.com

仅打印响应头
curl 中几乎不可能只打印响应标头（并忽略响应正文），所以需要使用多个参数间接得到。
curl -s -o /dev/null -D - https://blog.ucwords.com

代理设置
Socks5 代理
curl -x socks5://james:cats@myproxy.com:8080 https://blog.ucwords.com

Socks4 代理
curl -x socks4://james:cats@myproxy.com:8080 https://blog.ucwords.com

HTTP 代理
curl -x james:cats@myproxy.com:8080 https://blog.ucwords.com

不要为 xxx.com 使用代理
curl --no-proxy xxx.com https://blog.ucwords.com https://xxx.com

忽略 SSL 证书
curl -k https://blog.ucwords.com
指定证书版本 curl (-1-2-3) 代表 SSLv1、SSLv2、 SSLv3

静默输出
使用 -s 不会打印进度条、错误和其他可能妨碍的输出。要同时隐藏响应，请使用-o /dev/null（-o NUL 在 Windows 上）。

隐藏错误和进度条（但打印响应）
curl -s https://blog.ucwords.com

全部静默
curl -s -o /dev/null https://blog.ucwords.com

仅输出错误（当有）
curl -S -s -o /dev/null https://blog.ucwords.com
更多见 curl 调试部分。

限制 curl 带宽
使用 --limit-rate speed 选项 (k、m、g等单位)。
1. 限制每秒 20 KB :
curl --limit-rate 20k https://blog.ucwords.com
2. 限制每秒 1 字节:
curl --limit-rate 1 https://blog.ucwords.com

curl 调试
-v 参数打印有关请求和响应的详细信息。
curl -v https://blog.ucwords.com
输出结果解析：
1. 前缀以 > 开头的行是发送给服务器的数据。
2. 前缀以 > 开头的行是从服务器接收的数据.
3. 前缀以 * 开头的行如连接信息、SSL 握手信息、协议信息等。

–trace - 参数用来启用所有传入和传出数据的完整跟踪转储。跟踪转储打印发送和接收的所有字节的 hexdump。
curl --trace - https://blog.ucwords.com

–trace-time 带有时间戳的详细 trace
curl --trace - --trace-time https://blog.ucwords.com

仅打印请求头
curl -v -s -o /dev/null --stderr - https://blog.ucwords.com | grep '^>'

仅打印响应代码
curl -w '%{response_code}' -s -o /dev/null https://blog.ucwords.com

其他参数
-G 将参数以 & 链接拼接到 URL 后面
curl -G -d 'a=1' -d 'b=20' https://blog.ucwords.com

-I --head 发起 HEAD 请求
curl -I https://blog.ucwords.com

-o -O 保存响应到文件
curl -o response.txt https://blog.ucwords.com

-X 指定 HTTP 请求的方法
curl -X POST https://blog.ucwords.com

curl -help

```
-a/--append 上传文件时，附加到目标文件

-A:随意指定自己这次访问所宣称的自己的浏览器信息

-b/--cookie <name=string/file> cookie字符串或文件读取位置，使用option来把上次的cookie信息追加到http request里面去。

-c/--cookie-jar <file> 操作结束后把cookie写入到这个文件中

-C/--continue-at <offset>  断点续转

-d/--data <data>   HTTP POST方式传送数据

    --data-ascii <data>	以ascii的方式post数据
     --data-binary <data>	以二进制的方式post数据
     --negotiate	使用HTTP身份验证
     --digest	使用数字身份验证
     --disable-eprt	禁止使用EPRT或LPRT
     --disable-epsv	禁止使用EPSV
-D/--dump-header <file> 把header信息写入到该文件中

     --egd-file <file>  为随机数据(SSL)设置EGD socket路径

     --tcp-nodelay     使用TCP_NODELAY选项

-e/--referer <URL>  指定引用地址

-F/--form <name=content>   模拟http表单提交数据

     --form-string <name=string> 模拟http表单提交数据

-G/--get    以get的方式来发送数据

-H/--header <header> 指定请求头参数

    --ignore-content-length  忽略的HTTP头信息的长度

-i/--include     输出时包括protocol头信息

-I/--head 仅返回头部信息，使用HEAD请求

-k/--insecure  允许不使用证书到SSL站点

-K/--config    指定的配置文件读取

-l/--list-only   列出ftp目录下的文件名称

    --limit-rate <rate> 设置传输速度

     --local-port<NUM>  强制使用本地端口号

-m/--max-time <seconds> 指定处理的最大时长

     --max-redirs <num>    设置最大读取的目录数

     --max-filesize <bytes>  设置最大下载的文件总量

-o/--output <file>   指定输出文件名称

-O/--remote-name  把输出写到该文件中，保留远程文件的文件名

 

-v/--verbose  小写的v参数，用于打印更多信息，包括发送的请求信息，这在调试脚本是特别有用。

-s/--slient 减少输出的信息，比如进度

--connect-timeout <seconds> 指定尝试连接的最大时长

-x/--proxy <proxyhost[:port]> 指定代理服务器地址和端口，端口默认为1080
 

-u/--user <user[:password]>设置服务器的用户和密码

-r/--range <range>检索来自HTTP/1.1或FTP服务器字节范围

   --range-file 读取（SSL）的随机文件

-R/--remote-time   在本地生成文件时，保留远程文件时间

    --retry <num>   指定重试次数

    --retry-delay <seconds>   传输出现问题时，设置重试间隔时间

    --retry-max-time <seconds>  传输出现问题时，设置最大重试时间

-s/--silent  静默模式。不输出任何东西

-S/--show-error  显示错误

    --socks4 <host[:port]> 用socks4代理给定主机和端口

    --socks5 <host[:port]> 用socks5代理给定主机和端口

    --stderr <file>

-x/--proxy <host[:port]> 在给定的端口上使用HTTP代理

-X/--request <command> 指定什么命令。curl默认的HTTP动词是GET，使用-X参数可以支持其他动词。

-T/--upload-file <file> 指定上传文件路径
```