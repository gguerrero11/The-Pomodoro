//
//  POTimerViewController.m
//  The Pomodoro
//
//  Created by Ethan Hess on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "POTimerViewController.h"
#import "POTimer.h"

@interface POTimerViewController ()

@property (weak, nonatomic) IBOutlet UIButton *startTimer;
@property (weak, nonatomic) IBOutlet UILabel *timer;
@property (weak, nonatomic) POTimer *poTimer;

@end

@implementation POTimerViewController

-(id)init {
    self = [super init];
    if (self) {
        [self registerForNotifications];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)updateTimerLabel {
    
    self.timer.text = [NSString stringWithFormat:@"%lu:%lu", (long)self.poTimer.minutes, (long)self.poTimer.seconds];
    // SecondTickNotification
    
}

-(void)registerForNotifications {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateTimerLabel) name:@"SecondTickNotification" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
