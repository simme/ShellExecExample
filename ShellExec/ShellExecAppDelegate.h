//
//  ShellExecAppDelegate.h
//  ShellExec
//
//  Created by Simon Ljungberg on 2011-05-08.
//  Copyright 2011 Good Old. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ShellExecAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
