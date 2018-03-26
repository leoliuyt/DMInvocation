//
//  ViewController.m
//  DMInvocation
//
//  Created by lbq on 2018/3/26.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//@property (nonatomic, strong) ViewController *first;
//
//@property (nonatomic, assign) SEL second;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    SEL sel = @selector(getInfo:isExpand:);
    
    NSMethodSignature *methodSignature = [self methodSignatureForSelector:sel];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    [invocation setTarget:self];
    [invocation setSelector:sel];
    NSString *argument = @"hello";
    
    BOOL bl = YES;
    [invocation setArgument:&argument atIndex:2];
    [invocation setArgument:&bl atIndex:3];
    
    [invocation invoke];
    
    ViewController *_first;
    SEL _second;
    [invocation getArgument:&_first atIndex:0];//self
    [invocation getArgument:&_second atIndex:1];//_cmd
    
    BOOL value;
    [invocation getReturnValue:&value];
    
    NSLog(@"%@==",[_first description]); //\<ViewController: 0x7ff3aec08da0>==
    NSLog(@"%@",NSStringFromSelector(_second));//getInfo:isExpand:
    NSLog(@"return value = %tu",value);//return value = 1
}


- (BOOL)getInfo:(NSString *)aInfo isExpand:(BOOL)expand
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    NSLog(@"%@-%tu",aInfo,expand);
    return expand;
}

@end
