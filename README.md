##OneNote 的一种模拟方法

####简介

OneNote用了一段时间，度过最开始的蜜月期之后，在审视自己对知识管理软件所期盼的同时，开始着手模仿OneNote iosApp的实现。

如果从可见场景的角度来分析，会发现她没几个页面。既然这样，就从门槛低的这条道出发，照猫画虎，描一下oneNote是如何从代码走到产品的！

我欣赏OneNote，喜欢随处写入、像纸一样为所欲为、毫无拘束的特点。我尝试通过技术如何把它变成现实，但在此之前，我们应该把该有的功能搭建好。

在这个系列中，预计分三部完成整个内容。

#####章节目录：

* OneNote的一种模拟方法（上）：iOS主界面，标签栏与正文摘要；
* OneNote的一种模拟方法（中）：侧滑多笔记本切换；
* OneNote的一种模拟方法（下）：浅析文档模型，从图文混编开始。


![oneNoteDemo_v1](http://upload-images.jianshu.io/upload_images/238151-2034e93c2073a278.gif?imageMogr2/auto-orient/strip)

####第一、起底OneNote，从欢迎页开始


![oneNote欢迎页2](http://upload-images.jianshu.io/upload_images/238151-51255ccc08b5862e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

欢迎页如图所示，实现这部分需要注意两点：

* 页面布局顶部"Office"标签与Scroll结合，详见startPageViewCtl类。
* 登录页按钮并非iOS标准控件，使用占位button进行跳转。


    UIButton*bLoginBtn = [UIButtonbuttonWithType:UIButtonTypeCustom];
    bLoginBtn.frame =CGRectMake(oSize.width * 2, SCREEN_HEIGHT / 1.96, SCREEN_WIDTH, 50);

####第二、主界面：标签栏让正文选取更便利

![noeNote主界面](http://upload-images.jianshu.io/upload_images/238151-a9613da4c87c1f6a.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


oneNote主界面由两部分组成：标签页和表视图。标签页实现了多笔记的选取与切换，而表视图实现笔记内文章的预览。

标签栏的使用，可以方便地实现多笔记本之间的切换，但其局限性在于当笔记本个数过多或者笔记名称过长，标签栏用起来就不那么友好了！

模拟多标签栏的实现基础在于单标签页(QMBTab)与标签组(QMBTabBar)的定义。单标签侧重于自身的创建与渲染，单标签的属性多，但事件少。单标签的行为都交由标签组管理，比如创建AddTabItem、选中SelectTab和删除RemoveTab等行为，还包括此类行为的代理didChange、willRemove、didRemove等。

说句题外话，记得北塔在看早期Firefox源码时，曾惊叹Firefox的顶部标签栏设计。这得是吃了多少碗卤煮火烧才憋出这么亮骚产品！Firefox的顶层标签也有一个标签控制管理器，所以说，只要你留心观察，现在流行的技术你都能在若干年前看到她的影子。

我们继续模拟oneNote的主页面。标签栏创建成功后，添加笔记摘要TableView。注意：

 * DocContentModel 
 * docPreviewCtl
 

######代码 : [github.com/northtower](https://github.com/northtower/OneNoteScroll)
> 代码中我尽量做到应有的注释，本身没什么难点，如果有问题，您可以给我回复。

####小结

用了一段时间OneNote，准确地说一个多月吧。虽然也发现很多不如意的地方，但不可否认这是一款杰出的产品。有人说MSOffice 2016 for Mac是微软的良心之作！良心还是狼心咱就不跟风了，我喜欢oneNote是她真能解决我需求，随处修订与页层次主题是我最需要的功能。

这个demo做到现在才刚刚起步，模仿是为了换个角度了解它。学习的基础是理解，理解的基础是感受。只有你真正看清你要的是什么，你才能把它做出来。


