//
//  ViewController.m
//  interfaceDemo
//
//  Created by CHUXIANWANG on 2019/6/10.
//  Copyright © 2019年 CHUXIANWANG. All rights reserved.
//

#import "ViewController.h"
//#import "interfaceModel.h"
#import "interfaceView.h"
#import "ImageDownload.h"



static NSString *CellIdentifier = @"interfaceViewCell";
static NSString *PlaceholderCellIdentifier = @"PlaceholderCell";


@interface ViewController ()


@property (nonatomic, strong) UITableView * tableView;

@end


@implementation ViewController
//   NSMutableArray * dataArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // self.view.backgroundColor = [UIColor greenColor];
    //initialize the tableview
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
 if (_myDataArray == nil) {
     
     NSString * url = @"https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%B1%B1%BE%A9&start=0&count=100&client=&udid=";
     
     NSURL * jsonURL = [NSURL URLWithString:url];
     
     NSURLSession * session = [NSURLSession sharedSession];
     
     
     NSURLSessionTask * msgtask = [session dataTaskWithURL:jsonURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         NSString *retString = [NSString stringWithUTF8String:[data bytes]];
         
         NSData * getJsonData = [retString dataUsingEncoding:NSUTF8StringEncoding];
         NSDictionary * getDict = [NSJSONSerialization JSONObjectWithData:getJsonData options:kNilOptions error:nil];
         NSMutableArray * dataArray = [[NSMutableArray alloc] init];
         NSArray *  subjectsArray  = getDict[@"subjects"];
         for (NSDictionary * tempDict in subjectsArray) {
             interfaceModel* model = [interfaceModel interfaceModelWithDict:tempDict];
             [dataArray addObject:model];
         }
         self->_myDataArray = dataArray;
         [self.tableView reloadData];
     }];
     
     [msgtask resume];
 }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 250.f;
}



-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return dataArray.count;
    return [_myDataArray count];
}




#pragma for dowanload images



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier = @"cellidentifier";
    interfaceView * cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if(cell == nil){
        cell =[ [[interfaceView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier]autorelease];
    }
    cell.InterfaceM = _myDataArray[indexPath.row];//load data and view to cells

  //  [cell.filmIcon sd_setImageWithURL:[NSURL URLWithString:url]];

    return cell;
}



@end
