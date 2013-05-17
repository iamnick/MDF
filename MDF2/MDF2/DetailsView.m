//
//  DetailsView.m
//  MDF2
//
//  Created by Nick Stelzer on 5/16/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "DetailsView.h"
#import "DatabaseEntries.h"

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

- (void)viewWillAppear:(BOOL)animated
{
	// Load entry data into labels and set link for button
    int currentEntry = [[DatabaseEntries GetInstance] selectedItem];    
    titleLabel.text = [[[DatabaseEntries GetInstance] GetSpecificEntry:currentEntry] objectAtIndex:0];
    authorLabel.text = [[[DatabaseEntries GetInstance] GetSpecificEntry:currentEntry] objectAtIndex:1];
    sourceLabel.text = [[[DatabaseEntries GetInstance] GetSpecificEntry:currentEntry] objectAtIndex:2];
    entryURL = [NSURL URLWithString:[[[DatabaseEntries GetInstance] GetSpecificEntry:currentEntry] objectAtIndex:3]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
	[[UIApplication sharedApplication] openURL:entryURL];
}

@end
