//
//  ShellExecAppDelegate.m
//  ShellExec
//
//  Created by Simon Ljungberg on 2011-05-08.
//  Copyright 2011 Good Old. All rights reserved.
//

#import "ShellExecAppDelegate.h"
#import "HWReadEnv.h"

@implementation ShellExecAppDelegate
@synthesize button;

@synthesize indicator;
@synthesize window;
@synthesize command;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    _env = [[HWReadEnv readEnvironment] retain];
    [window setDefaultButtonCell:[button cell]];
    q = [[NSOperationQueue alloc] init];
}

- (IBAction)execute:(id)sender {
    [indicator startAnimation:nil];
    [q addOperationWithBlock:^ {
        NSTask *task;
        task = [[NSTask alloc] init];
        [task setEnvironment:_env];
        [task setLaunchPath: @"/bin/bash"];
        
        NSPipe *pipe;
        pipe = [NSPipe pipe];
        [task setStandardInput: pipe];
        
        NSFileHandle *file;
        file = [pipe fileHandleForWriting];
        
        [task launch];
        
        NSString *cmd = [command stringValue];
        [file writeData:[cmd dataUsingEncoding:NSUTF8StringEncoding]];
        
        [file closeFile];
        
        [task waitUntilExit];
        [task release];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [indicator stopAnimation:nil];
        }];
    }];
}

@end
