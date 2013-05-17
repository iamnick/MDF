//
//  SecondViewController.m
//  MDF2
//
//  Created by Nick Stelzer on 5/15/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "SecondViewController.h"
#import "DatabaseEntries.h"
#import "DetailsView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Periodicals", @"Periodicals");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
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

// Table View Configuration
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	// Get Only Periodical Type Indexes
	return [[[DatabaseEntries GetInstance] GetValidEntries:@"Periodical"] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
    
    NSMutableArray *results = [[DatabaseEntries GetInstance] GetValidEntries:@"Periodical"];
	NSInteger currentEntry = [[results objectAtIndex:indexPath.row] intValue];
    cell.textLabel.text = [[[DatabaseEntries GetInstance] GetSpecificEntry:currentEntry] objectAtIndex:0];
    
    UIFont *cellFont = [ UIFont fontWithName: @"Arial" size: 16.0 ];
	cell.textLabel.font  = cellFont;
    
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Set Selected Item as the index of the entry in the array so we can pull that data on the details view
	NSMutableArray *results = [[DatabaseEntries GetInstance] GetValidEntries:@"Periodical"];
    [[DatabaseEntries GetInstance] setSelectedItem:[[results objectAtIndex:indexPath.row] intValue]];
    
	DetailsView *detailsView = [[DetailsView alloc] initWithNibName:@"DetailsView" bundle:nil];
    if (detailsView != nil) {
        [self.navigationController pushViewController:detailsView animated:true];
    }
}

@end
