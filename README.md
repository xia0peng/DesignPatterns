# DesignPatterns

[![CI Status](https://img.shields.io/travis/xiaopengwang/DesignPatterns.svg?style=flat)](https://travis-ci.org/xiaopengwang/DesignPatterns)
[![Version](https://img.shields.io/cocoapods/v/DesignPatterns.svg?style=flat)](https://cocoapods.org/pods/DesignPatterns)
[![License](https://img.shields.io/cocoapods/l/DesignPatterns.svg?style=flat)](https://cocoapods.org/pods/DesignPatterns)
[![Platform](https://img.shields.io/cocoapods/p/DesignPatterns.svg?style=flat)](https://cocoapods.org/pods/DesignPatterns)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

xiaopengwang, xiaopeng__w@163.com

## License

DesignPatterns is available under the MIT license. See the LICENSE file for more info.

## 对象创建

### 工厂方法 

[工厂方法模式的类图](https://github.com/xiaopengmonsters/DesignPatterns/blob/master/Example/images/工厂.png)

何时使用工厂方法

* 编译时无法准确预期要k创建的对象的类
* 类想让子类决定在运行时创建什么
* 若有若干辅助类为其子类，而你想将返回哪个子类这一信息局部化

### 抽象工厂

[一系列工厂及相关产品之间关系的类图](https://github.com/xiaopengmonsters/DesignPatterns/blob/master/Example/images/抽象工厂.png)

抽象工厂与工厂方法

两个模式都用于相同的目的：创建对象而不让客户端知晓返回了什么确切的具体对象

|  抽象工厂 | 工厂方法 |
|  ----  | ----  |
| 通过对象组合创建抽象产品  | 通过类继承创建抽象产品 |
| 创建对系列产品  | 创建一种产品 |
| 必须修改父类的接口才能支持新产品  | 子类化创建者并重载工厂方法以创建新产品 |

## 行为扩展

### 责任链

[责任链类图](https://github.com/xiaopengmonsters/DesignPatterns/blob/master/Example/images/责任链.png)

何时使用责任链

* 有多个对象可以处理请求，而处理程序只有在运行时才能确定
* 向一组对象发出请求，而不想显式指定处理请求的特定处理程序

## 性能与对象访问

### 亨元

当满足以下所有条件时，自然会考虑使用这个模式：

* 应用程序使用很多对象
* 在内存中保存对象会影响内存性能
* 对象的多数特有状态（外在状态）可以放到外部而轻量化
* 移除了外在状态后，可以用较少的共享对象替代原来的那组对象
* 应用程序不依赖于对象标识，因为共享对象不能提供唯一的标识

### 代理

在下列情景，自然会考虑使用这一模式：

* 远程代理，为位于不同地址空间或网络中的对象提供本地代表。
* 虚拟代理，来根据要求创建重型的对象。
* 保护代理，来根据不同访问权限控制对原对象的访问。
* 只能引用代理，通过对实体对象的引用进行计数来管理内存，也能用于锁定实体对象，让其对象不能修改它。

## 对象状态

### 备忘录

当同时满足以下两个条件时，应当考虑使用这一模式：

* 需要保存一个对象（或某部分）在某一个时刻的状态，这样以后就可以恢复到先前的状态
* 用于获取状态的接口会暴露实现细节，需要将其隐藏起来
