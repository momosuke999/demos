//
//  interfaceView.h
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

//#ifndef interfaceView_h
#define interfaceView_h
@class interfaceModel;
#import <UIKit/UIKit.h>

@interface interfaceView: UITableViewCell

@property(weak, nonatomic)IBOutlet UILabel* rateLabel;
@property(weak, nonatomic)IBOutlet UILabel* detailLabel;
@property(weak, nonatomic)IBOutlet UILabel* genreLabel;
@property(weak, nonatomic)IBOutlet UILabel* pubdateLabel;
@property(weak, nonatomic)IBOutlet UILabel* linkLabel;
@property(weak, nonatomic)IBOutlet UILabel* idnLabel;
//@property(weak, nonatomic)IBOutlet UIImageView* iconLabel;
@property(weak, nonatomic)IBOutlet UILabel* nameLabel;


@property (nonatomic, strong) interfaceModel * InterfaceM;

@end/* interfaceView_h */
