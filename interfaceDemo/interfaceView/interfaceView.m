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

@class data_casts;

@implementation interfaceView{
    //UILabel * castsLabel;
    //UILabel * directorsLabel;
    
    UILabel * _filmNameLabel;
    
    UILabel * _filmNameEnLabel;
    
    UIImageView * _filmIcon;
    
    UILabel * _rateAverageLabel;
    
    UILabel * _starsLabel;
    
    UIImageView * _CastsIcon;
    
    UILabel * _castnameLabel;
    
    UILabel * _castsnameenLabel;
    
    UIImageView * _DirectorsIcon;
    
    UILabel * _directorsNameLabel;
    
    UILabel * _directorsNameEnLabel;
    
    UILabel * _pubdateLabel;
    
    UILabel * _mainland_pubdateLabel;
    
    UILabel * _genreLabel;
    
}



-(void)setInterfaceM:(interfaceModel *)InterfaceM{
    //_iconLabel.images = [UIImage imageNamed:InterfaceM.icon];
    
    
    //--------------------set model for non array lebels-------------
    
    _filmNameLabel.text = InterfaceM.tile;
    _filmNameEnLabel.text = InterfaceM.original_title;
    
    _filmIcon.yy_imageURL = [NSURL URLWithString:InterfaceM.images.small];
    
    _mainland_pubdateLabel.text = InterfaceM.mainland_pubdate;
    
    //average
    _rateAverageLabel.text = [NSString stringWithFormat:@"%ld", (long)InterfaceM.rate.average];
    
    //stars
    _starsLabel.text =[NSString stringWithFormat:@"%ld", (long)InterfaceM.rate.stars];
    
    
    
    //******************set update for array labels without image**********************//
    
    //1.pubdate
    NSArray * pubdateArray = InterfaceM.pubdates;
    NSString * pubdateR= @"";
    for (int i = 0; i < pubdateArray.count; i++){
        NSString * tempName = pubdateArray[i];
        pubdateR = [pubdateR stringByAppendingString:tempName];
        if(i <pubdateArray.count-1){
            pubdateR =[pubdateR stringByAppendingString:@", "];
        }
        
    }
    
    _genreLabel.text = pubdateR;
    
    
    
    //2.genre
    NSArray * genreArray = InterfaceM.genres;
    NSString * genreR= @"";
    for(int i = 0; i < genreArray.count; i++){
        NSString * tempName = genreArray[i];
        genreR = [genreR stringByAppendingString:tempName];
        if(i <genreArray.count-1){
            genreR = [genreR stringByAppendingString:@", "];
        }
        
    }
    
    _genreLabel.text = genreR;
    
    
    //3.castname
    NSArray * castnameArray = InterfaceM.casts;
    NSString* castR = @"";
    for(int i =0; i < castnameArray.count; i++){
        data_casts * setModel= castnameArray[i];
        NSString* tempName = setModel.name1;
        castR = [castR stringByAppendingString:tempName ];
        if(i< castnameArray.count -1){
            castR = [castR stringByAppendingString:@", "];
        }
    }
    _castnameLabel.text= castR;
    
    
    
    //4.castnameEn
    NSArray * castnameEnArray = InterfaceM.casts;
    NSString* castEnR = @"";
    for(int i =0; i < castnameEnArray.count; i++){
        data_casts * setModel= castnameEnArray[i];
        NSString* tempName = setModel.name_en1;
        castEnR = [castEnR stringByAppendingString:tempName ];
        if(i< castnameEnArray.count -1){
            castEnR = [castEnR stringByAppendingString:@", "];
        }
    }
    _castsnameenLabel.text = castEnR;
    
    
    //5.directorname
    NSArray * directnameArray = InterfaceM.directors;
    NSString* directnameR = @"";
    for(int i =0; i < directnameArray.count; i++){
        data_directors * setModel= directnameArray[i];
        NSString* tempName = setModel.name2;
        directnameR= [directnameR stringByAppendingString:tempName ];
        if(i< directnameArray.count -1){
            directnameR = [directnameR stringByAppendingString:@", "];
        }
    }
    _directorsNameLabel.text = directnameR;
    
    
    //6.directornameEn
    NSArray * directnameEnArray = InterfaceM.directors;
    NSString* directnameEnR = @"";
    for(int i =0; i < directnameEnArray.count; i++){
        data_directors * setModel= directnameEnArray[i];
        NSString* tempName = setModel.name_en2;
        directnameEnR= [directnameEnR stringByAppendingString:tempName ];
        if(i< directnameEnArray.count -1){
            directnameEnR = [directnameEnR stringByAppendingString:@", "];
        }
    }
    _directorsNameEnLabel.text = directnameEnR;
    
    
    
    //******************set update for array labels with image**********************//
    
    //cast icon
    
    NSArray * castIconArray = InterfaceM.casts;
    NSString * castIconT = @"";
    for(int i = 0; i < castnameArray.count; i++){
        data_casts * SetModel = castIconArray[i];
        NSString* TempAlt = SetModel.avatars1.small;
        castIconT = [castIconT stringByAppendingString:TempAlt];
        if(i < castIconArray.count -1){
            castIconT = [castIconT stringByAppendingString:@", "];
        }
    }
    _CastsIcon.yy_imageURL = [NSURL URLWithString:castIconT];
    
    //director icon
    NSArray * directIconArray = InterfaceM.directors;
    NSString * directIconT = @"";
    for(int i = 0; i < directnameArray.count; i++){
        data_directors * SetModel = directIconArray[i];
        NSString* TempAlt = SetModel.avartas2.small;
        directIconT = [directIconT stringByAppendingString:TempAlt];
        if(i < directIconArray.count -1){
            directIconT = [directIconT stringByAppendingString:@", "];
        }
    }
    _DirectorsIcon.yy_imageURL = [NSURL URLWithString:directIconT];
    
}



//******************-creat top, center, footer view-**********************//

-(void) createControl{
    [self createTopView];
    
    [self creatCenterView];
    
    [self createFooterView];
    
    [self creatGrayView];
}



//top view with film name and mainland pubdate
-(void)createTopView{
    UIView *topView = [[UIView alloc]init];
    [self.contentView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker * make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    //film title
    interfaceView * titleLabel = [[interfaceView alloc] init];
    [topView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker * make){
        make.centerY.mas_equalTo(topView);
        make.right.mas_equalTo(-20);
    }];
    // _filmNameLabel = titleLabel;
    
    interfaceView * mainlandLabel = [[interfaceView alloc] init];
    [topView addSubview: mainlandLabel];
    [mainlandLabel mas_makeConstraints:^(MASConstraintMaker * make){
        make.centerY.mas_equalTo(topView);
        make.left.mas_equalTo(15);
    }];
    // _mainland_pubdateLabel = mainlandLabel;
    
}


//center view with icon, directer, cast
-(void)creatCenterView{
    UIView * centerView = [[UIView alloc]init];
    [self.contentView addSubview:centerView];
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(44);
        make.height.mas_equalTo(109+15);
    }];
    
    //icon
    UIImageView *iconLabel = [[UIImageView alloc] init];
    [centerView addSubview:iconLabel];
    [iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(iconLabel.mas_right).mas_equalTo(15);
    }];
    _filmIcon = iconLabel;
    
    
    //director
    interfaceView * directLable = [[interfaceView alloc] init];
    [centerView addSubview:directLable];
    [directLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(directLable.mas_right).mas_equalTo(2);
        make.top.mas_equalTo(directLable);
    }];
    
    //director icon
    UIImageView * directIcon = [[UIImageView alloc] init];
    [centerView addSubview:directIcon];
    [directIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(directIcon.mas_right).mas_equalTo(2);
        make.top.mas_equalTo(directIcon);
    }];
    _DirectorsIcon = directIcon;
    
    //castname
    interfaceView * castLabel = [[interfaceView alloc]init];
    [centerView addSubview:castLabel];
    [castLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(castLabel.mas_right).mas_equalTo(5);
        make.top.mas_equalTo(castLabel);
    }];
    
    //casts icon
    UIImageView * castIcon = [[UIImageView alloc] init];
    [centerView addSubview:castIcon];
    [castIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(castLabel.mas_right).mas_equalTo(10);
        make.top.mas_equalTo(castLabel);
    }];
    _CastsIcon = castIcon;
    
}


//foot view with average rating and stars...
-(void)createFooterView{
    UIView * footerView = [[UIView alloc] init];
    [self.contentView addSubview:footerView];
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.bottom.mas_equalTo(-10);
    }];
    
    //rate average
    interfaceView * rateLabel = [[interfaceView alloc] init];
    [footerView addSubview:rateLabel];
    [rateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(rateLabel.mas_right).mas_equalTo(0);
        make.top.mas_equalTo(rateLabel);
    }];
    
    //stars
    interfaceView * starLabel = [[interfaceView alloc]init];
    [footerView addSubview:starLabel];
    [starLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(rateLabel.mas_right).mas_equalTo(6);
        make.top.mas_equalTo(rateLabel);
    }];
}

//gray underline
-(void)creatGrayView{
    UIView * grayView = [[UIView alloc] init];
    grayView.backgroundColor =UIColor.grayColor;
    [self.contentView addSubview:grayView];
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.height.mas_equalTo(10);
    }];
}

@end
