//
//  MapViewController.h
//  UBC Navigator
//
//  Created by Jackie Chen on 12-03-21.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController {
    
    MKMapView *mapView;
    NSString *name;
    NSString *address;
}

@property (nonatomic,retain) IBOutlet MKMapView *mapView;
@property (nonatomic,retain) NSString *name, *address;

@end
