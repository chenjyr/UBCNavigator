//
//  Photo.m
//  UBC Navigator
//
//  Created by Jackie Chen on 12-03-04.
//  Copyright (c) 2012 UBC. All rights reserved.
//

#import "Photo.h"

@implementation Photo
@synthesize caption = _caption;
@synthesize urlLarge = _urlLarge;
@synthesize urlSmall = _urlSmall;
@synthesize urlThumb = _urlThumb;
@synthesize photoSource = _photoSource;
@synthesize size = _size;
@synthesize index = _index;

- (id)initWithCaption:(NSString *)caption urlLarge:(NSString *)urlLarge urlSmall:(NSString *)urlSmall urlThumb:(NSString *)urlThumb size:(CGSize)size {
    if ((self = [super init])) {
        self.caption = caption;
        self.urlLarge = urlLarge;
        self.urlSmall = urlSmall;
        self.urlThumb = urlThumb;
        self.size = size;
        self.index = NSIntegerMax;
        self.photoSource = nil;
    }
    return self;
}

- (void) dealloc {
    self.caption = nil;
    self.urlLarge = nil;
    self.urlSmall = nil;
    self.urlThumb = nil;    
}

#pragma mark TTPhoto

- (NSString*)URLForVersion:(TTPhotoVersion)version {
    switch (version) {
        case TTPhotoVersionLarge:
            return _urlLarge;
        case TTPhotoVersionMedium:
            return _urlLarge;
        case TTPhotoVersionSmall:
            return _urlSmall;
        case TTPhotoVersionThumbnail:
            return _urlThumb;
        default:
            return nil;
    }
}

@end