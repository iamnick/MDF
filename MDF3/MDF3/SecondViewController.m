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
	// Set up map's initial view point
    MKCoordinateSpan span;
    span.latitudeDelta = 30.0f;
    span.longitudeDelta = 30.0f;
    
    CLLocationCoordinate2D center;
    center.latitude = 39.8282f;
    center.longitude = -97.5795f;
    
    MKCoordinateRegion region;
    region.center = center;
    region.span = span;
    mapView.region = region;
    
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
