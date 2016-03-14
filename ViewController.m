//
//  ViewController.m
//  ShowOrHideFullText
//
//  Created by KrisKang on 16/3/14.
//  Copyright © 2016年 KrisKang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, assign) CGRect txtFrame;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"ShowOrHideFullTextDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self labelText];
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button .frame = CGRectMake(40, self.label.frame.origin.y + 30, 40, 30);
    self.button .backgroundColor = [UIColor whiteColor];
    [self.button setTitle:@"show" forState:UIControlStateNormal];
    [self.view addSubview:self.button ];
    [self.button  addTarget:self action:@selector(showFullText:) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.txtFrame.size.height < 20) {
        self.button.hidden = YES;
    } else {
        self.button.hidden = NO;
    }

}

- (void)showFullText:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        self.label.frame = CGRectMake(10, 100, 300,
                                      _txtFrame.size.height =[self.label.text boundingRectWithSize:
                                                              CGSizeMake(_txtFrame.size.width, CGFLOAT_MAX)
                                                                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                                                        attributes:[NSDictionary dictionaryWithObjectsAndKeys:_label.font,NSFontAttributeName, nil] context:nil].size.height);
        self.label.frame = CGRectMake(10, 100, 300, _txtFrame.size.height);
        NSLog(@"1");
        
        self.button .frame = CGRectMake(20, self.label.frame.origin.y +self.label.frame.size.height, 40, 30);
        [self.button setTitle:@"hide" forState:UIControlStateNormal];
        
        
    } else {
        self.label.frame = CGRectMake(10, 100, 300, 20);
        NSLog(@"2");
        self.button .frame = CGRectMake(20, self.label.frame.origin.y + self.label.frame.size.height, 40, 30);
        [self.button setTitle:@"show" forState:UIControlStateNormal];
    }

}
- (void)labelText {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 20)];
    self.label.text = @"测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字";
    //清空背景颜色
    self.label.backgroundColor = [UIColor clearColor];
    //设置字体颜色为白色
    self.label.textColor = [UIColor whiteColor];
    //设置label的背景色为黑色
    self.label.backgroundColor = [UIColor blackColor];
    //文字居中显示
    self.label.textAlignment = UITextAlignmentCenter;
    //自动折行设置
    self.label.lineBreakMode = UILineBreakModeWordWrap;
    self.label.numberOfLines = 0;
    
    //自适应高度
    self.txtFrame = self.label.frame;
    
    [self.view addSubview:self.label];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
