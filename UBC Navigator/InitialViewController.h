//
//  InitialViewController.h
//  UBC Navigator
//
//  Created by Jackie Chen on 12-03-27.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitialViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate,  UITableViewDataSource> {
    
    IBOutlet UITableView *myTableView;
    NSMutableDictionary *datasource;
    NSArray *info;
    
}

@property(nonatomic, retain) IBOutlet UITableView *myTableView;
@property(nonatomic, retain) NSMutableDictionary *datasource;
@property(nonatomic, retain) NSArray *info;



@end
