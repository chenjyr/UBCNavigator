//
//  SecondViewController.h
//  UBC Navigator
//
//  Created by Jackie Chen on 12-02-19.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface BuildingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate> {

    NSMutableDictionary *buildings, *sections;
    NSArray *datasource;
    
    
    
    IBOutlet UISearchBar *searchBar;
    IBOutlet UITableView *myTableView;
    
    BOOL searching;
    BOOL letUserSelectRow;
}


@property(nonatomic, retain) NSMutableDictionary *buildings;
@property(nonatomic, retain) NSMutableDictionary *sections;
@property(nonatomic, retain) NSArray *datasource;
@property(nonatomic, retain) IBOutlet UISearchBar *searchBar;
@property(nonatomic, retain) IBOutlet UITableView *myTableView;

-(void)setupArray;


@end
