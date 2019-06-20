//
//  interfaceModel.h
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

//#ifndef interfaceModel_h
#define interfaceModel_h
#import <UIKit/UIKit.h>

@class data_rating, data_casts, data_details, data_directors, data_avatars;

//interfaceModel
@interface interfaceModel: NSObject

@property(nonatomic,strong) data_rating * rating;

@property(nonatomic,strong) NSArray * genres;

@property(nonatomic, copy) NSString * title;

@property(nonatomic, strong) NSArray<data_casts*> *casts;

@property(nonatomic, strong) NSArray * duration;

@property(nonatomic, assign) NSInteger collect_count;

@property(nonatomic, copy) NSString * mainland_pubdate;

@property(nonatomic,assign) bool * has_video;

@property(nonatomic, copy) NSString * original_title;

@property(nonatomic,copy)NSString * subtype;

@property(nonatomic, strong) NSArray <data_directors *> * directors;

@property(nonatomic, strong)NSArray * pubdates;

@property(nonatomic, strong) NSArray * year;

@property(nonatomic, strong) data_avatars * images;

@property(nonatomic,copy)NSString * alt;

@property(nonatomic, copy)NSString * idm;

+(instancetype)interfaceModelWithDict:(NSDictionary *) Dictionary;

@end



//dataRating
@interface data_rating : NSObject

@property(nonatomic,assign) NSInteger max;

@property(nonatomic,assign) NSInteger average;

@property(nonatomic, strong) data_details * details;

@property(nonatomic,assign) NSInteger stars;

@property(nonatomic, assign) NSInteger min;

@end



//dataDetails
@interface data_details: NSObject

@property(nonatomic,assign) NSInteger one;

@property(nonatomic,assign) NSInteger three;

@property(nonatomic,assign) NSInteger two;

@property(nonatomic,assign) NSInteger five;

@property(nonatomic,assign) NSInteger four;

@end


//dataAvartas
@interface data_avatars: NSObject

@property(nonatomic, copy) NSString *small;

@property(nonatomic,copy) NSString *large;

@property(nonatomic, copy) NSString *medium;

@end


//dataCasts
@interface data_casts : NSObject

@property(nonatomic, copy) NSString * id;

@property(nonatomic, strong) data_avatars * avatars;

@property(nonatomic, copy) NSString * name_en;

@property(nonatomic,copy)NSString * name;

@property(nonatomic, copy)NSString * alt;


@end


//dataDirectors
@interface data_directors: NSObject

@property(nonatomic, strong) data_avatars * avartas;

@property(nonatomic, copy) NSString * name_en;

@property(nonatomic, copy) NSString * name;

@property(nonatomic, copy)NSString * alt;

@property(nonatomic, copy) NSString * id;

@end





/* interfaceModel_h */
