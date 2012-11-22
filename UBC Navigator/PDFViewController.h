//
//  FirstViewController.h
//  UBC Navigator
//
//  Created by Jackie Chen on 12-02-19.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFViewController : UIViewController <UIScrollViewDelegate> {
    UIImageView* imageView;
    
}

@property(atomic,retain)IBOutlet UIImageView* imageView;

@end
