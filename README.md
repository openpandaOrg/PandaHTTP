> 阅读前，你应该要了解我所倡导的IOS规范 [IOS规范](http://ios-guildline.openpanda.org/)

#PandaHTTP
>PandaHttp是对网络层的一个简单封装类库

1. 简化对网络的操作
2. 倡导同步式的网络操作
3. 针对WorkPlus API特有的JSON输入及返回提供了适配

>PandaHTTP同样提供了异步API，但在WorkPlus是不允许的，WorkPlus只能使用同步API

示例：

~~~
/**
 *  请求登录
 *
 *  @param username 登录的用户名
 *  @param password 登录的pncd
 *
 *  @return 登录成功，返回AWauth
 */
-(AWAuth*)requestLogin:(NSString*)username password:(NSString*)password error:(NSError**)error{
     //登录URL
     NSString* loginUrl = [NSString stringWithFormat:@"%@token",BeeWorks_Config_ApiUrl];
     
     //登录参数
     NSDictionary *loginParams = @{@"grant_type": @"password",
                                   @"scope" : @"user",
                                   @"domain_id" : BeeWorks_Config_DomainId,
                                   @"client_id" : username,
                                   @"client_secret" : password,
                                   @"device_id" : [AWDevice deviceId],
                                   @"device_platform" : @"IOS"};
     
     //构建一个登录请求
     OPHRequest *request = [OPHRequest jsonReqeust:loginUrl type:OPH_HTTP_POST params:loginParams];
     
     OPHResponse* response =  [[OPHNetwork sharedInstance] syncRequest:request];
     
     if ([response isRequestOk]) {
          OPHJsonStatusResult *jsonStatus = [response expectedJsonStatusResultObject];
          //网络请求成功
          if (jsonStatus) {
               int statusCode = jsonStatus.status;
               //业务上正确
               if (statusCode == 0) {
                    AWAuth *result = [AWAuth authWithDictionary:jsonStatus.result];
                    if (!result.username) {
                         result.username = username;
                    }
                    return result;
               }else{
                    //返回一个业务异常
                    *error = [NSError OPH_ServiceError:statusCode msg:jsonStatus.message];
               }
          }

     }
     
     return nil;
}
~~~

OPHRequest

~~~
//构建一个请求
OPHRequest *request = [OPHRequest jsonReqeust:loginUrl type:OPH_HTTP_POST params:loginParams];
~~~

OPHNetwork

~~~
//发出请求
OPHResponse* response = [[OPHNetwork sharedInstance] syncRequest:request]
~~~

OPHResponse可以直接返回你期望的数据

~~~
/**
 *
 * 获取期望的OPHJsonStatusResult结果
 *  @return
 */
-(OPHJsonStatusResult*)expectedJsonStatusResultObject;

/**
 *  获取期望的NSString结果
 *
 */
-(NSString*)expectedStringResult;

/**
 *  返回NSDictionary数据
 *
 *  @return 返回NSDictionary
 */
-(NSDictionary*)excepedNSDictionaryResult;
~~~


OPHJsonStatusResult是对WorkPlus API最常用的status,message,result结果的一个封装

