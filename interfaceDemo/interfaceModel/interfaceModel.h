//
//  interfaceModel.h
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

//#ifndef interfaceModel_h
#define interfaceModel_h

@interface interfaceModel: NSObject

@property(nonatomic, copy)NSString * rate;
@property(nonatomic, copy)NSString * detail;
@property(nonatomic, copy)NSString * genre;
@property(nonatomic, copy)NSString * icon;
@property(nonatomic, copy)NSString * pubdate;
@property(nonatomic,copy)NSString * name;
@property(nonatomic, copy)NSString * link;
@property(nonatomic, copy)NSString * idn;

+(instancetype)interfaceModelWithDict:(NSDictionary *) Dictionary;

@end

/* interfaceModel_h */
