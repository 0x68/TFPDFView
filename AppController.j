/*
 * AppController.j
 * TFPDFView
 *
 * Created by Tim Fiedler on June 2, 2012.
 * Copyright 2012, 0x68 All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "PDFViewController.j"


@implementation AppController : CPObject {

}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
     var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    pdfViewController = [[PDFViewController alloc] initWithFrame:CGRectMake(150.0, 0.0, CGRectGetWidth([contentView bounds]) - 150.0, CGRectGetHeight([contentView bounds]))];
    [contentView addSubview:pdfViewController];
    [theWindow orderFront:self];




    [CPMenu setMenuBarVisible:YES];

    var myApplication  = [CPApplication sharedApplication],
    applicationMenu = [myApplication mainMenu];

    pdfLoadMenuItem = [[CPMenuItem alloc] init];
    [pdfLoadMenuItem setTitle:@"Load PDF"];
    [pdfLoadMenuItem setTarget:pdfViewController];
    [pdfLoadMenuItem setAction:@selector(loadData:)];
    [applicationMenu insertItem:pdfLoadMenuItem atIndex:1];


    //DO i have to unwind the default items ? Silly one !
    var theIndex = [applicationMenu indexOfItemWithTitle: @"Edit"];
    var theNewIndex  = [applicationMenu indexOfItemWithTitle: @"New" ];
    var theOpenIndex = [applicationMenu indexOfItemWithTitle: @"Open"];
    var theSaveIndex = [applicationMenu indexOfItemWithTitle: @"Save"];

	[applicationMenu removeItemAtIndex:theSaveIndex];
    [applicationMenu removeItemAtIndex:theOpenIndex];
    [applicationMenu removeItemAtIndex:theNewIndex];




}

@end
