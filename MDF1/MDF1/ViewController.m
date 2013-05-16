//
//  ViewController.m
//  MDF1
//
//  Created by Nick Stelzer on 5/9/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableCell.h"
#import "DataHolder.h"
#import "ItemInfoView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	[DataHolder CreateInstance];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Grocery List Table View
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [[[DataHolder GetInstance] groceries] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"CustomCellView" owner:self options:nil];
        cell = [views objectAtIndex:0];
    }
    // set labels/image for each
    UILabel *itemNameLabel = (UILabel*)[cell viewWithTag:1];
    itemNameLabel.text = [[[DataHolder GetInstance] groceries] objectAtIndex:indexPath.row];
    UILabel *quantityLabel = (UILabel*)[cell viewWithTag:2];
    quantityLabel.text = @"1";
    
	return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;
{
	return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"clicked");
	ItemInfoView *itemInfoView = [[ItemInfoView alloc] initWithNibName:@"ItemInfoView" bundle:nil];
    if (itemInfoView != nil) {
    	[[DataHolder GetInstance] setSelectedItem:indexPath.row];
        [self presentViewController:itemInfoView animated:true completion:^(){}];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Delete Mode
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
    	NSLog(@"%d", indexPath.row);
    	[[[DataHolder GetInstance] groceries] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
        [tableView setEditing:NO animated:YES];
    }
}

// Remove Items Button
-(IBAction)onClick:(id)sender
{
	[tableView setEditing:YES animated:YES];	
}

@end
