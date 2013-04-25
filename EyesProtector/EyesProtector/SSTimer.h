//
//  SSTimer.h
//  EyesProtector
//
//  Created by Wyg Jyw on 4/25/13.
//  Copyright (c) 2013 wygjyw. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SSTimerDelegate <NSObject>

-(void)didStart:(id)sstimer;
-(void)didPause:(id)sstimer;
-(void)didStop:(id)sstimer;
-(void)didChange:(id)sstimer;

@end


@interface SSTimer : NSObject
{
    id<SSTimerDelegate> _delegate;
    
@private
    NSTimer *_timer;
    NSTimeInterval _timeInterval;
    NSDate *_refDate;
}

@property (nonatomic, assign) id<SSTimerDelegate> delegate;

-(id)initWithDelegate:(id<SSTimerDelegate>)delegate;
-(void)start;
-(void)pause;
-(void)stop;
-(NSTimeInterval)elapseTime;

-(NSString *)description;

@end
