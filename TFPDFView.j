@import <Foundation/CPObject.j>



@implementation TFPDFView : CPWebView
{
	CPURL theURL;
}


- (id)initWithFrame:(CGRect)aFrame
{

    self = [super initWithFrame:aFrame];

    if (self)
    {
      	[self setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
      	[self setBackgroundColor:[CPColor grayColor]];
		[self setScrollMode:CPWebViewScrollAppKit];

      	//load the viewer.html file which contains a link to the viewer.js file
		var myURL = [[CPBundle mainBundle] pathForResource:"pdfFrame/viewer.html"];
      	[self setMainFrameURL:[CPURL URLWithString:myURL]];

    }
    return self;
}

- (void)loadPDFFromURL:(CPURL)anURL startPage:(int)pageNumber
{
	if(pageNumber && pageNumber > 0){
		var theJS = "setStartPage(" + pageNumber + ");";
	    [self stringByEvaluatingJavaScriptFromString:theJS];
	}else{
		var theJS = "setStartPage(1)";
	    [self stringByEvaluatingJavaScriptFromString:theJS];
	}

    var myJS = "getMyPdfFromUrl(\"" + anURL + "\");";
    [self stringByEvaluatingJavaScriptFromString:myJS];
	theURL = anURL;
}

- (void)loadPDFFromData:(CPObject)data
{

	var myJS = "getMyPdfFromData(\"" + data + "\")";
    [self stringByEvaluatingJavaScriptFromString:myJS];
}

- (void)clear
{
    var myJS = "clear()";
    [self stringByEvaluatingJavaScriptFromString:myJS];
}

- (void)nextPage
{
    var myJS = "PDFView.page++;";
    [self stringByEvaluatingJavaScriptFromString:myJS];
}

- (void)prevPage
{
    var myJS = "PDFView.page--;";
    [self stringByEvaluatingJavaScriptFromString:myJS];
}

- (void)goToPage:(int)pageNum
{
    var myJS = "PDFView.page = " + pageNum + ";";
    [self stringByEvaluatingJavaScriptFromString:myJS];
}

- (int)numberOfPages
{
	var myJS = "getNumberOfPages()";
	return [self stringByEvaluatingJavaScriptFromString:myJS];
}

- (int)currentPage
{
	var myJS = "getCurrentPage()";
	return [self stringByEvaluatingJavaScriptFromString:myJS];
}

- (void)zoomOut
{
    var myJS = "PDFView.zoomOut();";
    [self stringByEvaluatingJavaScriptFromString:myJS];
}

- (void)zoomIn
{
    var myJS = "PDFView.zoomIn();";
    [self stringByEvaluatingJavaScriptFromString:myJS];
}

- (void)selectZoom:(CPString)zoomName
{
    /*
        <option value="0.5">50%</option>
        <option value="0.75">75%</option>
        <option value="1">100%</option>
        <option value="1.25">125%</option>
        <option value="1.5" selected="selected">150%</option>
        <option value="2">200%</option>
        <option id="pageWidthOption" value="page-width">Page Width</option>
        <option id="pageFitOption" value="page-fit">Page Fit</option>
    */
    var myJS = "PDFView.parseScale(\"" + zoomName + "\");";
    [self stringByEvaluatingJavaScriptFromString:myJS];
}



@end

