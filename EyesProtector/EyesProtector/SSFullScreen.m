//
//  SSFullScreen.m
//  EyesProtector
//
//  Created by Wyg Jyw on 4/27/13.
//  Copyright (c) 2013 wygjyw. All rights reserved.
//

#import "SSFullScreen.h"

@interface SSFullScreen ()

@end

@implementation SSFullScreen

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(void)awakeFromNib
{
    [self.window toggleFullScreen:self];
}

-(NSSize)window:(NSWindow *)window willUseFullScreenContentSize:(NSSize)proposedSize
{
    return NSMakeSize(proposedSize.width, proposedSize.height);
}

-(NSApplicationPresentationOptions)window:(NSWindow *)window willUseFullScreenPresentationOptions:(NSApplicationPresentationOptions)proposedOptions
{
    return NSApplicationPresentationFullScreen | NSApplicationPresentationHideDock | NSApplicationPresentationAutoHideMenuBar;
}



@end
