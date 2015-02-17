//
//  POTimer.h
//  The Pomodoro
//
//  Created by Ethan Hess on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const currentRoundNotification = @"currentRoundNotification";
static NSString * const secondTickNotification = @"secondTickNotification";

@interface POTimer : NSObject

@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger seconds;

+(POTimer *)sharedInstance;

-(IBAction)startTimer:(id)sender;
-(void)cancelTimer;

@end
