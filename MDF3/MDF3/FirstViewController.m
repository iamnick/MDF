//
//  FirstViewController.m
//  MDF3
//
//  Created by Nick Stelzer on 5/22/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "FirstViewController.h"
#import "BusinessData.h"
#import "SpecificBusinessView.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"List of Businesses", @"List of Businesses");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
	[BusinessData CreateInstance];
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
	return [[[BusinessData GetInstance] names] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
    cell.textLabel.text = [[[BusinessData GetInstance] names] objectAtIndex:indexPath.row];
    
    UIFont *cellFont = [ UIFont fontWithName: @"Arial" size: 16.0 ];
	cell.textLabel.font  = cellFont;

	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[[BusinessData GetInstance] setSelectedItem:indexPath.row];
	SpecificBusinessView *specificView = [[SpecificBusinessView alloc] initWithNibName:@"SpecificBusinessView" bundle:nil];
    if (specificView != nil) {
        [self.navigationController pushViewController:specificView animated:true];
    }
}


@end
