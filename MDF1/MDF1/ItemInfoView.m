//
//  ItemInfoView.m
//  MDF1
//
//  Created by Nick Stelzer on 5/9/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "ItemInfoView.h"
#import "DataHolder.h"

@interface ItemInfoView ()

@end

@implementation ItemInfoView

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
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
	int item = [[DataHolder GetInstance] selectedItem];
	itemNameLabel.text = [[[DataHolder GetInstance] groceries] objectAtIndex:item];
    itemQuantityLabel.text = @"1";
	[super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
	[self dismissViewControllerAnimated:true completion:^(){}];
}

@end
