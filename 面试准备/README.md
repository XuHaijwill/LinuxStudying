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