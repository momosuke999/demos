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
#import "Masonry.h"
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS


@class data_casts;


@implementation interfaceView
    //UILabel * castsLabel;
    //UILabel * directorsLabel;
    

-(void)awakeFromNib{
    [super awakeFromNib];
}


-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        UIView * mainView = [[UIView alloc]init];
        mainView.layer.cornerRadius = 8;
        mainView.layer.shadowColor = [UIColor grayColor].CGColor;
        mainView.layer.shadowRadius = 3;
        mainView.layer.shadowOffset  = CGSizeMake(1, 1);
    
        mainView.layer.borderWidth = 2;

        mainView.layer.borderColor = [[UIColor grayColor] CGColor];
        [self addSubview:mainView];
        
        [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.height.equalTo(@150);
        }];
        self.filmNameLabel = [[UILabel alloc] init];
        self.filmNameLabel.textColor = [UIColor grayColor];
        self.filmNameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];

        self.filmNameLabel.textAlignment = NSTextAlignmentCenter;
        [mainView addSubview:_filmNameLabel];
        
        
        [self.filmNameLabel mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(mainView).offset(10);
            make.left.equalTo(mainView).offset(10);
            make.height.equalTo(@25);
        }];

    }
    return self;
}




@end
