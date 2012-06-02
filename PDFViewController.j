
@import <AppKit/AppKit.j>
@import <Foundation/Foundation.j>
@import "TFPDFView.j"



@implementation PDFViewController : CPView{

    TFPDFView pdfView;
    CPButton button;
}

- (id)initWithFrame:(CGRect)aFrame{

    self = [super initWithFrame:aFrame];
    if(self){

        button = [[CPButton alloc] initWithFrame:CGRectMake(20, 200, 70.0, 24.0)];
        [button setTitle:@"PressMe"];
        [button setTarget:self];
        [button setAction:@selector(loadData:)];
        [self addSubview:button];
        pdfView = [[TFPDFView alloc] initWithFrame:CPRectMake(150, 200, 1024.0, 560.0)];
        [self addSubview:pdfView];
    }

    return self;
}

- (void)showWindow:(id)sender{
    [[self window] orderFront:sender];
    [aView addSubview:pdfView];
}

- (void)loadData:(id)sender{
    var myURL = [[CPBundle mainBundle] pathForResource:"pdfjs/examples/helloworld/helloworld.pdf"];
    var url = [[CPURL alloc] initWithString:myURL];
    [pdfView loadPDFFromURL:url startPage:2];
}




@end
