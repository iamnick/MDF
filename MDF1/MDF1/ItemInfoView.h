//
//  ItemInfoView.h
//  MDF1
//
//  Created by Nick Stelzer on 5/9/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemInfoView : UIViewController
{
	IBOutlet UIButton *returnButton;
    IBOutlet UILabel *itemNameLabel;
    IBOutlet UILabel *itemQuantityLabel;
}
-(IBAction)onClick:(id)sender;
@end
