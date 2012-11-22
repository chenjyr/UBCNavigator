//
//  DisplayMap.h
//  UBC Navigator
//
//  Created by Jackie Chen on 12-03-21.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>


@interface DisplayMap : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate; 
    NSString *title; 
    NSString *subtitle;
}

@property (nonatomic, copy) NSString *title; 
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic) CLLocationCoordinate2D coordinate; 


@end
