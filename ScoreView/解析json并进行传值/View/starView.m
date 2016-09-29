//
//  starView.m
//  解析json并进行传值
//
//  Created by mac on 16/7/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "starView.h"

@implementation starView


-(void)awakeFromNib{
    
    [self createView];
    
    
}


-(void)createView{
    
    //首先加入图片
    UIImage *yellowImage = [UIImage imageNamed:@"yellow"];
    UIImage *grayImage = [UIImage imageNamed:@"gray"];
    
    //创建视图
    
    grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, grayImage.size.width * 5, grayImage.size.height)];
    grayView.backgroundColor = [UIColor colorWithPatternImage:grayImage];
    
    [self addSubview:grayView];
    
    
    
    yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, yellowImage.size.width * 5, yellowImage.size.height)];
    yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImage];
    [self addSubview:yellowView];

    
    //让星星根据satrView等比例缩放
    float scale = self.frame.size.height/yellowView.frame.size.height;
    grayView.transform = CGAffineTransformMakeScale(scale, scale);
    yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    
    
    //这里使得每个View都回到原点坐标
    CGRect frame = self.frame;
    frame.origin = CGPointZero;
    yellowView.frame = frame;
    grayView.frame = frame;
    
}


-(void)setRating:(float )rating{
    //传入评分
    _rating = rating;
    //计算比例
    float s = rating/10.0;
    CGRect frame = yellowView.frame;
    //根据评分比例计算黄色view的宽度
    frame.size.width = self.frame.size.width * s;
    yellowView.frame = frame;
}










@end
