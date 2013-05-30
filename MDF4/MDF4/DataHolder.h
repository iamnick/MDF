//
//  DataHolder.h
//  MDF4
//
//  Created by Nick Stelzer on 5/30/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stream.h"

@interface DataHolder : NSObject

@property (strong, nonatomic) Stream *stream;

+(void)CreateInstance;
+(DataHolder*)GetInstance;

@end
