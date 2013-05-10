//
//  DataHolder.m
//  MDF1
//
//  Created by Nick Stelzer on 5/9/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "DataHolder.h"

@implementation DataHolder

@synthesize groceries, selectedItem;

static DataHolder *_instance = nil;

+(void)CreateInstance
{
	if (_instance == nil) {
    	[[self alloc] init];
    }
}

+(DataHolder*)GetInstance
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
	if (self = [super init])
    {
    	// Array of Grocery List Items
		groceries = [[NSMutableArray alloc] initWithObjects:@"Apples", @"Bagels", @"Bananas", @"Bread", @"Bottled Water", @"Cheese", @"Coffee Beans", @"Eggs", @"Flour", @"Frozen Pizza", @"Ham", @"Hot Dogs", @"Lettuce", @"Milk", @"Onions", @"Parsley", @"Red Peppers", @"Rice", @"Watermelon", @"Yogurt", nil];
    }
    return self;
}



@end
