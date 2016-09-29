//
//  TableViewCell.m
//  解析json并进行传值
//
//  Created by mac on 16/7/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TableViewCell.h"
#import "Model.h"
#import "starView.h"

@implementation TableViewCell


-(void)setModel:(Model *)model{
    //对象
    _model = model;
    //标题
    _titleLabel.text = model.title;
    //年份
    _yearLabel.text = [NSString stringWithFormat:@"上映年份：%@",model.year];
    //评分
    _ratingLabel.text = [NSString stringWithFormat:@"评分：%@",[model.rating objectForKey:@"average"]];
    //图片
    NSString *imageName = [model.images objectForKey:@"small"];
    NSURL *url = [NSURL URLWithString:imageName];
    NSData *data = [NSData dataWithContentsOfURL:url];
    _image.image = [UIImage imageWithData:data];
    //星星✨此处调用rating的set方法 model里的rating是个字典
    _starView.rating = [[model.rating objectForKey:@"average"]floatValue];
    
    
    
    
}


@end
