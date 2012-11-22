//
//  PhotoViewController.h
//  UBC Navigator
//
//  Created by Jackie Chen on 12-03-04.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@class PhotoSet;

@interface PhotoViewController : TTPhotoViewController{
    PhotoSet *_photoSet;
    NSArray* photoPaths;
    NSArray *_photos;

}

@property (nonatomic, retain) PhotoSet *photoSet;
@property (nonatomic, copy) NSArray *photoPaths;

@property (nonatomic, retain) NSArray *photos;

-(id)initWithStr: (NSArray *)inString;
-(void)InitializePhotoSet;

@end
