//
//  LevelSelectionViewController.m
//  numbertenpar
//
//  Created by adin on 2024/7/8.
//

#import "LevelSelectionViewController.h"
#import "GamenumerViewController.h"
#import "DoubleGmaeViewController.h"
#import "MultiplicationGmaeViewController.h"
@interface LevelSelectionViewController ()

@end

@implementation LevelSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)numberhomeclick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)sleveclick:(id)sender {
    DoubleGmaeViewController *vc= [[DoubleGmaeViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}
- (IBAction)Nnumberclick:(id)sender {
    GamenumerViewController *vc= [[GamenumerViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
 
}

- (IBAction)Hnumberclick:(id)sender {
    MultiplicationGmaeViewController *vc= [[MultiplicationGmaeViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
