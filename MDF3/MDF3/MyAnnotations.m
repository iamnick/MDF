//
//  MyAnnotations.m
//  MDF3
//
//  Created by Nick Stelzer on 5/23/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "MyAnnotations.h"

@implementation MyAnnotations

@synthesize title, coordinate;

-(id)initWithTitle:(NSString*)text coord:(CLLocationCoordinate2D)coord
{
	if (self = [super init]) {
    	title = text;
        coordinate = coord;
    }
    return self;
}

@end
