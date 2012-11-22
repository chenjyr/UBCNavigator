//
//  InitialViewController.m
//  UBC Navigator
//
//  Created by Jackie Chen on 12-03-27.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import "InitialViewController.h"
#import "InitialDetailViewController.h"
#import "PDFViewController.h"

@implementation InitialViewController
@synthesize myTableView,datasource,info;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Function for number of rows
- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

// Function for height of each cell
- (CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 125;
    } else {
        return 80;
    }
}

// Function to populate each cell of the table
- (UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        static NSString *CellIdentifier = @"Banner";
        UITableViewCell *cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        
        NSString *fileLocation = [[NSBundle mainBundle] pathForResource:@"ubc" ofType:@"gif"];
        NSData *imageData = [NSData dataWithContentsOfFile:fileLocation];
        
        cell.imageView.image  = [UIImage imageWithData:imageData];      
        return cell;

    } else {
        // Initialize cell
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        cell.textLabel.font = [UIFont boldSystemFontOfSize:30];
        cell.textLabel.text = [self.info objectAtIndex:(indexPath.row - 1)];
        
        return cell;
    }
}

// Function for user clicking the building -> Goto new view with detailed building information
- (void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 3) {
        PDFViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"pdfview"];
        [self.navigationController pushViewController:detail animated:YES];
    } else {
        InitialDetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"initialdetail"];
        
        detail.t = [self.info objectAtIndex:(indexPath.row - 1)];
        NSDictionary * temp = [self.datasource objectForKey:detail.t];
        detail.i = [temp valueForKey:@"info"];
        [self.navigationController pushViewController:detail animated:YES];
    }
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
    [super viewDidLoad];

    // Get the .plist file path in the system containing the information of the buildings
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ubc" ofType:@"plist"];
    
    // Store the .plist info inside the buildings dictionary variable
    self.datasource = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    
    self.info = [[self.datasource allKeys] sortedArrayUsingSelector:@selector(compare:)];
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
