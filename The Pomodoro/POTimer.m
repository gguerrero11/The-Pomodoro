//
//  POTimer.m
//  The Pomodoro
//
//  Created by Ethan Hess on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "POTimer.h"


@interface POTimer ()

@property (nonatomic) BOOL isOn;

@end

@implementation POTimer

+ (POTimer *)sharedInstance {
    static POTimer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [POTimer new];
    });
    
    return sharedInstance;
}



-(void)startTimer:(id)sender {
    
    self.isOn = YES;
    [self isActive];
    
}

-(void)isActive {
    
    if (self.isOn == YES) {
        [self decreaseSecond];
        NSLog(@"%ld:%ld", (long)self.minutes, (long)self.seconds);

        [self performSelector:@selector(isActive) withObject:nil afterDelay:1];
        
    }
    
}

-(void)cancelTimer {
    
    self.isOn = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(decreaseSecond) object:nil];
    
}

-(void)endTimer {
    
    self.isOn = NO;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:currentRoundNotification object:nil];
}

-(void)decreaseSecond {
    
    
    if (self.seconds > -1) {
        
        self.seconds --;
        [[NSNotificationCenter defaultCenter]postNotificationName:secondTickNotification object:nil];
    }
    if (self.seconds == -1 && self.minutes > 0) {
        
        self.minutes --;
        self.seconds = 60;
    }
    else if (self.seconds == 0 && self.minutes == 0) {
        
        [self endTimer];
    }
}

@end
