/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiUIView.h"
#import "MBProgressHUD.h"

@interface ProgressHudView:TiUIView<MBProgressHUDDelegate> {
    @private
    MBProgressHUD *HUD;
}

- (MBProgressHUD *)HUD;

@end
