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



@interface ViewController () <UIScrollViewDelegate>

// the set of IconDownloader objects for each app
@property (nonatomic, strong) NSMutableDictionary *imageDownloadsInProgress;

@end


@implementation ViewController
//   NSMutableArray * dataArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // self.view.backgroundColor = [UIColor greenColor];
    //initialize the tableview
  /*  UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];*/
    
    _imageDownloadsInProgress = [NSMutableDictionary dictionary];
    
    
    
 if (_myDataArray == nil) {
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
        [self.tableView reloadData];
    }];
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
    interfaceView * cell = nil;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if(_myDataArray.count == 0 && indexPath.row == 0){
        cell =  [tableView dequeueReusableCellWithIdentifier:cellidentifier forIndexPath:indexPath];
    }
    
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier forIndexPath:indexPath];
        if(_myDataArray.count > 0){
            interfaceModel * filmRecord = self.myDataArray[indexPath.row];
                cell.InterfaceM = filmRecord;
            if(!filmRecord.FilmIconView){
                if(self.tableView.dragging == NO && self.tableView.decelerating == NO){
                    [self startImageDownload:filmRecord forIndexPath:indexPath];
                }
                cell.filmIcon.image = [UIImage imageNamed:@"Placeholder.png"];
            }
            
            else{
                cell.filmIcon.image = filmRecord.FilmIconView;
            }
            
        }
    }
    return cell;
}




- (void)startImageDownload:(interfaceModel *)filmRecord forIndexPath:(NSIndexPath *)indexPath{
    ImageDownload * imageDownloader = (self.imageDownloadsInProgress)[indexPath];
    if(imageDownloader == nil){
        imageDownloader = [[ImageDownload alloc] init];
        imageDownloader.filmRecord = filmRecord;
        [imageDownloader setCompletionHandler:^{
            interfaceView * cell = [self.tableView cellForRowAtIndexPath:indexPath];
            
            cell.filmIcon.image = filmRecord.FilmIconView;
            
            [self.imageDownloadsInProgress removeObjectForKey:indexPath];
        }];
        (self.imageDownloadsInProgress)[indexPath] = imageDownloader;
        [imageDownloader startDownload];
    }
}










@end
