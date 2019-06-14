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
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.onlineM getOnlineData];
}


-(void)initData{
    UIView * view = [[UIView alloc]init];
    self.tableView.tableFooterView = view;
    self.tableView.separatorStyle = NO;//隐藏分割线
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self getDataList];
    [self getModel];
    
    self.onlineM.delegate = self;
}

-(onlineModel*)getModel{
    if(self.onlineM == nil){
        self.onlineM = [[onlineModel alloc]init ];
    }
    return self.onlineM;
}

-(NSMutableArray *) getDataList{
    if(self.myDataArray == nil){
        self.myDataArray = [NSMutableArray array];
    }
    return self.myDataArray;
}


//

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myDataArray.count;
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"interfaceIdentifier";
    interfaceView *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell ==nil){
        cell = [[interfaceView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSUInteger row = [indexPath row];
    if(row<self.myDataArray.count){
        interfaceModel * model = [[interfaceModel alloc]init];
        model = [self.myDataArray objectAtIndex:row];
       cell.filmNameLabel.text = model.tile;
    }
    return cell;
}

/*
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    static NSString *cellIdentifier = @"interfaceIdentifer";
    interfaceView *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (cell == nil){
        cell = [[interfaceView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
 
}*/










//Model

/*
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


//View

    //UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, myTableView.view.bounds.size.width,myTableView.view.bounds.size.height - 20)];
                                                                             
                                                                             
                                                                             



//number of cells
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myDataArray.count;
}

//height of table
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
}
+(NSDictionary*)readLocalFileWithName:(NSString*) name{
    NSString * path = [[NSBundle]]
    
}




-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString * cellIdentifier = @"interfaceIdenditifier";
    interfaceView * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell ==nil){
        cell = [[interfaceView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //cell.InterfaceModel = self.myDataArray[indexPath.row];
    
    NSUInteger row = [indexPath row];
    
    if(row<self.myDataArray.count){
        interfaceModel * intV = [[interfaceModel alloc] init];
        intV = [self.myDataArray objectAtIndex:row];
        cell.filmNameEnLabel.text = intV.original_title;
    }
    
    cell.filmNameEnLabel.text = @"a";
    

    return cell;
}

*/

@end
