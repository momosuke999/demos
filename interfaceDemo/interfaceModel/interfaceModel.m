//
//  interfaceModel.m
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "interfaceModel.h"

@implementation interfaceModel

+(instancetype)interfaceModelWithDict:(NSDictionary *)Dictionary{
    interfaceModel * interfaceM =[[self alloc] init];
    [interfaceM setValuesForKeysWithDictionary:Dictionary];
    return interfaceM;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end

@implementation data_directors


@end





@implementation data_rating

@end


@implementation data_casts

@end
