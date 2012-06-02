
@import <AppKit/AppKit.j>
@import <Foundation/Foundation.j>
@import "TFPDFView.j"



@implementation PDFViewController : CPView{

    TFPDFView pdfView;
    CPView aView;
    DocumentServicesRestRequest documentServicesRestRequest;
}

- (id)initWithFrame:(CGRect)aFrame{

    self = [super initWithFrame:aFrame];
    if(self){


        pdfView = [[TFPDFView alloc] initWithFrame:CPRectMake(10, 50, 610.0, 385.0)];
        [self addSubview:pdfView];
    }

    return self;
}

- (void)showWindow:(id)sender{
    [[self window] orderFront:sender];
    [aView addSubview:pdfView];
}

- (IBAction)test:(id)sender{
    var url = [[CPURL alloc] initWithString:@"file:///Users/tfcoding/Development/Workspace/Cappuccino/PDFView/Resources/pdfjs/examples/helloworld/helloworld.pdf"];
    [pdfView loadPDFFromURL:url startPage:2];
}




@end
