//
//  PhotoSet.m
//  UBC Navigator
//
//  Created by Jackie Chen on 12-03-04.
//  Copyright (c) 2012 UBC. All rights reserved.
//


#import "PhotoSet.h"
#import "Photo.h"

@implementation PhotoSet
@synthesize title = _title;
@synthesize photos = _photos;
@synthesize photopaths = _photopaths;


- (id) initWithTitle:(NSString *)title photos:photos {
    if ((self = [super init])) {
        self.title = title;
        self.photos = photos;

        for(int i = 0; i < self.photos.count; i++) {
            Photo *photo = [self.photos objectAtIndex:i];
            photo.photoSource = self;
            photo.index = i;
        }        
    }
    return self;
}

- (void) dealloc {
    self.title = nil;
    self.photos = nil;  
}

#pragma mark TTModel

- (BOOL)isLoading { 
    return FALSE;
}

- (BOOL)isLoaded {
    return TRUE;
}

#pragma mark TTPhotoSource

- (NSInteger)numberOfPhotos {
    return self.photos.count;
}

- (NSInteger)maxPhotoIndex {
    return self.photos.count-1;
}

- (id<TTPhoto>)photoAtIndex:(NSInteger)photoIndex {
    
    if (photoIndex < self.photos.count) {
        return [self.photos objectAtIndex:photoIndex];
    } else {
        return nil;
    }
}





@end