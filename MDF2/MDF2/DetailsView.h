//
//  DetailsView.h
//  MDF2
//
//  Created by Nick Stelzer on 5/16/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsView : UIViewController
{
	IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *authorLabel;
    IBOutlet UILabel *sourceLabel;
    IBOutlet UIButton *viewArticleButton;
    NSURL *entryURL;
}
-(IBAction)onClick:(id)sender;
@end
