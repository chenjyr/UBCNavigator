//
//  DetailViewController.h
//  UBC Navigator
//
//  Created by Jackie Chen on 12-02-21.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIAlertViewDelegate>{
    NSString *building;
    NSString *address;
    NSString *info;
    NSString *website;
    NSArray *photos;
    IBOutlet UILabel *buildingLabel;
    IBOutlet UILabel *addressLabel;
    IBOutlet UITextView *infoLabel;
    IBOutlet UIButton *buttonWhere;
    IBOutlet UIButton *buttonTo;
    IBOutlet UIButton *buttonWeb;
    IBOutlet UIButton *buttonImage;
}

@property(nonatomic, retain)NSString *building, *address, *info, *website;
@property(nonatomic, retain)NSArray *photos;
@property(nonatomic, retain)IBOutlet UILabel *buildingLabel, *addressLabel;
@property(nonatomic, retain)IBOutlet UITextView *infoLabel;
@property(nonatomic, retain)IBOutlet UIButton *buttonWhere, *buttonTo, *buttonWeb, *buttonImage;

@end
