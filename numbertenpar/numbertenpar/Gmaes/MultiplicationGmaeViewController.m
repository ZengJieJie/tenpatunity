//
//  GamenumerViewController.m
//  numbertenpar
//
//  Created by adin on 2024/7/8.
//

#import "MultiplicationGmaeViewController.h"
#import "Masonry.h"
@interface MultiplicationGmaeViewController ()
@property (weak, nonatomic) IBOutlet UIView *homeview;
@property (nonatomic, strong) NSMutableArray<UIButton *> *buttonsimageArray;
@property (nonatomic, strong) NSMutableArray *backaray;
@property (nonatomic,assign) NSInteger *Previous;
@property (nonatomic,assign) int Luckynumber;
@property (nonatomic,assign) int Luckynumber2;
@property (nonatomic,assign) int Luckynumber3;
@property (nonatomic,assign) int score;

@property (nonatomic, weak) UIButton *lastClickedButton;
@property (nonatomic, weak) UIButton *secondLastClickedButton;




@property (weak, nonatomic) IBOutlet UILabel *lukeylabb;

@property (weak, nonatomic) IBOutlet UILabel *scorelabb;

@property (weak, nonatomic) IBOutlet UILabel *timelabb;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic) NSInteger timernumber;

@property (nonatomic, strong) NSArray<NSNumber *> *numbersArray;
@property (nonatomic, strong) NSArray<NSNumber *> *randomNumbers;
@end



@implementation MultiplicationGmaeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonsimageArray = [NSMutableArray array];
    self.backaray = [self generateRandomNumbers:36 min:1 max:10];
    [self createGrid];
    self.Previous=0;
    self.score=0;
    
       self.numbersArray = @[@12, @14, @15, @16, @18, @20, @21, @24, @25, @27, @28, @30, @32, @35, @36, @40, @42, @45, @48, @49];
       
      self.randomNumbers = [self getRandomNumbersFromArray:self.numbersArray count:3];
    
    
   
    self.lukeylabb.text=[NSString stringWithFormat:@"%@,%@,%@",self.randomNumbers[0],self.randomNumbers[1],self.randomNumbers[2]];
    
    self.scorelabb.text=[NSString stringWithFormat:@"%d",self.score];
    
    
    
       self.timernumber = 120;
       
       self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                     target:self
                                                   selector:@selector(updatetimelabb)
                                                   userInfo:nil
                                                    repeats:YES];
    // Do any additional setup after loading the view from its nib.
}

- (NSArray<NSNumber *> *)getRandomNumbersFromArray:(NSArray<NSNumber *> *)array count:(NSUInteger)count {
    NSMutableArray<NSNumber *> *mutableArray = [array mutableCopy];
    NSMutableArray<NSNumber *> *resultArray = [NSMutableArray arrayWithCapacity:count];
    
    for (NSUInteger i = 0; i < count; i++) {
        if (mutableArray.count == 0) {
            break;
        }
        
        NSUInteger randomIndex = arc4random_uniform((uint32_t)mutableArray.count);
        [resultArray addObject:mutableArray[randomIndex]];
        [mutableArray removeObjectAtIndex:randomIndex];
    }
    
    return resultArray;
}

- (void)updatetimelabb {
    self.timernumber--;
    self.timelabb.text = [NSString stringWithFormat:@"%ld", (long)self.timernumber];
    
    if (self.timernumber <= 0) {
        [self.timer invalidate];
        self.timer = nil;
        [self gamerovertime];
    }
}


- (void)gamerovertime {
    
    NSString *mes=[NSString stringWithFormat:@"Hello, the game is over and your score is %d points",self.score];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title"
                                                                                 message:mes
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
                                                         }];
        
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
}

- (int)generateRandomNumberBetween:(int)min and:(int)max {
    return arc4random_uniform(max - min + 1) + min;
}
- (IBAction)gameclick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSMutableArray *)generateRandomNumbers:(NSInteger)count min:(NSInteger)min max:(NSInteger)max {
    NSMutableArray *numbers = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        int randomNumber = arc4random_uniform((uint32_t)(max - min + 1)) + (int)min;
        [numbers addObject:@(randomNumber)];
    }
    return numbers;
}

- (void)createGrid{
    int rows = 6;
    int columns = 6;
   
   
    UIView *lastView = nil;
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < columns; j++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            int tagsj = arc4random_uniform(4) + 1;
          
            [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d-%@",tagsj,self.backaray[i * columns + j]]] forState:UIControlStateNormal];
            button.tag = i * columns + j;
            
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.homeview addSubview:button];
            [self.buttonsimageArray addObject:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                if (lastView) {
                    if (j == 0) {
                        make.top.equalTo(lastView.mas_bottom).offset(5);
                        make.left.equalTo(self.homeview);
                    } else {
                        make.left.equalTo(lastView.mas_right).offset(5);
                        make.top.equalTo(lastView.mas_top);
                    }
                } else {
                    make.top.left.equalTo(self.homeview);
                }
                make.width.equalTo(self.homeview).multipliedBy(1.0/columns).offset(-5);
                make.height.equalTo(button.mas_width);
            }];
            lastView = button;
        }
    }
}

- (void)buttonClicked:(UIButton *)sender {
   
    sender.enabled = NO;  // Disable the button
    sender.alpha = 0.5;
    
    self.secondLastClickedButton.enabled=YES;
    self.secondLastClickedButton.alpha=1.0;
    
    self.secondLastClickedButton = self.lastClickedButton;
    self.lastClickedButton = sender;
    
    if (self.lastClickedButton!=nil&&self.secondLastClickedButton!=nil){
        
        NSNumber* ac=self.backaray[self.lastClickedButton.tag];
        NSNumber* bc=self.backaray[self.secondLastClickedButton.tag];
        
        NSNumber* aone=self.randomNumbers[0];
        NSNumber* atwo=self.randomNumbers[1];
        
        NSNumber* athree=self.randomNumbers[2];

        int acbcsum=[ac intValue]*[bc intValue];
        
        
        
        if (acbcsum==[aone intValue]||acbcsum==[atwo intValue]||acbcsum==[athree intValue]){
            self.secondLastClickedButton.enabled=YES;
            self.secondLastClickedButton.alpha=1.0;
            self.lastClickedButton.enabled=YES;
            self.lastClickedButton.alpha=1.0;
            
            [self modifyArrayItemAtIndex:self.lastClickedButton.tag withValue:@([self generateRandomNumberBetween:1 and:10])];
            [self modifyArrayItemAtIndex:self.secondLastClickedButton.tag withValue:@([self generateRandomNumberBetween:1 and:10])];
        
            int tagsj = arc4random_uniform(4) + 1;
            [self.secondLastClickedButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d-%@",tagsj,self.backaray[self.secondLastClickedButton.tag]]] forState:UIControlStateNormal];
            int tagsj2 = arc4random_uniform(4) + 1;
            [self.lastClickedButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d-%@",tagsj2,self.backaray[self.lastClickedButton.tag]]] forState:UIControlStateNormal];
            //修改计分成功之后的图片

            
            
           
            self.lastClickedButton=nil;
            self.secondLastClickedButton=nil;
            self.score+=10;
            self.scorelabb.text=[NSString stringWithFormat:@"%d",self.score];
        }
        
    }

}

- (void)modifyArrayItemAtIndex:(NSInteger)index withValue:(NSNumber * )value {
    if (index < self.backaray.count) {
       
        self.backaray[index] = value;
    } else {
        NSLog(@"Index out of bounds");
    }
}

- (void)updateButtonBackgroundImages {
    for (UIButton *button in self.buttonsimageArray) {
        int tagsj = arc4random_uniform(4) + 1;
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d-%@",tagsj,self.backaray[button.tag]]] forState:UIControlStateNormal];
    }
}
- (IBAction)resclick:(id)sender {
    
  
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title"
                                                                                 message:@"Are you sure you want to reset the game？"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * _Nonnull action) {
            
                                                             }];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
            self.backaray = [self generateRandomNumbers:36 min:1 max:10];
            [self updateButtonBackgroundImages];
            self.score=0;
            self.timernumber = 120;
            self.randomNumbers=nil;
            self.randomNumbers = [self getRandomNumbersFromArray:self.numbersArray count:3];
          
          
           
          self.lukeylabb.text=[NSString stringWithFormat:@"%@,%@,%@",self.randomNumbers[0],self.randomNumbers[1],self.randomNumbers[2]];
            
            self.scorelabb.text=[NSString stringWithFormat:@"%d",self.score];
                                                         }];
        
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    
   
}

@end
