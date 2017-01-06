//
//  ComplexPromptDialogView.m
//  PromptDialogDemo
//
//  Created by WangQiao on 17/1/5.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "ComplexPromptDialogView.h"
#import "UIView+SetRect.h"

typedef enum : NSUInteger {
    
    kButton1Tag = 1,
    kButton2Tag,
    kConfirmButton,
    
} EComplexPromptDialogView;

@interface ComplexPromptDialogView ()

@property (nonatomic, strong) UIView   *backView;
@property (nonatomic, strong) UIView   *smallView;
@property (nonatomic, strong) UILabel  *label;
@property (nonatomic, strong) UIView   *lineView;

@property (nonatomic, strong) UIView      *upContentView;
@property (nonatomic, strong) UIImageView *weixinView;
@property (nonatomic, strong) UIImageView *weiXinImageView;
@property (nonatomic, strong) UILabel     *weiXinLabel;
@property (nonatomic, strong) UIButton    *button1;

@property (nonatomic, strong) UIView      *downContentView;
@property (nonatomic, strong) UIImageView *ZhiFuBaoView;
@property (nonatomic, strong) UIImageView *ZhiFuBaoImageView;
@property (nonatomic, strong) UILabel     *zhifubaoLabel;
@property (nonatomic, strong) UIButton    *button2;

@property (nonatomic, strong) UIButton     *confirmButton;

// 标记传出事件
@property (nonatomic) NSInteger type;

@end

@implementation ComplexPromptDialogView

- (void)setUpPromptDialogStyle {
    
    self.alpha = 0.f;
    
    self.backView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
    self.backView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [self addSubview:self.backView];
    
    self.smallView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 280)];
    self.smallView.center          = self.backView.center;
    self.smallView.backgroundColor = [UIColor whiteColor];
    self.smallView.layer.cornerRadius = 5;
    self.smallView.clipsToBounds    = YES;
    [self.backView addSubview:self.smallView];
    
    self.label               = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.smallView.width, 60.f)];
    self.label.font          = [UIFont systemFontOfSize:15];
    self.label.numberOfLines = 0;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor     = [UIColor grayColor];
    [self.smallView addSubview:self.label];
    
    self.lineView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 60, self.smallView.width, 0.5f)];
    self.lineView.backgroundColor = [UIColor grayColor];
    [self.smallView addSubview:self.lineView];
    
    // 微信支付
    self.upContentView = [[UIView alloc] initWithFrame:CGRectMake(0, self.lineView.bottom, self.smallView.width, 175/2.0f)];
    [self.smallView addSubview:self.upContentView];
    
    {
        self.weixinView                    = [[UIImageView alloc] initWithFrame:CGRectMake(25, 0, 17, 17)];
        self.weixinView.layer.cornerRadius = 17/ 2.0f;
        self.weixinView.centerY            = 175/4.0f;
        self.weixinView.image              = [UIImage imageNamed:@"Group-4"];
        [self.upContentView addSubview:self.weixinView];
        
        self.weiXinImageView                    = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        self.weiXinImageView.left               = self.weixinView.right + 15;
        self.weiXinImageView.centerY            = 175/4.0f;
        self.weiXinImageView.layer.cornerRadius = 25;
        self.weiXinImageView.image              = [UIImage imageNamed:@"weixin"];
        [self.upContentView addSubview:self.weiXinImageView];
    
        self.weiXinLabel               = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 175/2.0f)];
        self.weiXinLabel.font          = [UIFont systemFontOfSize:15];
        self.weiXinLabel.numberOfLines = 0;
        self.weiXinLabel.textAlignment = NSTextAlignmentLeft;
        self.weiXinLabel.textColor     = [UIColor blackColor];
        self.weiXinLabel.text          = @"微信支付";
        self.weiXinLabel.left          = self.weiXinImageView.right + 10;
        self.weiXinLabel.centerY       = 175/4.0f;
        [self.upContentView addSubview:self.weiXinLabel];
        
        self.button1     = [[UIButton alloc] initWithFrame:self.upContentView.bounds];
        self.button1.tag = kButton1Tag;
        [self.button1 addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.upContentView addSubview:self.button1];
    }
    
    // 微信支付
    self.downContentView = [[UIView alloc] initWithFrame:CGRectMake(0, self.upContentView.bottom, self.smallView.width, 175/2.0f)];
    [self.smallView addSubview:self.downContentView];
    
    {
        self.ZhiFuBaoView                    = [[UIImageView alloc] initWithFrame:CGRectMake(25, 0, 17, 17)];
        self.ZhiFuBaoView.layer.cornerRadius = 17/ 2.0f;
        self.ZhiFuBaoView.centerY            = 175/4.0f;
        self.ZhiFuBaoView.image              = [UIImage imageNamed:@"Oval"];
        [self.downContentView addSubview:self.ZhiFuBaoView];
        
        self.ZhiFuBaoImageView                    = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        self.ZhiFuBaoImageView.left               = self.ZhiFuBaoView.right + 15;
        self.ZhiFuBaoImageView.centerY            = 175/4.0f;
        self.ZhiFuBaoImageView.layer.cornerRadius = 25;
        self.ZhiFuBaoImageView.image              = [UIImage imageNamed:@"zfb"];
        [self.downContentView addSubview:self.ZhiFuBaoImageView];
        
        self.zhifubaoLabel               = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 175/2.0f)];
        self.zhifubaoLabel.font          = [UIFont systemFontOfSize:15];
        self.zhifubaoLabel.numberOfLines = 0;
        self.zhifubaoLabel.textAlignment = NSTextAlignmentLeft;
        self.zhifubaoLabel.textColor     = [UIColor blackColor];
        self.zhifubaoLabel.text          = @"支付宝支付";
        self.zhifubaoLabel.left          = self.ZhiFuBaoImageView.right + 10;
        self.zhifubaoLabel.centerY       = 175/4.0f;
        [self.downContentView addSubview:self.zhifubaoLabel];
        
        self.button2     = [[UIButton alloc] initWithFrame:self.downContentView.bounds];
        self.button2.tag = kButton2Tag;
        [self.button2 addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.downContentView addSubview:self.button2];
    }
    
    self.confirmButton                 = [[UIButton alloc] initWithFrame:CGRectMake(0, self.downContentView.bottom, self.smallView.width, 45)];
    self.confirmButton.backgroundColor = [UIColor orangeColor];
    self.confirmButton.tag            = kConfirmButton;
    [self.confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.confirmButton addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.smallView addSubview:self.confirmButton];
    
}

- (void)buttonEvent:(UIButton *)button {
    
    if (button.tag == kButton1Tag) {
        
        self.weixinView.image   = [UIImage imageNamed:@"Group-4"];
        self.ZhiFuBaoView.image = [UIImage imageNamed:@"Oval"];
        self.type = 0;
    }
    
    if (button.tag == kButton2Tag) {
        
        self.ZhiFuBaoView.image = [UIImage imageNamed:@"Group-4"];
        self.weixinView.image = [UIImage imageNamed:@"Oval"];
        self.type = 1;
    }
    
    if (button.tag == kConfirmButton) {
       
        if (self.delegate && [self.delegate respondsToSelector:@selector(customPromptDialogView:event:)]) {
            
            [self.delegate customPromptDialogView:self event:@(self.type)];
        }
    }
}

- (void)show {
    
    self.label.text = self.dialogtext;
    [self.confirmButton setTitle:self.returnButtonText forState:UIControlStateNormal];

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
