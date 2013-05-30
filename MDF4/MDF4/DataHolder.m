//
//  DataHolder.m
//  MDF4
//
//  Created by Nick Stelzer on 5/30/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "DataHolder.h"

@implementation DataHolder

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

@end
