//
//  ViewController.m
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import "ViewController.h"
#import "interfaceModel.h"
#import "interfaceView.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "onlineModel.h"
//#import "interfaceView.m"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width,self.view.bounds.size.height - 20)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [myTableView registerNib:[UINib nibWithNibName:@"interfaceView" bundle:nil] forCellReuseIdentifier:@"interfaceView"];
    [self.view addSubview:myTableView];
}


-(NSArray *) myDataArray{
    if(self.myDataArray ==nil){
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"]];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            interfaceModel * interfacem = [interfaceModel interfaceModelWithDict:obj];
            [arrayM addObject:interfacem];
        }];
        self.myDataArray = [arrayM copy];
    }
    return self.myDataArray;
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myDataArray.count;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    interfaceView * cell = [tableView dequeueReusableCellWithIdentifier:@"interfaceView" forIndexPath:indexPath];
    cell.InterfaceM = self.myDataArray[indexPath.row];
            return cell;
    
    
}



@end

