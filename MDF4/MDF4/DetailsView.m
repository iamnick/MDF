//
//  DetailsView.m
//  MDF4
//
//  Created by Nick Stelzer on 5/30/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "DetailsView.h"
#import "Stream.h"
#import "DataHolder.h"

@interface DetailsView ()

@end

@implementation DetailsView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
	NSString *textViewText = [[NSString alloc] initWithFormat:@"Stream Details\n\nTitle: %@\nStreamer: %@\nCurrent Viewers: %@\nTotal Stream Views: %@\nStream Link: %@", [[[DataHolder GetInstance] stream] title], [[[DataHolder GetInstance] stream] username], [[[DataHolder GetInstance] stream] viewers], [[[DataHolder GetInstance] stream] totalViews], [[[DataHolder GetInstance] stream] streamLink]];
	textView.text = textViewText;
    self.title = [[[DataHolder GetInstance] stream] username];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
