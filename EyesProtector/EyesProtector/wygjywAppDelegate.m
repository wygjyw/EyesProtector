//
//  wygjywAppDelegate.m
//  EyesProtector
//
//  Created by Wyg Jyw on 4/25/13.
//  Copyright (c) 2013 wygjyw. All rights reserved.
//

#import "wygjywAppDelegate.h"
#import "PerferencesWnd.h"

@implementation wygjywAppDelegate
@synthesize statusItem = _statusItem;
@synthesize pwnd = _pwnd;
@synthesize pfullScreenWnd = _pfullScreenWnd;

-(void)initPreferencesVal
{
    NSMutableDictionary *preDict = [NSMutableDictionary dictionary];
    [preDict setValue:[NSNumber numberWithBool:YES] forKey:StartupAtLanuching];
    [preDict setValue:[NSNumber numberWithLong:40] forKey:SSTime];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults registerDefaults:preDict];
    [[NSUserDefaultsController sharedUserDefaultsController] setInitialValues:preDict];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self initPreferencesVal];
    [_window close];
    _ssTimer = [[SSTimer alloc] initWithDelegate:self];
}

-(void)awakeFromNib
{
    NSStatusBar *statusBar = [NSStatusBar systemStatusBar];
    self.statusItem = [statusBar statusItemWithLength:NSVariableStatusItemLength];
    [_statusItem setHighlightMode:YES];
    [_statusItem setMenu:_menu];
    [_statusItem setTitle:@""];
    [_statusItem setLength:26.0];
    [_statusItem setImage:[NSImage imageNamed:@"logo_small"]];
    
    // set menu item
    BOOL initStatus = YES;
    [_startMenuItem setEnabled:initStatus];
    [_stopMenuItem setEnabled:!initStatus];
}

-(void)showFullScreenWnd
{
    if (self.pfullScreenWnd == nil)
    {
        self.pfullScreenWnd = [[SSFullScreen alloc] initWithWindowNibName:@"SSFullScreen"];
    }
    [self.pfullScreenWnd showWindow:nil];
    [NSApp activateIgnoringOtherApps:YES];
}

- (IBAction)startSSTimer:(id)sender
{
    [_ssTimer start];
}

- (IBAction)stopSSTimer:(id)sender
{
    [_ssTimer stop];
}

- (IBAction)perferencesMenuItem:(id)sender
{
    if (self.pwnd == nil)
    {
        self.pwnd = [[PerferencesWnd alloc] initWithWindowNibName:@"PerferencesWnd"];
    }
    [self.pwnd showWindow:nil];
    [NSApp activateIgnoringOtherApps:YES];
}

-(void)didStart:(id)sstimer
{
    BOOL initStatus = NO;
    [_startMenuItem setEnabled:initStatus];
    [_stopMenuItem setEnabled:!initStatus];  
}

-(void)didPause:(id)sstimer
{
}

-(void)didStop:(id)sstimer
{
    BOOL initStatus = YES;
    [_startMenuItem setEnabled:initStatus];
    [_stopMenuItem setEnabled:!initStatus];
}

-(void)didChange:(id)sstimer
{
    long seconds = (long)floor([_ssTimer elapseTime]);
//    seconds /= 60;
    NSNumber *number = [[NSUserDefaults standardUserDefaults] objectForKey:SSTime];
    long val = [number longValue];
    if (val < seconds)
    {
        NSLog(@"show full screen");
    }
}

-(void)updateStatus
{
}

@end
