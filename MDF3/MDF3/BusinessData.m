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
        [self setNames:@[@"Barnes & Noble", @"Big Y", @"Costco", @"Dell", @"Domino's Pizza", @"Five Guys", @"GameStop", @"Papa John's", @"Petco", @"Walmart"]];
        [self setLocs:@[@"New York City, NY", @"Springfield, MA", @"Issaquah, WA", @"Round Rock, TX", @"Ann Arbor, MI", @"Lorton, VA", @"Grapevine, TX", @"Louisville, KY", @"San Diego, CA", @"Bentonville, AR"]];
        [self setLats:@[@40.4251, @42.0605, @47.3149, @30.3029, @42.1614, @38.4215, @32.5603, @38.1515, @32.4255, @36.2222]];
		[self setLngs:@[@-74.0023, @-72.3525, @-122.0153, @-97.4043, @-83.4335, @-77.1341, @-97.0440, @-85.4533, @-117.0923, @-94.1231]];
    }
    return self;
}

@end
