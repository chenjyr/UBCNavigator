//
//  DetailViewController.m
//  UBC Navigator
//
//  Created by Jackie Chen on 12-02-21.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import "DetailViewController.h"
#import "PhotoViewController.h"
#import "WebViewController.h"
#import "MapViewController.h"

@implementation DetailViewController
@synthesize building,address,info,buildingLabel,addressLabel,infoLabel,buttonWhere,buttonTo,buttonWeb,website,buttonImage,photos;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


// Function to go to related website
- (IBAction) goToWebsitePressed: (id) sender {
    if (self.website.length > 0) {
        WebViewController *w = [self.storyboard instantiateViewControllerWithIdentifier:@"relatedweb"];
        w.urlPath = self.website;
        [self.navigationController pushViewController:w animated:YES];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No website found!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];        
    }
}

// Function to display related images
- (IBAction) displayImagesPressed: (id) sender {
    if (self.photos.count > 0) {
        PhotoViewController *s = [self.storyboard instantiateViewControllerWithIdentifier:@"relatedimages"];
        s = [[PhotoViewController alloc] initWithStr:self.photos];
        [[TTURLRequestQueue mainQueue] setMaxContentLength:0];
        [self.navigationController pushViewController:s animated:YES];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No photos found!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];        
    }
}


// Function to launch Google Maps to find location of building
- (IBAction) locationOfBuildingPressed: (id) sender {  
    MapViewController *w = [self.storyboard instantiateViewControllerWithIdentifier:@"location"];
    w.name = building;
    w.address = [address substringToIndex:[address length] - 5];
    [self.navigationController pushViewController:w animated:YES];
}

// Function to launch Google Maps to find directions to building
- (IBAction) directionToBuildingPressed: (id) sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Directions" message:@"Getting Directions will leave the application."  delegate:self cancelButtonTitle:@"No Thanks" otherButtonTitles: @"Ok", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons
    if (buttonIndex == 1) {
        UIApplication *app = [UIApplication sharedApplication];
        NSString *googlemaps = @"http://maps.google.com/maps?";
        NSString *addresspath = [address stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        addresspath = [addresspath substringToIndex:[addresspath length] - 5];
        addresspath = [addresspath stringByAppendingString:@"+UBC+Vancouver+BC+Canada"];
        NSString *curlocation = @"saddr=Current%20Location&daddr=";
        NSString *locationpath = [[googlemaps stringByAppendingString:curlocation] stringByAppendingString:addresspath];
        [app openURL:[NSURL URLWithString: locationpath]];
    }
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    buildingLabel.text = building;
    addressLabel.text = address;
    infoLabel.text = info;

}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
