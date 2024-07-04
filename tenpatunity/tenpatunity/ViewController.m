//
//  ViewController.m
//  tenpatunity
//
//  Created by feng ting on 2024/7/4.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setunnity];
    // Do any additional setup after loading the view.
}
-(void)setunnity{
    AppDelegate *appDelegate = (AppDelegate *)([UIApplication sharedApplication].delegate);
    
   [appDelegate showUnityView];

}

@end
