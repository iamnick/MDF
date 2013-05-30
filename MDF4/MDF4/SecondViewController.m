//
//  SecondViewController.m
//  MDF4
//
//  Created by Nick Stelzer on 5/30/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Raw XML Data", @"Raw XML Data");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    // Load the XML data from file, convert to NSString, display in textView
    NSData *xmlData = [self GetFileDataFromFile:@"streamData.xml"];
    NSString *xmlAsString = [[NSString alloc] initWithData:xmlData encoding:NSASCIIStringEncoding];
    textView.text = xmlAsString;

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSData*)GetFileDataFromFile:(NSString*)filename
{
	NSString *filePath = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    filePath = [documentsDirectory stringByAppendingPathComponent:filename];
    if ([fileManager fileExistsAtPath:filePath]) {
    	return [NSData dataWithContentsOfFile:filePath];
    }
    return nil;
}

@end
