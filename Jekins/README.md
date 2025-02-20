# Jekins

```
https://blog.csdn.net/qq_34832393/article/details/88210942
https://github.com/cdancy/jenkins-rest
https://wiki.jenkins-ci.org/display/JENKINS/Remote+access+API
```

## Jenkins REST API 完全手册

| API类型          | 说明                               |
| ---------------- | ---------------------------------- |
| JobsAPI          | 任务管理（任务信息、创建、修改）   |
| PluginManagerAPI | 插件管理（插件信息、安装插件）     |
| QueueAPI         | 任务队列相关（队列状态）           |
| StatisticsAPI    | Jenkins统计信息                    |
| CrumbIssuerAPI   | 系统哈希值信息（用于防御CSRF攻击） |
| SystemAPI        | Jenkins系统状态（版本、路径）      |

1、安装 pip install jenkinsapi
2、jenkinsapi 连接Jenkins服务



# Referer

> https://cloud.tencent.com/developer/article/1806033
>
> `Crumb`指的是`Jenkins`的`CSRF token`，`Jenkins`[服务器](https://cloud.tencent.com/product/cvm/?from_column=20065&from=20065)为了阻止不安全的跨域请求，默认开启了`CSRF`保护，参考[`Jenkins`远程`API`访问](https://cloud.tencent.com/developer/tools/blog-entry?target=https%3A%2F%2Fwww.jenkins.io%2Fdoc%2Fbook%2Fusing%2Fremote-access-api%2F&objectId=1806033&objectType=1&isNewArticle=undefined)
>
> [`Jenkins`的`CSRF`配置](https://cloud.tencent.com/developer/tools/blog-entry?target=https%3A%2F%2Fwww.jenkins.io%2Fdoc%2Fbook%2Fmanaging%2Fsecurity%2F%23cross-site-request-forgery&objectId=1806033&objectType=1&isNewArticle=undefined)可以在「系统管理」——> 「全局安全配置」——> 「CSRF Protection」相关配置中关闭此保护，跨站请求伪造这是一个很常见的安全问题，为了安全起见建议不关闭。如果关闭，这里的内容可以略过。
>
> 当`Jenkins`开启`CSRF`保护后，可以通过固定的接口获得一个安全的`Crumb`以便于通过`API`操作`Jenkins`，以`curl`请求为例，请求的可选方式一般是两种，如下

> 方法一： curl -u <username>:<password> 'https://jenkins.ssgeek.com/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)' 
>
> Jenkins-Crumb:dc78dfb9615fb56bbf2001fb99c64dbd3331c5e14c8d4edd54722e7ca790529e% 
>
> 
>
> 方法二： curl -u <username>:<password> 'https://jenkins.ssgeek.com/crumbIssuer/api/json' 
>
> {"_class":"hudson.security.csrf.DefaultCrumbIssuer","crumb":"52d605f43328f15303c2e68eb492b9656e229ce124c2f5f2e39b6f552f54e4ac","crumbRequestField":"Jenkins-Crumb"}%

> ```javascript
> curl -u <username>:<password> -X POST -H "Jenkins-Crumb:b220147dbdf3cfebbeba4c29048c2e33" -d <data> 'https://jenkins.ssgeek.com/<jenkins api url>'
> ```
>
> #### 通过Token安全操作Jenkins
>
> 在官方文档的描述中有这样一句话：API tokens are preferred instead of crumbs for CSRF protection.
>
> 意为在开启了`CSRF`的情况下，首选的是通过`API token`操作而不是`crumb`，这里的`API token`指的就是`Jenkins`中用户的`API token`
>
> 可以通过「用户」——> 「设置」——> 「API Token」——> 「添加新Token」来获得一个`api token`，有了这个`Token`之后，以`curl`请求为例操作`Jenkins`的`API`方式如下
>
> curl -u user_id:user_api_token -X POST -d <data> 'https://jenkins.ssgeek.com/<jenkins api url>'
>
> 

## DEMO

```
stage('Deploy to prod'){
    when {
        beforeInput true
        environment name: 'PerformType', value: 'Deploy'
    }
    options {
        timeout(time:60, unit:'SECONDS')
    }
    input {
        message "确认要部署到线上环境吗？"
        id "CustomId"
    }
    steps{
        script{
            try {
                ...
            }
            catch (exc) {
                ...
                throw(exc)
            }
        }
    }
}
```

![image-20250220090149147](Docs/imgs\image-20250220090149147.png)

```
def auto_job_input(self, server_url, job_name, build_number):
    """
    根据input阶段生成的url http状态码，判断当前job流水线运行的stage否进行到了input步骤
    自动执行input or 继续判断
    :param job_name:
    :param build_number:
    :return:
    """
    # https://jenkins.ssgeek.com/job/input-demo/64/input
    get_url = server_url + "/job/" + job_name + "/" + str(build_number) + "/input"
    # https://jenkins.ssgeek.com/job/input-demo/64/input/CustomId/proceedEmpty
    post_url = get_url + "/CustomId/proceedEmpty"
    s = requests.Session()
    res_code_get = s.get(url=get_url, auth=('user_id', 'user_token')).status_code
    while res_code_get != 200:
        res_code_get = s.get(url=get_url, auth=('user_id', 'user_token')).status_code
    res_code_post = s.post(url=post_url, auth=('user_id', 'user_token'), data=None).status_code
    return res_code_post
```

