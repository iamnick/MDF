//
//  MyAnnotations.h
//  MDF3
//
//  Created by Nick Stelzer on 5/23/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotations : NSObject <MKAnnotation>
{
	NSString *title;
    CLLocationCoordinate2D coordinate;
}

@property (copy, nonatomic) NSString *title;
@property (readonly, nonatomic) CLLocationCoordinate2D coordinate;
-(id)initWithTitle:(NSString*)text coord:(CLLocationCoordinate2D)coord;

@end
