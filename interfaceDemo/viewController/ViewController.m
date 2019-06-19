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
#import "YYModel.h"
@implementation ViewController
/*
-(NSArray *) myDataArray {
    NSString * pathString =  [[NSBundle mainBundle]pathForResource:@"data" ofType:@"txt"];
    NSString *textFieldContents=[NSString stringWithContentsOfFile:pathString encoding:NSUTF8StringEncoding error:nil];
    return _myDataArray;
}
*/


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    //initialize the tableview
    UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
    
   NSString * pathString =  [[NSBundle mainBundle]pathForResource:@"data" ofType:@"txt"];
   NSString *textFieldContents=[NSString stringWithContentsOfFile:pathString encoding:NSUTF8StringEncoding error:nil];
    NSData * getJsonData = [textFieldContents dataUsingEncoding:NSUTF8StringEncoding];
    
    //NSLog(@"--getJsonData---%@------", getJsonData);
    
   NSDictionary * getDict = [NSJSONSerialization JSONObjectWithData:getJsonData options:kNilOptions error:nil];
    NSLog(@"--textFieldContents---%@-----",getDict);
    NSArray *result = [NSArray yy_modelArrayWithClass:[interfaceModel class] json:getDict[@"subjects"]];
    
    NSLog(@"--textFieldContents---%@-----",result);
        NSLog(@"--count of result---%lu-----",(unsigned long)result.count);
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:result.count];
 /*
    [result enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        interfaceModel *Interfacem = [interfaceModel interfaceModelWithDict:obj];
        [arrayM addObject:Interfacem];
    }];
   */
   // _myDataArray = [arrayM copy];
    

    
   // _myDataArray = [getDict objectForKey:@"subjects"];
    [myTableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier = @"cellidentifier";
    interfaceView * cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if(cell == nil){
        cell = [[interfaceView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    cell.InterfaceM = self.myDataArray[indexPath.row];//load data and view to cells
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.myDataArray count];
}



@end
