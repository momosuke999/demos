//
//  ViewController.m
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import "ViewController.h"
#import "interfaceModel.h"

@implementation ViewController


-(NSArray *) myDataArray{
    if(_myDataArray ==nil){
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"]];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            interfaceModel * interfacem = [interfaceModel interfaceModelWithDict:obj];
            [arrayM addObject:interfacem];
        }];
        _myDataArray = [arrayM copy];
    }
    return _myDataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 1;
}



//-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//}


@end
