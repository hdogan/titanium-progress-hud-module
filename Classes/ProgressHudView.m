/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2012 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "ProgressHudView.h"
#import "TiViewProxy.h"
#import "TiApp.h"

@implementation ProgressHudView

- (void)dealloc {
    [HUD setDelegate:nil];
    [HUD removeFromSuperview];
    RELEASE_TO_NIL(HUD);
    [super dealloc];
}

- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds {
    [super frameSizeChanged:frame bounds:bounds];
    
    if (!IS_NULL_OR_NIL(HUD)) {
        BOOL fullscreen = [TiUtils boolValue:[self.proxy valueForKey:@"fullscreen"] def:NO];
        
        if (!fullscreen) {
            [TiUtils setView:HUD positionRect:bounds];
            NSLog(@"[INFO] frame size changed %@", NSStringFromCGRect(bounds));
        }
    }
}

- (MBProgressHUD *)HUD {
    if (IS_NULL_OR_NIL(HUD)) {
        ENSURE_UI_THREAD_0_ARGS;
        BOOL fullscreen = [TiUtils boolValue:[self.proxy valueForKey:@"fullscreen"] def:NO];
        
        if (fullscreen) {
            UIWindow *window = [[TiApp app] window];
            HUD = [[MBProgressHUD alloc] initWithWindow:window];
            HUD.delegate = self;
            [window addSubview:HUD];
            [window bringSubviewToFront:HUD];
            
            NSLog(@"[INFO] HUD created with modal %@", NSStringFromCGRect(window.bounds));
        }
        else {
            HUD = [[MBProgressHUD alloc] initWithView:self];
            HUD.delegate = self;
            [self addSubview:HUD];
            [self bringSubviewToFront:HUD];

            NSLog(@"[INFO] HUD created without modal %@", NSStringFromCGRect(self.bounds));
        }
    }
    
    return HUD;
}

- (void)hide:(id)args {
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);

    BOOL animated   = [TiUtils boolValue:@"animated" properties:args def:YES];
    NSInteger after = [TiUtils intValue:@"after" properties:args def:0];
    NSString *type  = [TiUtils stringValue:@"type" properties:args def:nil];
    
    if (!IS_NULL_OR_NIL(type)) {
        [self setAnimationType_:type];
    }
        
    if (after > 0) {
        [[self HUD] hide:animated afterDelay:after];
    }
    else {
        [[self HUD] hide:animated];
    }
}

- (void)show:(id)args {
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    
    BOOL animated  = [TiUtils boolValue:@"animated" properties:args def:YES];
    NSString *type = [TiUtils stringValue:@"type" properties:args def:nil];
    
    if (!IS_NULL_OR_NIL(type)) {       
        [self setAnimationType_:type];
    }
        
    [[self HUD] show:animated];
}

- (void)setAnimationType_:(id)value {
    NSString *type = [TiUtils stringValue:value];
    
    if ([type isEqualToString:@"zoom"]) {
        [[self HUD] setAnimationType:MBProgressHUDAnimationZoom];
    }
    else {
        [[self HUD] setAnimationType:MBProgressHUDAnimationFade];
    }
}

- (void)setCustomView_:(id)value {
    ENSURE_SINGLE_ARG_OR_NIL(value, TiViewProxy);
    
    if (!IS_NULL_OR_NIL(value)) {
        [[self HUD] setCustomView:[value view]];
    }
}

- (void)setDetailsFont_:(id)value {
    WebFont *font = [TiUtils fontValue:value def:nil];
    
    if (!IS_NULL_OR_NIL(font)) {
        [[self HUD] setDetailsLabelFont:[font font]];
    }
}

- (void)setDetailsText_:(id)value {
    [[self HUD] setDetailsLabelText:[TiUtils stringValue:value]];
}

- (void)setFont_:(id)value {
    WebFont *font = [TiUtils fontValue:value def:nil];
    
    if (!IS_NULL_OR_NIL(font)) {
        [[self HUD] setLabelFont:[font font]];
    }
}    

- (void)setGraceTime_:(id)value {
    [[self HUD] setGraceTime:[TiUtils floatValue:value]];
}

- (void)setGradientBackground_:(id)value {       
    [[self HUD] setDimBackground:[TiUtils boolValue:value]];
}

- (void)setInProgress_:(id)value {
    [[self HUD] setTaskInProgress:[TiUtils boolValue:value]];
}

- (void)setMargin_:(id)value {
    [[self HUD] setMargin:[TiUtils floatValue:value]];
}

- (void)setMinimumShowTime_:(id)value {
    [[self HUD] setMinShowTime:[TiUtils floatValue:value]];
}

- (void)setMode_:(id)value {       
    NSString *mode = [TiUtils stringValue:value];
    
    if ([mode isEqualToString:@"determine"]) {
        [[self HUD] setMode:MBProgressHUDModeDeterminate];
    }
    else if ([mode isEqualToString:@"annular"]) {
        [[self HUD] setMode:MBProgressHUDModeAnnularDeterminate];
    }
    else if ([mode isEqualToString:@"text"]) {
        [[self HUD] setMode:MBProgressHUDModeText];
    }
    else if ([mode isEqualToString:@"custom"]) {
        [[self HUD] setMode:MBProgressHUDModeCustomView];
    }
    else {
        [[self HUD] setMode:MBProgressHUDModeIndeterminate];
    }
}

- (void)setOffset_:(id)value {
    CGPoint point = [TiUtils pointValue:value];
    
    [[self HUD] setXOffset:point.x];
    [[self HUD] setYOffset:point.y];
}

- (void)setOpacity_:(id)value {
    [[self HUD] setOpacity:[TiUtils floatValue:value]];    
}

- (void)setProgress_:(id)value {   
    [[self HUD] setProgress:[TiUtils floatValue:value]];
}

- (void)setSquare_:(id)value {
    [[self HUD] setSquare:[TiUtils boolValue:value]];
}

- (void)setText_:(id)value {
    [[self HUD] setLabelText:[TiUtils stringValue:value]];
}

#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
    if ([self.proxy _hasListeners:@"hidden"]) {
        [self.proxy fireEvent:@"hidden"];
    }
}

@end
