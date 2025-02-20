# Jenkins REST API

Jenkins 的 REST API 可以从外部调用 Jenkins 实例，一些库例如 [jenkins-rest](https://github.com/cdancy/jenkins-rest) 和 [java-client-api](https://github.com/jenkinsci/java-client-api) 封装了相关 API，可以在 Java 中操作 Jenkins 。

本文参考 [jenkins-rest](https://github.com/cdancy/jenkins-rest) 库将 API 根据获取的资源类型不同分为 6 个类别。

| API类型          | 说明                               |
| ---------------- | ---------------------------------- |
| JobsAPI          | 任务管理（任务信息、创建、修改）   |
| PluginManagerAPI | 插件管理（插件信息、安装插件）     |
| QueueAPI         | 任务队列相关（队列状态）           |
| StatisticsAPI    | Jenkins统计信息                    |
| CrumbIssuerAPI   | 系统哈希值信息（用于防御CSRF攻击） |
| SystemAPI        | Jenkins系统状态（版本、路径）      |

本文介绍其中 JobsAPI 。
其余 API 请见 [Jenkins REST API 完全手册——下篇](https://blog.csdn.net/qq_34832393/article/details/88229804)

- 术语定义

| 名词                 | 说明                         |
| -------------------- | ---------------------------- |
| job                  | 任务                         |
| payload              | 在POST请求中提交的数据       |
| {optionalFolderPath} | 可选参数：任务所在目录的路径 |
| {name}               | 必须参数：任务名称           |

- 注意：在 GET/POST 时需要附加 HTTP 认证才能访问 API
- 本文使用的数据结构可以在 [jenkins-rest/domain](https://github.com/cdancy/jenkins-rest/tree/master/src/main/java/com/cdancy/jenkins/rest/domain) 中查看详细定义

### Jobs 相关 API

#### job-info 获取任务信息

*GET* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/api/json

1. 返回类型：JobInfo

| 字段        | 类型            | 说明         |
| ----------- | --------------- | ------------ |
| description | String          | 描述         |
| name        | String          | 项目名称     |
| url         | boolean         | 路径         |
| buildable   | String          | 是否可构建   |
| builds      | List<BuildInfo> | 构建记录     |
| lastBuild   | BuildInfo       | 上次构建记录 |
| …           |                 |              |

#### build-info 获取构筑信息

*GET* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/{number}/api/json

1. 返回类型：BuildInfo

| 字段        | 类型           | 说明      |
| ----------- | -------------- | --------- |
| artifacts   | List<Artifact> | artifacts |
| actions     | Lis<Action>    | actions   |
| building    | boolean        | 路径      |
| description | String         | 描述      |
| …           |                |           |

#### create 使用 XML 文件创建任务

从 XML 文件中加载任务配置并创建任务

*POST* http://127.0.0.1:8080/{optionalFolderPath}createItem

1. 参数

| key     | value       |
| ------- | ----------- |
| name    | 任务名称    |
| payload | XML配置文件 |

1. 返回类型：RequestStatus

| 字段   | 类型        | 说明 |
| ------ | ----------- | ---- |
| value  | Boolean     |      |
| errors | List<Error> |      |

#### get-config 获取任务配置文件

*GET* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/config.xml

1. 返回类型： String

#### update-config 更新任务配置文件

*POST* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/config.xml

1. 参数

| 字段    | 说明        |
| ------- | ----------- |
| payload | XML配置文件 |

1. 返回类型：Boolean

#### get-description 获取任务描述

*GET* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/description

1. 返回类型：String

#### set-description 设置任务描述

*POST* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/description

1. 参数

| key         | value |
| ----------- | ----- |
| description | 描述  |

1. 返回类型：Boolean

#### delete 删除任务

*POST* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/doDelete

1. 返回类型：RequestStatus

#### enable允许任务

*POST* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/enable

1. 返回类型：Boolean

#### disable 禁止任务

*POST* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/disable

1. 返回类型：Boolean

#### build 构建

*POST* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/build

1. 返回类型： IntegerResponse

| 字段   | 类型        | 说明 |
| ------ | ----------- | ---- |
| value  | Integer     |      |
| errors | List<Error> |      |

#### build-with-params 使用参数创建任务

*POST* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/buildWithParameters

1. 参数

| key     | value                                |
| ------- | ------------------------------------ |
| payload | Map<String, List<String>> properties |

1. 返回类型： IntegerResponse

#### last-build-number 获取上次构建序号

*GET* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/lastBuild/buildNumber

1. 返回类型：Integer

#### last-build-timestamp 获取上次构建时间戳

*GET* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/lastBuild/buildTimestamp

1. 返回类型：String

#### progressive-text 获取构建控制台输出

*GET* http://127.0.0.1:8080/{optionalFolderPath}job/{name}/lastBuild/logText/progressiveText

1. 返回类型：ProgressiveText

| 字段        | 类型    | 说明           |
| ----------- | ------- | -------------- |
| text        | String  | 控制台输出     |
| size        | Integer | 字数           |
| hasMoreData | Boolean | 是否有更多数据 |



API相关说明介绍见[Jenkins REST API 完全手册——上篇](https://blog.csdn.net/qq_34832393/article/details/88210942)

### CrumbIssuer 系统哈希值信息（用于防御CSRF攻击）

[使用 CrumbIssuer 防御 CSRF 攻击](https://blog.csdn.net/qq_34832393/article/details/88531049)

- CrumbIssuerApi
- path: /crumbIssuer/api/xml

#### crumb

*GET* http://127.0.0.1:8080/crumbIssuer/api/xml?{key}={value}

1. 参数

| key   | value                                   |
| ----- | --------------------------------------- |
| xpath | concat(//crumbRequestField,":",//crumb) |

1. 返回类型：Crumb

| 字段   | 类型        |
| ------ | ----------- |
| value  | String      |
| errors | List<Error> |

### PluginManager 插件管理（插件信息、安装插件）

- PluginManagerApi
- path: /pluginManager

#### plugins 插件列表

*GET* http://127.0.0.1:8080/pluginManager/api/json

- 返回类型：List<Plugin>

| 字段          | 类型    | 说明 |
| ------------- | ------- | ---- |
| active        | Boolean |      |
| backupVersion | String  |      |
| bundled       | Boolean |      |
| deleted       | Boolean |      |
| downgradable  | Boolean |      |
| enabled       | Boolean |      |
| longName      | String  |      |
| ……            |         |      |

#### installNecessaryPlugins 安装插件

*POST* http://127.0.0.1:8080/pluginManager/installNecessaryPlugins

1. 参数

payload: <jenkins><install plugin="{pluginID}"/></jenkins>

| 字段       | 说明           |
| ---------- | -------------- |
| {pluginID} | 要安装的插件ID |

1. 返回类型：RequestStatus

### Queue 任务队列相关（队列状态）

- QueueApi
- path: /queue

#### queue 所有任务队列信息

*GET* http://127.0.0.1:8080/queue/api/json

返回类型：List<QueueItem>

| 字段         |                     |                         |
| ------------ | ------------------- | ----------------------- |
| blocked      | Boolean             | 是否阻塞                |
| buildable    | Boolean             | 是否可构建              |
| id           | Integer             |                         |
| inQueueSince | Long                |                         |
| params       | Map<String, String> | 任务参数                |
| task         | Task                | Task中包含任务名称和URL |
| ……           |                     |                         |

#### item 任务队列信息

*GET* http://127.0.0.1:8080/queue/item/{queueId}/api/json

1. 参数

| 字段      | 说明       |
| --------- | ---------- |
| {queueId} | 任务队列ID |

1. 返回类型：QueueItem

#### cancel 取消任务队列

*POST* http://127.0.0.1:8080/cancelItem?id={id}

1. 参数

| 字段 | 说明       |
| ---- | ---------- |
| {id} | 任务队列ID |

1. 返回类型：RequestStatus

### Statistics 统计信息

- StatisticsApi
- path: /

#### overall-load

*GET* http://127.0.0.1:8080/overallLoad/api/json

返回类型：OverallLoad

| 字段                | 类型                | 说明 |
| ------------------- | ------------------- | ---- |
| availableExecutors  | Map<String, String> |      |
| busyExecutors       | Map<String, String> |      |
| connectingExecutors | Map<String, String> |      |
| definedExecutors    | Map<String, String> |      |
| idleExecutors       | Map<String, String> |      |
| onlineExecutors     | Map<String, String> |      |
| queueLength         | Map<String, String> |      |
| totalExecutors      | Map<String, String> |      |
| totalQueueLength    | Map<String, String> |      |

### System 系统信息

#### SystemInfo 系统信息

path: /

返回类型：SystemInfo

| 字段             | 类型   | 说明 |
| ---------------- | ------ | ---- |
| hudsonVersion    | String |      |
| jenkinsVersion   | String |      |
| jenkinsSession   | String |      |
| instanceIdentity | String |      |
| sshEndpoint      | String |      |
| server           | String |      |