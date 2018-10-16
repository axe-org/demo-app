# demo-app

demo app using axe

## demo

使用 `axe`搭建的一个组件化APP实例代码。 

包括以下内容 :

* [私有pod仓库](https://github.com/axe-org/ios-private-spec)
* [demo-ground](https://gitlab.com/axe-org/demo-ground) : 地基项目，用于整合 公共基础组件和 公共业务逻辑
* [demo-login](https://gitlab.com/axe-org/demo-login) : ios登录模块。
* [demo-login-h5](https://github.com/axe-org/demo-login-h5) : 使用h5开发的登录模块
* [demo-login-react](https://github.com/axe-org/demo-login-react): 使用`react-native`开发的登录模块
* [demo-test](https://gitlab.com/axe-org/demo-test) : iOS 测试模块，测试axe的基本功能。
* [demo-test-h5](https://github.com/axe-org/demo-test-h5): 使用h5开发的测试模块。
* [demo-test-react](https://github.com/axe-org/demo-test-react) : 使用rn 开发的测试模块。

使用 `axe-admin`管理平台 ， 地址为 ： [demo.axe-org.cn](https://demo.axe-org.cn)

`axe`平台化的APP，使用[fastlane](https://github.com/axe-org/fastlane)作为构建和管理工具。


## 说明

需要安装 `git-lfs` ，`CocoaPods`  以及`fastlane`.

`demo`使用`CocoaPods`私有仓库，所以使用`fastlane`进行操作前，需要执行命令：

	pod repo add axe-demo "https://github.com/axe-org/demo-private-spec.git

## git-lfs

对于`git`来说， 不适合直接管理大型文件，大型文件会极大的膨胀仓库的大小。对于组建化中，我们会构建一个二进制的包，以提高编译速度，而这个包必须使用一些更好的管理方式。 所以我们要使用`git-lfs`来管理大型文件，[git-lfs](https://git-lfs.github.com) : 是 `git`的扩展，以将大文件接入到`git`的版本管理中。 简单来说， `git-lfs`将大型文件存储到git仓库之外的存储区域，不增加git仓库的体积，但是记录文件的版本变更信息。

安装 ：

	brew install git-lfs
	git lfs install
	
`CocoaPods`在使用`git-lfs`后，要进行清理：

	rm -rf /Users/$USER/Library/Caches/CocoaPods
	pod cache clean --all

因为我们要使用`git-lfs`，所以对于demo中的三个库，我们没有放在`github`中（之前测试中，github的lfs对国内用户不友好）。现在我们将这三个库放到了`git-lab`中。

## 再介绍一下如何创建一个模块

首先在创建`fastlane`目录，放置一个`Fastfile` ，其中内容为 ：

	import_from_git(url: 'https://github.com/axe-org/fastlane', branch: 'v0.2')

然后输入命令
	
	fastlane axe_init_module

详细的配置在`axe`文件夹下， `Axefile` 、`Podfile`和`Podspec`三个文件中。


