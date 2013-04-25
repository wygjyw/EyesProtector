//
//  wygjywAppDelegate.m
//  EyesProtector
//
//  Created by Wyg Jyw on 4/25/13.
//  Copyright (c) 2013 wygjyw. All rights reserved.
//

#import "wygjywAppDelegate.h"

@implementation wygjywAppDelegate
@synthesize statusItem = _statusItem;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [_window close];
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

- (IBAction)startSSTimer:(id)sender
{
}

- (IBAction)stopSSTimer:(id)sender
{
}

@end
