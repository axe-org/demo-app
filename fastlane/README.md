fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
### axe_pod_install
```
fastlane axe_pod_install
```
安装依赖。 对于module和app类型，拥有业务组件依赖，所以必须通过该命令安装依赖。

**使用axe安装依赖，必须使用Podfile.rb文件，而不是Podfile文件。**

拥有两个参数：

* `production` : 标记使用prd版本还是beta版本的依赖，默认为 false

* `source` : 标记是否使用源码引入，默认为 false。



手动安装时，可以快速执行命令： 

```
fastlane axe_pod_install production:true source:true
```
### axe_module_build
```
fastlane axe_module_build
```
`axe_module_build` : 构建模块， 打包成framework。 需要先安装Cocoapods依赖。

**使用axe发布依赖时， 使用的是xxxx.podspec.rb文件，而不是.podpsec文件，需要注意。**

参数：

* `publish` : 默认为false,避免本地自动测试提交。

* `production` : 表示发布的版本，需要设定publish。 默认为false, 表示beta版本，会自动增加版本号，注意生产版本只能发布一次。


### axe_import_module
```
fastlane axe_import_module
```
`axe_import_module` : 负责APP中接入 组件模块。

使用 Podfile.rb文件！！ 

参数：

import : 新引入模块，json字符串，如 {"a":"1.1.1"} ， key为模块名，value为版本号

remove : 删除的模块，json字符串，如 ["a","b"] 
### axe_init_module
```
fastlane axe_init_module
```
`axe_init_module` : 脚手架模式，以快速搭建一个标准的module

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
