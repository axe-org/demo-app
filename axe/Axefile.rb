AxeConfig.new do |s|
  # 默认使用 name寻找 workspace和scheme 
  # 必须
  s.name           = "Demo"
  # 指定具体的 workspace和scheme名称 可选
  # s.workspace    = "Login"
  # s.scheme       = "Login"  # 最终对于module打出的framework名与scheme名相同。 放在build文件夹下，命名为 Login.framework
  # 测试使用的scheme , TODO 暂时没用
  # s.testScheme   = "Test" 
  # 当前设置版本 ，设定版本号必须为三段式，遵循语义化版本号规范。
  # dev发布的版本 为 0.0.1-beta.x 会自动跟随打包添加版本号x , 而发布的prd版本，只能发布一次，版本号为 0.0.1
  # 版本号对于 module类型是必须的， 对于app 不需要版本号。
  s.version      = "0.1.0"
  # 设定podspec仓库名，一般会用私有仓库来存储。 对module类型必须
  s.podRepo      = "axe-demo"
  # type有两种 ， app ， module 和 ground. 必须 
  # ground属于module, 只是会有一些更特殊的处理， 在构建的时候，会处理依赖的头文件。
  s.type         = "app"
  # 依赖，必须，注意依赖格式，必须为三段式。
  s.dependency   = {
    # 依赖声明如下所示。 app和模块有所不同
    # app 要求指定模块版本号， 所以会自动生成 dev和prd两种Podfile， dev 解析为 >= 1.0.0-beta.0 , < 1.0.0 , 而prd解析为 1.0.0
    # 模块依赖的只是api， 对于本地编译时， dev 被解析为 >= 2.1.3-beta.0 , < 3.0.0 ,而prd解析为 ~> 2.1 ， 
    # 需要注意 如果共同开发，且不确定接口的情况下，依赖模块要注意沟通问题
  }
end