//
//  wygjywAppDelegate.h
//  EyesProtector
//
//  Created by Wyg Jyw on 4/25/13.
//  Copyright (c) 2013 wygjyw. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface wygjywAppDelegate : NSObject <NSApplicationDelegate>
{
    NSStatusItem *_statusItem;
}
@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSMenu *menu;
@property (retain) NSStatusItem *statusItem;
@end
