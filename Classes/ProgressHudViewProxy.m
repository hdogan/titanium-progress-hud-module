/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "ProgressHudViewProxy.h"
#import "TiUtils.h"

@implementation ProgressHudViewProxy

- (void)hide:(id)args {
    [[self view] performSelectorOnMainThread:@selector(hide:) withObject:args waitUntilDone:NO];
}

- (void)show:(id)args {
    [[self view] performSelectorOnMainThread:@selector(show:) withObject:args waitUntilDone:NO];
}

@end
