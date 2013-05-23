//
//  SecondViewController.m
//  MDF3
//
//  Created by Nick Stelzer on 5/22/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "SecondViewController.h"
#import "BusinessData.h"
#import "MyAnnotations.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"View All On Map", @"View All On Map");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
	for (int i = 0; i < [[[BusinessData GetInstance] lats] count]; i++)
    {
    	NSString *newTitle = [NSString stringWithString:[[[BusinessData GetInstance] names] objectAtIndex:i]];
        CLLocationCoordinate2D newCoord;
        newCoord.latitude = [[[[BusinessData GetInstance] lats] objectAtIndex:i] doubleValue];
        newCoord.longitude = [[[[BusinessData GetInstance] lngs] objectAtIndex:i] doubleValue];
        
        NSLog(@"LAT=%f LNG=%f LOC=%@", [[[[BusinessData GetInstance] lats] objectAtIndex:i] doubleValue], [[[[BusinessData GetInstance] lngs] objectAtIndex:i] doubleValue], newTitle);
        
    	MyAnnotations *newPin = [[MyAnnotations alloc] initWithTitle:newTitle coord:newCoord];
        [mapView addAnnotation:newPin];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
