//
//  DatabaseEntries.h
//  MDF2
//
//  Created by Nick Stelzer on 5/16/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseEntries : NSObject

@property NSArray *titles;
@property NSArray *authors;
@property NSArray *docTypes;
@property NSArray *sources;
@property NSArray *links;

+(void)CreateInstance;
+(DatabaseEntries*)GetInstance;

@end
