//
//  Stream.h
//  MDF4
//
//  Created by Nick Stelzer on 5/30/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stream : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *viewers;
@property (strong, nonatomic) NSString *totalViews;
@property (strong, nonatomic) NSString *streamLink;

@end
