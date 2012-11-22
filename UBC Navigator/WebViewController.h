//
//  WebViewController.h
//  UBC Navigator
//
//  Created by Jackie Chen on 12-03-20.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate> {
    UIWebView *webView;
	UIActivityIndicatorView *activityIndicator;
    NSString *urlPath;
    UITextField *murlPath;
}

@property(nonatomic,retain)IBOutlet UIWebView *webView;
@property(nonatomic,retain)IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain)NSString *urlPath;
@property(nonatomic,retain)IBOutlet UITextField *murlPath;


-(IBAction)backButtonPressed: (id)sender;
-(IBAction)forwardButtonPressed: (id)sender;
-(IBAction)refreshButtonPressed: (id)sender;

@end
