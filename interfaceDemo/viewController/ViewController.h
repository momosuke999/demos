//
//  ViewController.h
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "interfaceView.h"
#import "interfaceModel.h"
#import "onlineModel.h"


@interface ViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>
//@property (nonatomic,strong) NSArray * myDataArray;
@property(nonatomic,strong)NSMutableArray * myDataArray;
@property(nonatomic,strong) onlineModel * onlineM;
@property(nonatomic,strong) NSMutableArray * myDataArrayTemp;

//+(NSDictionary*)readLocalFileWithName:(NSString*) name;

@end


