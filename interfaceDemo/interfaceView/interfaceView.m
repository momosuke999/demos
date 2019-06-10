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


@implementation interfaceView

-(void)setInterfaceM:(interfaceModel *)InterfaceM{
    _iconLabel.images = [UIImage imageNamed:InterfaceM.icon];
    _nameLabel.text = InterfaceM.name;
    _rateLabel.text = InterfaceM.rate;
    _pubdateLabel.text = InterfaceM.pubdate;
    _idnLabel.text = InterfaceM.idn;
    _linkLabel.text = InterfaceM.link;
    _detailLabel.text = InterfaceM.detail;
    _genreLabel.text = InterfaceM.genre;
    
}

@end
