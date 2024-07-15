//
//  NUMHomeViewController.m
//  numbertenpar
//
//  Created by adin on 2024/7/8.
//

#import "NUMHomeViewController.h"
#import "LevelSelectionViewController.h"
#import "numberguizeViewController.h"
@interface NUMHomeViewController ()

@end

@implementation NUMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)numHOMCLICK:(UIButton *)sender {
    LevelSelectionViewController *vc= [[LevelSelectionViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}


- (IBAction)shhomeciclck:(id)sender {
    NSURL *share = [NSURL URLWithString:@"https://apps.apple.com/app/TPatti-Lucky-Number/id6544802043"];
    NSMutableArray * sharearray = [NSMutableArray array];
    [sharearray addObject:share];
    UIActivityViewController *acbbc = [[UIActivityViewController alloc]initWithActivityItems:sharearray applicationActivities:nil];
    [self presentViewController:acbbc animated:YES completion:nil];
    acbbc.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
    };
    
}
- (IBAction)nunmberguizeclcikc:(id)sender {
    numberguizeViewController *vc= [[numberguizeViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    
}
- (IBAction)clickhuanc:(id)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title"
                                                                                 message:@"Are you sure you want to be clear about caching ？"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * _Nonnull action) {
       
                                                             }];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                           
                                                         }];
        
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    
    
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
