/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */

#import "DoHiProgressHudModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "ProgressHudViewProxy.h"

@implementation DoHiProgressHudModule

#pragma mark Internal

// this is generated for your module, please do not change it
- (id)moduleGUID {
	return @"0954ecf1-ccb6-438b-8627-db3cc2ad5c11";
}

// this is generated for your module, please do not change it
- (NSString *)moduleId {
	return @"do.hi.progress.hud";
}

#pragma mark Lifecycle

- (void)startup {
	[super startup];
	NSLog(@"[INFO] %@ loaded", self);
}

- (void)shutdown:(id)sender {
	[super shutdown:sender];
}

#pragma mark Cleanup 

- (void)dealloc {
	[super dealloc];
}

#pragma mark Internal Memory Management

- (void)didReceiveMemoryWarning:(NSNotification *)notification {
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

- (void)_listenerAdded:(NSString *)type count:(int)count {
}

- (void)_listenerRemoved:(NSString *)type count:(int)count {
}

#pragma Public APIs

- (id)createProgressHud:(id)args {
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    
    NSDictionary *dict = args ? args : [NSDictionary dictionary];
    
    return [[[ProgressHudViewProxy alloc] _initWithPageContext:[self pageContext] args:[NSArray arrayWithObject:dict]] autorelease];
}


@end
