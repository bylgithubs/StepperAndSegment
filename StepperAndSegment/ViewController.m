//
//  ViewController.m
//  StepperAndSegment
//
//  Created by Civet on 2019/5/20.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//定义步进器对象
//按照一定的数字来调整某个数据
@property(nonatomic,strong) UIStepper *stepper;
//分栏控制器定义
@property(nonatomic,strong) UISegmentedControl *segControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建步进器对象
    _stepper = [[UIStepper alloc] init];
    //设置位置，框高不能变更
    _stepper.frame = CGRectMake(100, 100, 80, 40);
    //设置步进器的最小值
    _stepper.minimumValue = 0;
    //设置步进器的最大值
    _stepper.maximumValue = 100;
    //设置步进器的当前值，默认值为0；
    _stepper.value = 10;
    //设置步进值，每次向前或向后步进数
    _stepper.stepValue = 1;
    //是否可以重复响应事件操作,点击不放持续改变
    _stepper.autorepeat = YES;
    //是否将步进结果通过事件函数响应出来,显示改变过程
    _stepper.continuous = YES;
    //添加事件函数
    [_stepper addTarget:self action:@selector(stepChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_stepper];
    
    //创建分栏控件
    _segControl = [[UISegmentedControl alloc] init];
    //设置控件位置，宽度可变，高度不可变
    _segControl.frame = CGRectMake(10, 200, 300, 40);
    //添加一个按钮元素
    [_segControl insertSegmentWithTitle:@"0元" atIndex:0 animated:NO];
    //参数一：按钮选项文字
    //P2:按钮的索引位置
    //P3:是否有插入的动画效果
    [_segControl insertSegmentWithTitle:@"5元" atIndex:1 animated:NO];
    [_segControl insertSegmentWithTitle:@"10元" atIndex:2 animated:NO];    //当前默认按钮索引设置
    _segControl.selectedSegmentIndex = 0;
    [_segControl addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segControl];
}

-(void)segChange{
    NSLog(@"%ld",_segControl.selectedSegmentIndex);
}

- (void)stepChange{
    NSLog(@"step press!====%f",_stepper.value);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
