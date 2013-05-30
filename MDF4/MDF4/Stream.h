//
//  Stream.h
//  MDF4
//
//  Created by Nick Stelzer on 5/30/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stream : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *username;
@property (nonatomic) NSString *viewers;
@property (nonatomic) NSString *totalViews;
@property (nonatomic) NSString *streamLink;

@end
