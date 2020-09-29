# bloc_architecture

#deal with network error

## https://resocoder.com/2019/12/14/functional-error-handling-in-flutter-dart-2-either-task-fp/

## https://resocoder.com/2020/02/04/injectable-flutter-dart-equivalent-to-dagger-angular-dependency-injection/
        
### 对于对象列表1形式，
### https://juejin.im/post/6844903648254754823
###  参考https://github.com/PoojaB26/ParsingJSON-Flutter/blob/master/lib/model/photo_model.dart

        
### 对于对象列表2形式
### 参考 https://github.com/liwangyong/flutter_json_annotation_use/blob/4cdd7f0517/app/lib/model/base.dart
        

### 1.使用DI 进行注入，减少代码的耦合以及可测试化 ☑️
### 2.使用Either函数式编程方式，转换结果。
### 3.使用json解析。
### 4.dio网络请求库封装，便于管理。
### 5.通用错误的处理，以及反馈到界面。
### 6.通用的Loading处理。
### 7.通用导航处理。