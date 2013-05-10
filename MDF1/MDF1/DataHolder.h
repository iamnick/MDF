//
//  DataHolder.h
//  MDF1
//
//  Created by Nick Stelzer on 5/9/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHolder : NSObject

@property NSMutableArray *groceries;

+(void)CreateInstance;
+(DataHolder*)GetInstance;

@end
