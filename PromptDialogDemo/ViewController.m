//
//  ViewController.m
//  PromptDialogDemo
//
//  Created by WangQiao on 17/1/4.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SetRect.h"

#import "OrdinaryPromptDialogView.h"
#import "SimplePromptDialogView.h"
#import "ComplexPromptDialogView.h"

typedef enum : NSUInteger {

    kButtonTagStyleOne = 1,
    kButtonTagStyleTwo,
    kButtonTagStyleThree,
    
} EViewController;

@interface ViewController () <CustomPromptDialogViewDelegate>

@property(nonatomic, strong)UIButton *button1;
@property(nonatomic, strong)UIButton *button2;
@property(nonatomic, strong)UIButton *button3;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.button1                    = [[UIButton alloc] initWithFrame:CGRectMake(30, 150, Width - 60, 50)];
    self.button1.layer.cornerRadius = 5;
    self.button1.layer.borderWidth  = 1.0f;
    self.button1.titleLabel.font    = [UIFont systemFontOfSize:14];
    self.button1.tag                = kButtonTagStyleOne;
    [self.button1 setTitle:@"style One" forState:UIControlStateNormal];
    [self.button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.button1 addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button1];
    
    self.button2                    = [[UIButton alloc] initWithFrame:CGRectMake(30, 250, Width - 60, 50)];
    self.button2.layer.cornerRadius = 5;
    self.button2.layer.borderWidth  = 1.0f;
    self.button2.titleLabel.font    = [UIFont systemFontOfSize:14];
    self.button2.tag                = kButtonTagStyleTwo;
    [self.button2 setTitle:@"style Two" forState:UIControlStateNormal];
    [self.button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.button2 addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button2];
    
    self.button3                    = [[UIButton alloc] initWithFrame:CGRectMake(30, 350, Width - 60, 50)];
    self.button3.layer.cornerRadius = 5;
    self.button3.layer.borderWidth  = 1.0f;
    self.button3.titleLabel.font    = [UIFont systemFontOfSize:14];
    self.button3.tag                = kButtonTagStyleThree;
    [self.button3 setTitle:@"style Three" forState:UIControlStateNormal];
    [self.button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.button3 addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button3];
   
}

- (void)buttonEvent:(UIButton *)button {

    if (button.tag == kButtonTagStyleOne) {
        
        OrdinaryPromptDialogView *dialogView = [[OrdinaryPromptDialogView alloc] initWithFrame:self.view.bounds];
        dialogView.dialogtext        = @"是否确定下一步操作？\n yes 就是确定自己是🐱，\n no 就是确定自己是🐒？";
        dialogView.cancelButtonText  = @"NO";
        dialogView.confirmButoonText = @"YES";
        dialogView.delegate          = self;
        [self.view addSubview:dialogView];
        [dialogView show];
        
    } else if (button.tag == kButtonTagStyleTwo) {
        
        SimplePromptDialogView *simpleDialogView = [[SimplePromptDialogView alloc] initWithFrame:self.view.bounds];
        simpleDialogView.dialogtext       = @"操作成功";
        simpleDialogView.delegate         = self;
        simpleDialogView.returnButtonText = @"返回首页";
        [self.view addSubview:simpleDialogView];
        [simpleDialogView show];
        
    } else if (button.tag == kButtonTagStyleThree) {
        
        ComplexPromptDialogView *complexDialogView = [[ComplexPromptDialogView alloc] initWithFrame:self.view.bounds];
        complexDialogView.dialogtext       = @"选择支付方式";
        complexDialogView.returnButtonText = @"立即支付";
        complexDialogView.delegate         = self;
        [self.view addSubview:complexDialogView];
        [complexDialogView show];
    }
}

- (void)customPromptDialogView:(CustomPromptDialogView *)promptDialogView event:(id)event {
    
    if ([event isKindOfClass:[NSString class]]) {
        
        if ([event isEqualToString:@"YES"]) {
            
            [promptDialogView hide];
            NSLog(@"%@", event);
            
        } else if ([event isEqualToString:@"NO"]){
            
            [promptDialogView hide];
            NSLog(@"%@", event);
            
        } else if ([event isEqualToString:@"返回首页"]){
            
            [promptDialogView hide];
            NSLog(@"%@", event);
        }
        
    } else if ([event isKindOfClass:[NSNumber class]]) {
    
        if ([event isEqual:@(0)]){
            
            [promptDialogView hide];
            NSLog(@"%@", event);
            
        } else if ([event isEqual:@1]) {
            
            [promptDialogView hide];
            NSLog(@"%@", event);
        }
    }
}

@end
