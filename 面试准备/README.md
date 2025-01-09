## SHELL

![image-20250109204821204](imgs\image-20250109204821204.png)

![image-20250109204912430](imgs\image-20250109204912430.png)

![image-20250109204941738](imgs\image-20250109204941738.png)

![image-20250109205744270](imgs\image-20250109205744270.png)

![image-20250109205103477](imgs\image-20250109205103477.png)

![image-20250109205205855](imgs\image-20250109205205855.png)

![image-20250109205410287](imgs\image-20250109205410287.png)

# awk内建变量示例详解之NR、FNR、NF

![image-20250109205643162](imgs\image-20250109205643162.png)

# 前端（HTTP）

1. 如何获取界面元素

2. 如何查看界面请求 F12查看网络请求

3. 如何打印对象 console.log(data)

4. 说一下HTTP 中常用的状态码（14种）

   ![image-20250108224000335](imgs\image-20250108224000335.png)

   ```
   200	OK	请求成功。一般用于GET与POST请求
   201	Created	已创建。成功请求并创建了新的资源
   204	No Content	无内容。服务器成功处理，但未返回内容。在未更新网页的情况下，可确保浏览器继续显示当前文档
   301	Moved Permanently	永久性重定向。请求的资源已被永久的移动到新URI，返回信息会包括新的URI，浏览器会自动定向到新URI。今后任何新的请求都应使用新的URI代替
   403 Forbidden 服务器理解请求客户端的请求，但是拒绝执行此请求
   404 Not Found 服务器无法根据客户端的请求找到资源（网页）。通过此代码，网站设计人员可设置"您所请求的资源无法找到"的个性页面。也可以在服务器拒绝请求且不想说明理由时使用
   500	Internal Server Error	服务器内部错误，无法完成请求，也可能是web应用存在bug或某些临时故障
   501	Not Implemented	服务器不支持请求的功能，无法完成请求
   ```

   ## Vue

   ### vue的生命周期有哪些及每个生命周期做了什么

   ![image-20250108224810816](imgs\image-20250108224810816.png)

   ## v-show和v-if有什么区别

   1. v-if 和 v-show 都能实现元素的显示隐藏

   2.   v-show 只是简单的控制元素的 display 属性，而 v-if 才是条件渲染（条件为真，元素将会被渲染，条件 为假，元素会被销毁）；

        v-show 有更高的首次渲染开销，而 v-if 的首次渲染开销要小的多；

        v-if 有更高的切换开销，v-show 切换开销小；

        v-if 有配套的 v-else-if 和 v-else，而 v-show 没有

       v-if 可以搭配 template 使用，而 v-show 不行

      

      v-if 与 v-show 都能控制dom元素在页面的显示

      - v-if 相比 v-show 开销更大的（直接操作dom节点增加与删除）
      - 如果需要非常频繁地切换，则使用 v-show 较好
      - 如果在运行时条件很少改变，则使用 v-if 较好

   ![image-20250108230009809](imgs\image-20250108230009809.png)

   ![image-20250108230204843](imgs\image-20250108230204843.png)

   ## 谈一谈对 MVVM 的理解？

   ```
   MVVM是Model-View-ViewModel缩写，也就是把MVC中的Controller演变成ViewModel。Model层代表数据模型，View代表UI组件，ViewModel是View和Model层的桥梁，数据会绑定到viewModel层并自动将数据渲染到页面中，视图变化的时候会通知viewModel层更新数据。
   ```

   ### vue组件通信方式有哪些及原理

   ![image-20250108230648996](imgs\image-20250108230648996.png)

   ![image-20250108230707718](imgs\image-20250108230707718.png)

   ![image-20250108230750078](imgs\image-20250108230750078.png)

   ![image-20250108230824081](C:\Users\zuiwo\AppData\Roaming\Typora\typora-user-images\image-20250108230824081.png)

   ![image-20250108231006848](D:\sources\git\github\LinuxStudying\面试准备\imgs\image-20250108231006848.png)

   ![image-20250108231048048](imgs\image-20250108231048048.png)

   

   父子组件通信

   父->子`props`，子->父 `$on、$emit`

   获取父子组件实例 `$parent、$children`

   `Ref` 获取实例的方式调用组件的属性或者方法

   `Provide、inject` 官方不推荐使用，但是写组件库时很常用

   兄弟组件通信

   ```javascript
   javascript 代码解读复制代码Event Bus` 实现跨组件通信 `Vue.prototype.$bus = new Vue
   Vuex
   ```

   跨级组件通信

   ```bash
   $attrs、$listeners
   ```

   

   https://juejin.cn/post/7343484473184698405

   https://www.bilibili.com/video/BV1HV4y1a7n4?vd_source=c102ec68c51d3f8673e6ec1b0c5f195b&spm_id_from=333.788.videopod.episodes&p=31

   ## watch侦听器

   ![image-20250108230319943](imgs\image-20250108230319943.png)

![image-20250108230431774](D:\sources\git\github\LinuxStudying\面试准备\imgs\image-20250108230431774.png)

## Docker

https://www.bilibili.com/video/BV16M4y1H7aH/?spm_id_from=333.337.search-card.all.click&vd_source=c102ec68c51d3f8673e6ec1b0c5f195b

https://www.bilibili.com/video/BV1wQ4y1Y7SE?spm_id_from=333.788.videopod.episodes&vd_source=c102ec68c51d3f8673e6ec1b0c5f195b&p=29

https://docs.docker.com/reference/samples/wordpress/

https://github.com/docker/awesome-compose/blob/master/nginx-aspnet-mysql/compose.yaml

```
docker-compose up
docker compose up --build
```

![image-20250109200538745](imgs\image-20250109200538745.png)

![image-20250109200649175](imgs\image-20250109200649175.png)

![image-20250109200849389](imgs\image-20250109200849389.png)

![image-20250109200953289](imgs\image-20250109200953289.png)

![image-20250109201050529](imgs\image-20250109201050529.png)

![image-20250109201507085](D:\sources\git\github\LinuxStudying\面试准备\imgs\image-20250109201507085.png)

![image-20250109201628049](imgs\image-20250109201628049.png)

![image-20250109201857670](imgs\image-20250109201857670.png)

![image-20250109202110367](D:\sources\git\github\LinuxStudying\面试准备\imgs\image-20250109202110367.png)

https://docker-practice.github.io/zh-cn/compose/

![image-20250109202931881](imgs\image-20250109202931881.png)

![image-20250109203008273](imgs\image-20250109203008273.png)

![image-20250109203055251](imgs\image-20250109203055251.png)

![image-20250109203132401](imgs\image-20250109203132401.png)

![image-20250109203304112](imgs\image-20250109203304112.png)

![image-20250109203402724](imgs\image-20250109203402724.png)

```
docker-compose up -d命令用于启动已经存在的服务容器，如果服务容器不存在则会自动创建。-d参数表示以守护进程的方式运行容器。
docker-compose up --build命令用于重新构建服务容器。如果服务容器已经存在，该命令会先停止并移除现有的容器，然后重新构建并启动容器。如果服务容器不存在，则会直接构建并启动容器。
总结来说，docker-compose up -d用于启动已经存在的服务容器，而docker-compose up --build用于重新构建并启动服务容器。
```

![image-20250109203811209](imgs\image-20250109203811209.png)

![image-20250109203927361](imgs\image-20250109203927361.png)

![image-20250109204019280](imgs\image-20250109204019280.png)

![image-20250109204059814](imgs\image-20250109204059814.png)

![image-20250109204141399](imgs\image-20250109204141399.png)

![image-20250109204245165](imgs\image-20250109204245165.png)

![image-20250109204323584](imgs\image-20250109204323584.png)

![image-20250109204445584](imgs\image-20250109204445584.png)

# 前端

https://www.bilibili.com/video/BV1ef421z7pB?spm_id_from=333.788.videopod.episodes&vd_source=c102ec68c51d3f8673e6ec1b0c5f195b&p=127

![image-20250109210322408](imgs\image-20250109210322408.png)

![image-20250109210541568](imgs\image-20250109210541568.png)

![image-20250109210351188](imgs\image-20250109210351188.png)

![image-20250109210656918](imgs\image-20250109210656918.png)

![image-20250109210031207](imgs\image-20250109210031207.png)

![image-20250109210919515](imgs\image-20250109210919515.png)

![image-20250109211009661](imgs\image-20250109211009661.png)

# Python

![image-20250109211133018](imgs\image-20250109211133018.png)

```
LRU是Least Recently Used的缩写，意思是最近最少使用，它是一种Cache替换算法。 Cache的容量有限，因此当Cache的容量用完后，而又有新的内容需要添加进来时， 就需要挑选并舍弃原有的部分内容，从而腾出空间来放新内容。LRU Cache 的替换原则就是将最近最少使用的内容替换掉。其实，LRU译成最久未使用会更形象， 因为该算法每次替换掉的就是一段时间内最久没有使用过的内容。 Python的缓存（lru_cache）是一种装饰在被执行的函数上，将其执行的结果缓存起来，当下次请求的时候，如果请求该函数的传参未变则直接返回缓存起来的结果而不再执行函数的一种缓存装饰器。

```

![image-20250109212337214](D:\sources\git\github\LinuxStudying\面试准备\imgs\image-20250109212337214.png)

[*Python*性能加速器：掌握functools.*lru_cache**装饰器*](https://blog.csdn.net/windowshht/article/details/140583480?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-blog-2~default~OPENSEARCH~PaidSort-1-140583480-blog-131140907.235^v43^pc_blog_bottom_relevance_base2&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2~default~OPENSEARCH~PaidSort-1-140583480-blog-131140907.235^v43^pc_blog_bottom_relevance_base2&utm_relevant_index=1)