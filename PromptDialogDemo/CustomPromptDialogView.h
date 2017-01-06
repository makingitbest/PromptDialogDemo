//
//  CustomPromptDialogView.h
//  PromptDialogDemo
//
//  Created by WangQiao on 17/1/4.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomPromptDialogView;

@protocol CustomPromptDialogViewDelegate <NSObject>

- (void)customPromptDialogView:(CustomPromptDialogView *)promptDialogView event:(id)event;

@end

@interface CustomPromptDialogView : UIView

@property(nonatomic, weak) id <CustomPromptDialogViewDelegate> delegate;

//提示信息
@property (nonatomic, strong) NSString *dialogtext;

// 普通样式的button上的文字
@property (nonatomic, strong) NSString *cancelButtonText;
@property (nonatomic, strong) NSString *confirmButoonText;

// 简单
@property (nonatomic, strong)  NSString * returnButtonText;



- (void)setUpPromptDialogStyle;

- (void)show;

- (void)hide;

@end
