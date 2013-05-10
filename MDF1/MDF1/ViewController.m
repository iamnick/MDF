//
//  ViewController.m
//  MDF1
//
//  Created by Nick Stelzer on 5/9/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	// Array of Grocery List Items
	groceries = [[NSArray alloc] initWithObjects:@"Apples", @"Bagels", @"Bananas", @"Bread", @"Bottled Water", @"Cheese", @"Coffee Beans", @"Eggs", @"Flour", @"Frozen Pizza", @"Ham", @"Hot Dogs", @"Lettuce", @"Milk", @"Onions", @"Parsley", @"Red Peppers", @"Rice", @"Watermelon", @"Yogurt", nil];

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
	return [groceries count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	cell.textLabel.text = [groceries objectAtIndex:indexPath.row];
	return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;
{
	return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"row=%d, name=%@", indexPath.row, [groceries objectAtIndex:indexPath.row]);
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Delete Mode
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
    	NSLog(@"%d", indexPath.row);
    	[groceries removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:true];
    }
}

// Remove Items Button
-(IBAction)onClick:(id)sender
{
	[tableView setEditing:YES animated:YES];	
}

@end
