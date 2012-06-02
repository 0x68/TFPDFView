/*
 * AppController.j
 * TFPDFView
 *
 * Created by Tim Fiedler on June 2, 2012.
 * Copyright 2012, 0x68 All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "PDFViewController.j"


@implementation AppController : CPObject
{
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
     var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    pdfViewController = [[PDFViewController alloc] initWithFrame:CGRectMake(250, 250, 800, 1024)];
    [contentView addSubview:pdfViewController];

    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    [CPMenu setMenuBarVisible:YES];
}

@end
