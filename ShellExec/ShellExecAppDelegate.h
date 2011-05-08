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
    NSTextField *command;
    NSDictionary *_env;
    NSButton *button;
    NSOperationQueue *q;
    NSProgressIndicator *indicator;
}
@property (assign) IBOutlet NSProgressIndicator *indicator;

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *command;
- (IBAction)execute:(id)sender;
@property (assign) IBOutlet NSButton *button;

@end
