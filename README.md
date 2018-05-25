# demo-app

demo app using axe

## demo

使用 `axe`搭建的一个组件化APP实例代码。 

包括以下内容 :

* [私有pod仓库](https://github.com/axe-org/ios-private-spec)
* [demo-ground](https://github.com/axe-org/demo-ground) : 地基项目，用于整合 公共基础组件和 公共业务逻辑
* [demo-login](https://github.com/axe-org/demo-login)
* [demo-login-h5](https://github.com/axe-org/demo-login-h5) : 使用h5开发的登录模块
* [demo-login-react](https://github.com/axe-org/demo-login-react): 使用`react-native`开发的登录模块
* [demo-test](https://github.com/axe-org/demo-test)
* [demo-test-h5](https://github.com/axe-org/demo-test-h5)
* [demo-test-react](https://github.com/axe-org/demo-test-react)

使用 `axe-admin`管理平台 ， 地址为 ： [demo.axe-org.cn](https://demo.axe-org.cn)

`axe`平台化的APP，使用[fastlane](https://github.com/axe-org/fastlane)


## 说明

需要安装 `git-lfs` ，`CocoaPods`  以及`fastlane`

## 再介绍一下如何创建一个模块

首先在创建`fastlane`目录，放置一个`Fastfile` ，其中内容为 ：

	import_from_git(url: 'https://github.com/axe-org/fastlane', branch: 'v0.2')

然后输入命令
	
	fastlane axe_init_module

详细的配置在`axe`文件夹下， `Axefile` 、`Podfile`和`Podspec`三个文件中。

之后会完善文档，这里先简要说明一下。
