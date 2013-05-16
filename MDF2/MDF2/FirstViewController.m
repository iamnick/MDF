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
        self.title = NSLocalizedString(@"Academic Journals", @"Academic Journals");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	// Get Only Academic Journal Type Indexes
    //NSMutableArray *results = [[DatabaseEntries GetInstance] GetValidEntries:@"Academic Journal"];
    
    //NSLog(@"%@", results.description);
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
	// Get Only Academic Journal Type Indexes
	return [[[DatabaseEntries GetInstance] GetValidEntries:@"Academic Journal"] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
    
    NSMutableArray *results = [[DatabaseEntries GetInstance] GetValidEntries:@"Academic Journal"];
	NSInteger currentEntry = [[results objectAtIndex:indexPath.row] intValue];
    NSLog(@"%@", results.description);
    NSLog(@"current Entry = %d", currentEntry);
    NSArray *specificResult = [[DatabaseEntries GetInstance] GetSpecificEntry:currentEntry];
    NSLog(@"%@", [specificResult objectAtIndex:0]); // 0 returns the title
    cell.textLabel.text = [specificResult objectAtIndex:0];
    //[[[DatabaseEntries GetInstance] GetSpecificEntry:[results objectAtIndex:indexPath]] objectAtIndex:[results objectAtIndex:indexPath]];
	return cell;
}


@end
