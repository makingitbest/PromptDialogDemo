//
//  OrdinaryPromptDialogView.m
//  PromptDialogDemo
//
//  Created by WangQiao on 17/1/4.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "OrdinaryPromptDialogView.h"
#import "UIView+SetRect.h"

@interface OrdinaryPromptDialogView ()

@property (nonatomic, strong) UIView   *backView;
@property (nonatomic, strong) UIView   *smallView;
@property (nonatomic, strong) UILabel  *label;
@property (nonatomic, strong) UIView   *lineView;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *confirmButton;

@end

@implementation OrdinaryPromptDialogView

- (void)setUpPromptDialogStyle {
    
    self.alpha = 0.f;
    
    self.backView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
    self.backView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [self addSubview:self.backView];
    
    self.smallView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 130)];
    self.smallView.center          = self.backView.center;
    self.smallView.backgroundColor = [UIColor whiteColor];
    self.smallView.layer.cornerRadius = 5;
    [self.backView addSubview:self.smallView];
    
    self.label               = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.smallView.width, 171/2.0f)];
    self.label.font          = [UIFont systemFontOfSize:15];
    self.label.numberOfLines = 0;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor     = [UIColor blackColor];
    [self.smallView addSubview:self.label];
    
    self.lineView                 = [[UIView alloc] initWithFrame:CGRectMake(0, self.label.bottom, self.smallView.frame.size.width, 0.5f)];
    self.lineView.backgroundColor = [UIColor grayColor];
    [self.smallView addSubview:self.lineView];
    
    self.cancelButton     = [[UIButton alloc] initWithFrame:CGRectMake(0, self.label.bottom, self.smallView.frame.size.width / 2.0f, 45)];
    self.cancelButton.tag = kCancelButton;
    [self.cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.smallView addSubview:self.cancelButton];
    
    self.confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(self.smallView.frame.size.width / 2.0f, self.label.frame.size.height, self.smallView.frame.size.width / 2.0f, 45)];
    self.confirmButton.tag = kConfirmButton;
    [self.confirmButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.confirmButton addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.smallView addSubview:self.confirmButton];
    
}

- (void)buttonEvent:(UIButton *)button {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customPromptDialogView:event:)]) {
        
        [self.delegate customPromptDialogView:self event:[button titleForState:UIControlStateNormal]];
    }
}

- (void)show {
    
    self.label.text = self.dialogtext;
    
    [self.cancelButton setTitle:self.cancelButtonText forState:UIControlStateNormal];
    [self.confirmButton setTitle:self.confirmButoonText forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.35f animations:^{
        
        self.alpha = 1.f;
    }];
}

- (void)hide {
    
    [UIView animateWithDuration:0.35f animations:^{
        
        self.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}


@end
