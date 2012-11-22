//
//  MapViewController.m
//  UBC Navigator
//
//  Created by Jackie Chen on 12-03-21.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import "MapViewController.h"
#import "DisplayMap.h"

@implementation MapViewController
@synthesize mapView, name, address;

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
    [super viewDidLoad];
    
    mapView.showsUserLocation = YES;
    
    
    NSString *addresspath = [self.address stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    addresspath = [addresspath substringToIndex:[addresspath length] - 5];
    addresspath = [addresspath stringByAppendingString:@"+UBC+Vancouver+BC+Canada"];
    NSString *urlStr = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@&output=csv", 
                        [addresspath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    //printf("%s\n",[addresspath UTF8String]);
    NSString *locationStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlStr] encoding:NSUTF8StringEncoding error:nil];

    NSArray *items = [locationStr componentsSeparatedByString:@","];
    
    double lat = 0;
    double lon = 0;
    if([items count] >= 4 && [[items objectAtIndex:0] isEqualToString:@"200"]) {
        lat = [[items objectAtIndex:2] doubleValue];
        lon = [[items objectAtIndex:3] doubleValue];
    }
    CLLocationCoordinate2D location;
    location.latitude = lat;
    location.longitude = lon;

    DisplayMap *pin = [[DisplayMap alloc] init]; 
    pin.title = self.name;
    pin.subtitle = self.address; 
    pin.coordinate = location; 
    [mapView addAnnotation:pin];

    MKCoordinateSpan span; 
    span.latitudeDelta  = 0.0075; 
    span.longitudeDelta = 0.0075; 
    
    MKCoordinateRegion region;
    region.center = pin.coordinate;  
    region.span = span;
    
    [self.mapView setRegion:region animated:YES];
    [mapView selectAnnotation:mapView.annotations.lastObject animated:NO];
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
