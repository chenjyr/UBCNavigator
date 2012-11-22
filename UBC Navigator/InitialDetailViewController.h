//
//  InitialDetailViewController.h
//  UBC Navigator
//
//  Created by Jackie Chen on 12-03-27.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitialDetailViewController : UIViewController {
    NSString *t,*i;
    IBOutlet UILabel *titleLabel;
    IBOutlet UITextView *textView;
    
}
@property(nonatomic, retain)NSString *t, *i;
@property(nonatomic, retain) IBOutlet UILabel *titleLabel;
@property(nonatomic, retain) IBOutlet UITextView *textView;

@end
