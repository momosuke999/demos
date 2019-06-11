//
//  interfaceView.m
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "interfaceView.h"
#import "interfaceModel.h"
#import <UIKit/UIKit.h>
#import "YYWebImage.h"

@class data_casts;

@implementation interfaceView{
    UILabel * castsLabel;
    UILabel * directorsLabel;
    UIImage * icon;
    UILabel * pubdateLabel;
    UILabel * genreLabel;
    UILabel * rateLable;
    UILabel * castnameLabel;
    UILabel  * castsnameenLabel;
}



-(void)setInterfaceM:(interfaceModel *)InterfaceM{
    //_iconLabel.images = [UIImage imageNamed:InterfaceM.icon];

    //set update for avartas
    
    NSArray * castsArray = InterfaceM.casts;
    NSArray * directorsArray = InterfaceM.directors;
    
    UIImageView * _icon1;

    UIImageView * _icon4;

   
    NSString * result = @"";
    for(int i = 0; i < castsArray.count; i++){
        data_casts * SetModel1 = castsArray[i];
 
        NSString *nameT = SetModel1.name1;
        result = [result stringByAppendingString:nameT];
        if(i< castsArray.count - 1){
            
            result = [result stringByAppendingString:@", "];
        }
    }
    
    castnameLabel.text = result;

    NSString * result2 = @"";
    for(int i = 0; i < castsArray.count; i++){
        data_casts * SetModel1 = castsArray[i];
        NSString *nameT = SetModel1.name_en1;
        //  NSString *nameEnT = SetModel1.name_en1;
        result2 = [result2 stringByAppendingString:nameT];
        if(i< castsArray.count - 1){
            result2 = [result2 stringByAppendingString:@", "];
        }
        
    }
    
    castsnameenLabel.text = result2;
    
    
    
    UIImageView * _icon7;
    UIImageView * _icon8;
    UIImageView * _icon9;
    _icon7.yy_imageURL = [NSURL URLWithString:InterfaceM.images.large];
    _icon8.yy_imageURL = [NSURL URLWithString:InterfaceM.images.medium];
    _icon9.yy_imageURL = [NSURL URLWithString:InterfaceM.images.small];
    
    
    
    
    
}

@end
