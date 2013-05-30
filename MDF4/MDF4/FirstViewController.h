//
//  FirstViewController.h
//  MDF4
//
//  Created by Nick Stelzer on 5/30/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Stream.h"

@interface FirstViewController : UIViewController <NSURLConnectionDataDelegate, NSXMLParserDelegate>
{
	NSURLRequest *request;
    NSURL *url;
    NSURLConnection *connection;
    NSMutableData *requestData;

    NSString *currentElement;
    NSMutableString *currentElementValue;
	Stream *currentStream;
    NSMutableArray *streamArray;
    
    IBOutlet UITableView *tableView;
}
@end
