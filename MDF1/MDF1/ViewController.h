//
//  ViewController.h
//  MDF1
//
//  Created by Nick Stelzer on 5/9/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate>
{
	IBOutlet UITableView *tableView;
    IBOutlet UIButton *editModeButton;
	NSMutableArray *groceries;
}
-(IBAction)onClick:(id)sender;

@end
