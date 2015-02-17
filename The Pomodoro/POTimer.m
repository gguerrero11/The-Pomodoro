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



-(void)startTimer {
    
    self.isOn = YES;
    [self isActive];
    
}

-(void)isActive {
    
    if (self.isOn == YES) {
        
    [self decreaseSecond];
    [self performSelector:@selector(isActive) withObject:nil afterDelay:1];
    }
    
}

-(void)cancelTimer {
    
    self.isOn = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
}

-(void)endTimer {
    
    self.isOn = NO;
    
    //currentRoundNotification
    
    
}

-(void)decreaseSecond {
    
    
    if (self.seconds > 0) {
        
        self.seconds --;
    }
    if (self.seconds == 0 && self.minutes > 0) {
        
        self.minutes --;
        self.seconds = 59;
    }
    else if (self.seconds == 0 && self.minutes == 0) {
        
        [self endTimer];
    }
    
    //secondTickNotification
}

@end
