//
//  SecondViewController.m
//  UBC Navigator
//
//  Created by Jackie Chen on 12-02-19.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import "BuildingViewController.h"

@implementation BuildingViewController
@synthesize buildings, datasource, sections, searchBar, myTableView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    searching = YES;
    self.myTableView.scrollEnabled = NO;
    self.searchBar.showsCancelButton = YES;    
    self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    if (sections.count == 0) {
        BOOL found;
        for (NSString *building in datasource) {
            NSString *c = [building substringToIndex:1];
            found = NO;
            // Loop through each key in sections, and if section does not exist, create section
            for (NSString *str in [sections allKeys]) {
                if ([str isEqualToString:c]) found = YES;
            }
            if (!found) [sections setValue:[[NSMutableArray alloc] init] forKey:c];
        }
        
        // Loop again to put each building into the appropriate section
        for (NSString *building in datasource) {
            [[sections objectForKey:[building substringToIndex:1]] addObject:building];
        }
        
        @try {
            [myTableView reloadData];
        } @catch(NSException *e){
        }
        
        [self.searchBar resignFirstResponder];
        
        self.searchBar.text = @"";
    }
    
    self.searchBar.showsCancelButton = NO;
    searching = NO;
    self.myTableView.scrollEnabled = YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [sections removeAllObjects];

    NSArray *keys = [[buildings allKeys]sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    NSMutableArray *keys_filtered = [[NSMutableArray alloc]initWithObjects:nil];

    for (NSString *b in keys) {
        if([b rangeOfString:searchText options:NSCaseInsensitiveSearch].location != NSNotFound || searchText == nil)
            [keys_filtered addObject:b];
    }
    
    NSArray *datasource_filtered = [keys_filtered sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];

    BOOL found;
  
    // Loop through each building in datasource
    for (NSString *building in datasource_filtered) {
        NSString *c = [building substringToIndex:1];
        found = NO;
        // Loop through each key in sections, and if section does not exist, create section
        for (NSString *str in [sections allKeys]) {
            if ([str isEqualToString:c]) found = YES;
        }
        if (!found) [sections setValue:[[NSMutableArray alloc] init] forKey:c];
    }
    
    // Loop again to put each building into the appropriate section
    for (NSString *building in datasource_filtered) {
        [[sections objectForKey:[building substringToIndex:1]] addObject:building];
    }

}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [sections removeAllObjects];
    
    BOOL found;
    for (NSString *building in datasource) {
        NSString *c = [building substringToIndex:1];
        found = NO;
        // Loop through each key in sections, and if section does not exist, create section
        for (NSString *str in [sections allKeys]) {
            if ([str isEqualToString:c]) found = YES;
        }
        if (!found) [sections setValue:[[NSMutableArray alloc] init] forKey:c];
    }
    
    // Loop again to put each building into the appropriate section
    for (NSString *building in datasource) {
        [[sections objectForKey:[building substringToIndex:1]] addObject:building];
    }
    
    @try {
        [myTableView reloadData];
    } @catch(NSException *e){
    }
    
    [self.searchBar resignFirstResponder];
    
    self.searchBar.text = @"";
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.searchBar resignFirstResponder];
}

- (void)viewDidLoad
{
    [self setupArray];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Buildings";
}


// Set up the list of buildings, separated into alphabetical sections
- (void)setupArray {
    // Get the .plist file path in the system containing the information of the buildings
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"buildings" ofType:@"plist"];
    
    // Store the .plist info inside the buildings dictionary variable
    buildings = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    
    // Get all of the building names (the keys) and store them in an array
    NSArray * keys = [buildings allKeys]; 
    
    // Sort the array alphabetically and store them in the datasource array
    datasource = [keys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    // Loop through the datasource and find all the alphabetical sections, then section the list
    sections = [[NSMutableDictionary alloc] init];
    BOOL found;
    // Loop through each building in datasource
    for (NSString *building in datasource) {
        NSString *c = [building substringToIndex:1];
        found = NO;
        // Loop through each key in sections, and if section does not exist, create section
        for (NSString *str in [sections allKeys]) {
            if ([str isEqualToString:c]) found = YES;
        }
        if (!found) [sections setValue:[[NSMutableArray alloc] init] forKey:c];
    }
    
    // Loop again to put each building into the appropriate section
    for (NSString *building in datasource) {
        [[sections objectForKey:[building substringToIndex:1]] addObject:building];
    }
}

// Function for number of sections in the table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[sections allKeys] count];
}

// Function for titles of each section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[[sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section];
}

// Function for number of rows in each section
- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    return [[sections valueForKey:[[[sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section]] count];
}

// Function for titles of each section index
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [[sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

// Function to populate each cell of the table
- (UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Each cell has identifier "Cell", initialize cell
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    // Find the appropriate building name for the cell
    NSDictionary *building = [[sections valueForKey:[[[sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    // Label the cell with the building name
    cell.textLabel.text = (NSString *)building;
    cell.textLabel.font = [UIFont systemFontOfSize:14];

    return cell;
}

// Function for user clicking the building -> Goto new view with detailed building information
- (void) tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Initialize a new view of DetailViewController
    DetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    
    // Determine the building's name, address, and information depending on the building clicked
    detail.building = [[sections valueForKey:[[[sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    NSDictionary * temp = [buildings objectForKey:detail.building];
    detail.address = [temp valueForKey:@"address"];
    detail.info = [temp valueForKey:@"info"];
    detail.website = [temp valueForKey:@"website"];
    detail.photos = [temp valueForKey:@"photos"];
    // Display the new view with the building's information
    [self.navigationController pushViewController:detail animated:YES];
    
}

// Function for height of each cell
- (CGFloat) tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}


// Function for indexing through the sections
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    if(searching) return -1;
    index = index % [sections count];
    return index;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
