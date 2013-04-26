//
//  SSTimer.m
//  EyesProtector
//
//  Created by Wyg Jyw on 4/25/13.
//  Copyright (c) 2013 wygjyw. All rights reserved.
//

#import "SSTimer.h"

@interface SSTimer ()
@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, retain) NSDate *refDate;
@property (nonatomic) NSTimeInterval timeInterval;
@end

@implementation SSTimer
@synthesize timer = _timer;
@synthesize refDate = _refDate;
@synthesize timeInterval = _timeInterval;
@synthesize delegate = _delegate;

-(BOOL)isStart
{
    return (self.timer != nil);
}

-(BOOL)isPause
{
    return (self.timer == nil) && (self.timeInterval > 0);
}

-(BOOL)isStop
{
    return (self.timer == nil) && (self.timeInterval == 0);
}

-(void)start
{
    if ([self isStart])
    {
        return;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(repeat) userInfo:nil repeats:YES];
    self.refDate = [NSDate date];
    if (self.delegate)
    {
        [self.delegate didStart:self];
    }
}

-(void)pause
{
    if ([self isPause])
    {
        return;
    }
    self.timeInterval = [self elapseTime];
    [self.timer invalidate];
    self.timer = nil;
    if (self.delegate)
    {
        [self.delegate didPause:self];
    }
}

-(void)stop
{
    if ([self isStop])
    {
        return;
    }
    [self.timer invalidate];
    self.timer = nil;
    self.timeInterval = 0;
    if (self.delegate)
    {
        [self.delegate didStop:self];
    }
}

-(id)init
{
    if (self = [super init])
    {
        self.timer = nil;
        self.delegate = nil;
        self.refDate = nil;
        self.timeInterval = 0;
    }
    return self;
}

-(id)initWithDelegate:(id<SSTimerDelegate>)aDelegate
{
    if (self = [self init])
    {
        self.delegate = aDelegate;
    }
    return self;
}

-(NSTimeInterval)elapseTime
{
    if (self.timer == nil)
    {
        return self.timeInterval;
    }
    return [[NSDate date] timeIntervalSinceDate:self.refDate] + self.timeInterval;
}

-(NSString *)description
{
    long seconds = (long)floor([self elapseTime]);
    long minutes = (seconds / 60) % 60;
    long hours = seconds / 3600;
    seconds = seconds % 60;
    return [NSString stringWithFormat:@"Elapse Time = %02ld:%02ld:%02ld", hours, minutes, seconds];
}

#pragma mark --private method

-(void)repeat
{
    if (self.delegate)
    {
        [self.delegate didChange:self];
    }
}
@end
