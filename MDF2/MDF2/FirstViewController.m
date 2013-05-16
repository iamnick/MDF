//
//  FirstViewController.m
//  MDF2
//
//  Created by Nick Stelzer on 5/15/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "FirstViewController.h"
#import "DatabaseEntries.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Periodicals", @"Periodicals");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
	[DatabaseEntries CreateInstance];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
