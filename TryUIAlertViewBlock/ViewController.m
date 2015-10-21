//
//  ViewController.m
//  TryUIAlertViewBlock
//
//  Created by AlanYen on 2015/10/21.
//  Copyright © 2015年 17Life. All rights reserved.
//

#import "ViewController.h"
#import "BlocksKit+UIKit.h"
#import "UIAlertView+Blocks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIAlertView bk_showAlertViewWithTitle:@"訊息"
                                   message:@"測試 bk_showAlertViewWithTitle"
                         cancelButtonTitle:@"確定"
                         otherButtonTitles:nil
                                   handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
                                   }];

    //
    // 下面寫法會進入無窮迴圈,兩者只能擇一
    //
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"訊息"
                                                    message:@"測試 UIAlertView+Blocks"
                                                   delegate:nil
                                          cancelButtonTitle:@"取消"
                                          otherButtonTitles:@"刪除",nil];
    
    alert.tapBlock = ^(UIAlertView *alertView, NSInteger buttonIndex) {
        
        if (buttonIndex == alertView.firstOtherButtonIndex) {
        }
    };
    
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
