//
//  starView.h
//  解析json并进行传值
//
//  Created by mac on 16/7/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface starView : UIView{
    
    UIView *yellowView;
    UIView *grayView;
}

//因为要通过评分来判断黄色星星view的长度

@property (nonatomic,assign)float rating;









@end
