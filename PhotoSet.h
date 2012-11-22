//
//  PhotoSet.h
//  UBC Navigator
//
//  Created by Jackie Chen on 12-03-04.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Three20/Three20.h"

@interface PhotoSet : TTURLRequestModel <TTPhotoSource> {
    NSString *_title;
    NSArray *_photos;
    NSArray* photopaths;

}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) NSArray *photos;
@property (nonatomic, copy) NSArray *photopaths;

//- (void)samplePhotoSet;
- (id) initWithTitle:(NSString *)title photos:photos;
@end
