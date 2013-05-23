//
//  BusinessData.m
//  MDF3
//
//  Created by Nick Stelzer on 5/22/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "BusinessData.h"

@implementation BusinessData

static BusinessData *_instance = nil;

+(void)CreateInstance
{
	if (_instance == nil) {
    	[[self alloc] init];
    }
}

+(BusinessData*)GetInstance
{
	return _instance;
}

+(id)alloc
{
	_instance = [super alloc];
    return _instance;
}

-(id)init
{
	if (self = [super init]){
    	// custom init, business names/coords hard coded here
        [self setNames:@[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J"]];
        [self setLats:@[@1112.1112, @2222.2222, @33.33, @44.44, @55.55, @66.66, @77.77, @88.88, @99.99, @1001.1001]];
		[self setLngs:@[@11.11, @22.22, @33.33, @44.44, @55.55, @66.66, @77.77, @88.88, @99.99, @100.100]];
    }
    return self;
}

@end
