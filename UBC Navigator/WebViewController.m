//
//  WebViewController.m
//  UBC Navigator
//
//  Created by Jackie Chen on 12-03-20.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController
@synthesize webView, activityIndicator, urlPath, murlPath;


//method for going backwards in the webpage history
-(IBAction)backButtonPressed:(id)sender{
    
	[webView goBack]; 
}

//method for going forward in the webpage history
-(IBAction)forwardButtonPressed:(id)sender{
    
	[webView goForward];
}

//method for refreshing
-(IBAction)refreshButtonPressed:(id)sender{
    NSURL *url = [NSURL URLWithString:self.murlPath.text];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	[webView loadRequest:requestObj];
}

//programmer defined method to load the webpage
-(void)startWebViewLoad{
    
	//Create a URL object.
	NSURL *url = [NSURL URLWithString:self.urlPath];
	
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
    self.murlPath.text = self.urlPath;
    
	//Load the request in the UIWebView.
	[webView loadRequest:requestObj];
	
}

- (void)webViewDidFinishLoad:(UIWebView *)thisWebView
{
    
	//stop the activity indicator when done loading
	[self.activityIndicator stopAnimating]; 

    NSString *currentURL = thisWebView.request.URL.absoluteString;
    self.murlPath.text = currentURL;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{    

    self.webView.scalesPageToFit = true;
    self.murlPath.enabled = false;
    self.activityIndicator.hidesWhenStopped = true;
	[self.view addSubview: self.activityIndicator];
	[self.activityIndicator startAnimating];
    
	[super viewDidLoad];
	
	//call another method to do the webpage loading
	[self performSelector:@selector(startWebViewLoad) withObject:nil afterDelay:0]; 
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
