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
}



-(void)setInterfaceM:(interfaceModel *)InterfaceM{
    //_iconLabel.images = [UIImage imageNamed:InterfaceM.icon];

    //set update for avartas
    
    NSArray * castsArray = InterfaceM.casts;
    NSArray * directorsArray = InterfaceM.directors;
    
    UIImageView * _icon1;
  //  UIImageView * _icon2;
   // UIImageView * _icon3;
    UIImageView * _icon4;
  //  UIImageView * _icon5;
   // UIImageView * _icon6;
   

    for(int i = 0; i < castsArray.count; i++){
        data_casts * SetModel1 = castsArray[i];
        
        NSString *tempName1 = SetModel1.avatars1.small;
       // NSString *tempName2 = SetModel1.avatars1.large;
       // NSString *tempName3 = SetModel1.avatars1.medium;
        
        _icon1.yy_imageURL = [NSURL URLWithString:tempName1];
     //   _icon2.yy_imageURL = [NSURL URLWithString:tempName3];
      //  _icon3.yy_imageURL = [NSURL URLWithString:tempName3];
        
        
        NSString *nameT = SetModel1.name1;
        NSString *nameEnT = SetModel1.name_en1;

        if(i< castsArray.count - 1){
            
            
        }
        
    }
    


    
    
    UIImageView * _icon7;
    UIImageView * _icon8;
    UIImageView * _icon9;
    _icon7.yy_imageURL = [NSURL URLWithString:InterfaceM.images.large];
    _icon8.yy_imageURL = [NSURL URLWithString:InterfaceM.images.medium];
    _icon9.yy_imageURL = [NSURL URLWithString:InterfaceM.images.small];
    
    
    
    
    
}

@end
