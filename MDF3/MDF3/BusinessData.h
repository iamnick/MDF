//
//  BusinessData.h
//  MDF3
//
//  Created by Nick Stelzer on 5/22/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapkit/MapKit.h>

@interface BusinessData : NSObject

@property NSArray *names;
@property NSArray *locs;
@property NSArray *lats;
@property NSArray *lngs;
@property int selectedItem;

+(void)CreateInstance;
+(BusinessData*)GetInstance;

@end
