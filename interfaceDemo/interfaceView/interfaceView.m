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

@implementation interfaceView

-(void)setInterfaceM:(interfaceModel *)InterfaceM{
    //_iconLabel.images = [UIImage imageNamed:InterfaceM.icon];
    UIImageView * _icon;
    _icon.yy_imageURL = [NSURL URLWithString:InterfaceM.images];

    
}

@end
