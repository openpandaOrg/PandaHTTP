//
//  OPHRequest.m
//  Pods
//
//  Created by lingen on 16/3/25.
//
//

#import "OPHRequest.h"


@implementation OPHRequest


+(instancetype)jsonReqeust:(NSString*)url type:(OPHRequestType)type{
    return [OPHRequest jsonReqeust:url type:type params:nil timeout:120];
}

+(instancetype)jsonReqeust:(NSString *)url type:(OPHRequestType)type params:(NSDictionary*)params{
    return [OPHRequest jsonReqeust:url type:type params:params timeout:120];
}

+(instancetype)jsonReqeust:(NSString *)url type:(OPHRequestType)type params:(NSDictionary *)params timeout:(NSTimeInterval)timeout{
    OPHRequest *ophRequest = [[OPHRequest alloc] init];
    ophRequest.url = url;
    ophRequest.type = type;
    ophRequest.timeout = timeout;
    ophRequest.params = params;
    return ophRequest;
}
@end
