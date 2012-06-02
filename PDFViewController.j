
@import <AppKit/AppKit.j>
@import <Foundation/Foundation.j>
@import "TFPDFView.j"



@implementation PDFViewController : CPView{

    TFPDFView pdfView;
}

- (id)initWithFrame:(CGRect)aFrame{

    self = [super initWithFrame:aFrame];
    if(self){
        pdfView = [[TFPDFView alloc] initWithFrame:CPRectMake(150, 200, 1024.0, 560.0)];
        [self addSubview:pdfView];
    }
    return self;
}

- (void)loadData:(id)sender{
    var myURL = [[CPBundle mainBundle] pathForResource:"pdfjs/examples/helloworld/helloworld.pdf"];
    var url = [[CPURL alloc] initWithString:myURL];
    [pdfView loadPDFFromURL:url startPage:2];
}




@end
