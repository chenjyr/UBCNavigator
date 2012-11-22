//
//  PhotoViewController.m
//  UBC Navigator
//
//  Created by Jackie Chen on 12-03-04.
//  Copyright (c) 2012 UBC. All rights reserved.
//



#import "PhotoViewController.h"
#import "PhotoSet.h"
#import "Photo.h"



@implementation PhotoViewController
@synthesize photoSet = _photoSet;
@synthesize photoPaths;
@synthesize photos = _photos;



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

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void) viewDidLoad {
    [super viewDidLoad];

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



-(id)initWithStr: (NSArray *)inString
{
    if (self = [super init])
    {
        self.photoPaths = inString;
        [self InitializePhotoSet];
        PhotoSet *p = [[PhotoSet alloc] initWithTitle:@"Photos" photos:self.photos];

        self.photoSource = p;

    }
    return self;
}

- (void) InitializePhotoSet {
    
    NSMutableArray *photosArray = [[NSMutableArray alloc] initWithCapacity:self.photoPaths.count];

    for (NSString* photoPath in self.photoPaths) {
        Photo *thisPhoto = [[Photo alloc] initWithCaption:@"" 
                                         urlLarge:photoPath
                                         urlSmall:photoPath
                                         urlThumb:photoPath
                                             size:CGSizeMake(800, 600)];
        [photosArray addObject:thisPhoto];
        
    }

    self.photos = photosArray;
    
    
}
@end
