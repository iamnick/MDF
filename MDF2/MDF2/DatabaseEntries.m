//
//  DatabaseEntries.m
//  MDF2
//
//  Created by Nick Stelzer on 5/16/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "DatabaseEntries.h"

@implementation DatabaseEntries

static DatabaseEntries *_instance = nil;

+(void)CreateInstance
{
	if (_instance == nil) {
    	[[self alloc] init];
    }
}

+(DatabaseEntries*)GetInstance
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
    	//custom init
        [self setAuthors:@[@"Author1", @"Author2", @"Author3", @"Author4", @"Author5", @"Author6", @"Author7", @"Author8", @"Author9", @"Author10", @"Author11", @"Author12"]];
        [self setTitles:@[@"Author1", @"Author2", @"Author3", @"Author4", @"Author5", @"Author6", @"Author7", @"Author8", @"Author9", @"Author10", @"Author11", @"Author12"]];
    	[self setDocTypes:@[@"Author1", @"Author2", @"Author3", @"Author4", @"Author5", @"Author6", @"Author7", @"Author8", @"Author9", @"Author10", @"Author11", @"Author12"]];
        [self setSources:@[@"Author1", @"Author2", @"Author3", @"Author4", @"Author5", @"Author6", @"Author7", @"Author8", @"Author9", @"Author10", @"Author11", @"Author12"]];
        [self setLinks:@[@"Author1", @"Author2", @"Author3", @"Author4", @"Author5", @"Author6", @"Author7", @"Author8", @"Author9", @"Author10", @"Author11", @"Author12"]];
    }
    return self;
}

@end
