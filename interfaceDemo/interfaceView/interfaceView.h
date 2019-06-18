//
//  interfaceView.h
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

//#ifndef interfaceView_h
#define interfaceView_h
//@class interfaceModel;
#import <UIKit/UIKit.h>
#import "interfaceModel.h"
@interface interfaceView: UITableViewCell

@property (nonatomic, strong) interfaceModel *InterfaceM;


/*
@property (nonatomic, strong) interfaceModel * InterfaceModel;

@property (nonatomic, strong) UILabel * filmNameLabel;

@property (nonatomic, strong) UILabel * filmNameEnLabel;

@property (nonatomic, strong) UIImageView * filmIcon;

@property (nonatomic, strong) UILabel * rateAverageLabel; //connect with details

@property (nonatomic, strong) UILabel * starsLabel;

 @property (nonatomic, strong) UIImageView * CastsIcon; // connect with alt

@property (nonatomic, strong) UILabel * castnameLabel; //connect with alt

@property (nonatomic, strong)UILabel * castsnameenLabel;

@property (nonatomic, strong) UIImageView * DirectorsIcon; // connect with alt

 @property (nonatomic, strong)UILabel  * directorsNameLabel; //connect with alt

@property (nonatomic, strong) UILabel * directorsNameEnLabel;

@property (nonatomic, strong)UILabel * pubdateLabel;

@property (nonatomic, strong)UILabel * mainland_pubdateLabel;

 @property (nonatomic, strong)UILabel * genreLabel;*/
@end
