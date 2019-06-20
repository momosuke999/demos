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
//#import "YYModel.h"
@implementation ViewController
//   NSMutableArray * dataArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // self.view.backgroundColor = [UIColor greenColor];
    //initialize the tableview
    UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
    
    
   NSURL * url = [NSURL URLWithString:@"https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%B1%B1%BE%A9&start=0&count=100&client=&udid="];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
  
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSArray *  subjectsArray = dict[@"subjects"];
        NSMutableArray * dataArray = [[NSMutableArray alloc] init];
        // dataArray = [[NSMutableArray alloc] init];
        for (NSDictionary * tempDict in subjectsArray) {
            interfaceModel * model = [interfaceModel interfaceModelWithDict:tempDict];
            [dataArray addObject:model];
            
        }
        
        self->_myDataArray = dataArray;
        [myTableView reloadData];
    }];
    
    
    
  //________________________*******************_____________________
    /*

   NSString * pathString =  [[NSBundle mainBundle]pathForResource:@"data" ofType:@"txt"];
   NSString *textFieldContents=[NSString stringWithContentsOfFile:pathString encoding:NSUTF8StringEncoding error:nil];
    NSData * getJsonData = [textFieldContents dataUsingEncoding:NSUTF8StringEncoding];
    

    
   NSDictionary * getDict = [NSJSONSerialization JSONObjectWithData:getJsonData options:kNilOptions error:nil];
  //  NSLog(@"--textFieldContents---%@-----",getDict);
    
    NSArray *  subjectsArray = getDict[@"subjects"];
    
NSMutableArray * dataArray = [[NSMutableArray alloc] init];
   // dataArray = [[NSMutableArray alloc] init];
    for (NSDictionary * tempDict in subjectsArray) {
        interfaceModel * model = [interfaceModel interfaceModelWithDict:tempDict];
        [dataArray addObject:model];
        
    }

    _myDataArray = dataArray;
    
    
    [myTableView reloadData];*/
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
  //  cell.InterfaceM = dataArray[indexPath.row];//load data and view to cells
    cell.InterfaceM = self.myDataArray[indexPath.row];
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return dataArray.count;
    return [self.myDataArray count];
}



@end
