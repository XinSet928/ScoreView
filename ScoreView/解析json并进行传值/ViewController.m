//
//  ViewController.m
//  解析json并进行传值
//
//  Created by mac on 16/7/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *mutArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化可变数组
    _mutArray = [NSMutableArray array];
    
    //读取json文件并进行解析
    //第一步：获取json文件的路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"us_box.json" ofType:nil];
    //第二步：将路径转换成NSData格式
    NSData *data = [NSData dataWithContentsOfFile:path];
    //第三步：观察该json文件最外边是什么，在这里是字典，如果是数组就按数组写
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    /**
     第四步：再接着观察，我们需要的东西在什么里面。🌰：需要评分标题年份图片等，
     而这些东西都是在subjects数组中，所以我们要先把这个获取出来
     */
    NSArray *subjects = [dictionary objectForKey:@"subjects"];
    //第五步：我们就可以使用循环遍历该数组了
    for (int i=0; i<subjects.count; i++) {
        //再接着看下一层，我们需要的东西又在subject字典中，所以我们要先获取他
        NSDictionary *subject = [subjects[i] objectForKey:@"subject"];
        //接着创建model对象，用来传递相关属性。
        Model *model = [[Model alloc] init];
        model.rating = [subject objectForKey:@"rating"];
        model.title = [subject objectForKey:@"title"];
        model.images = [subject objectForKey:@"images"];
        model.year = [subject objectForKey:@"year"] ;
        //将对象存在可变数组中
        [_mutArray addObject:model];
    }

    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 120;
    tableView.scrollEnabled = YES;
    [self.view addSubview:tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _mutArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellID";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil]lastObject];
    }
    
    //将每个单元格的内容给model
    Model *model = _mutArray[indexPath.row];
    //赋值
    cell.model = model;
    
    
    return cell;
}




















@end
