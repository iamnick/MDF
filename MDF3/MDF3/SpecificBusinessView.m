//
//  SpecificBusinessView.m
//  MDF3
//
//  Created by Nick Stelzer on 5/23/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "SpecificBusinessView.h"
#import "BusinessData.h"
#import "MyAnnotations.h"

@interface SpecificBusinessView ()

@end

@implementation SpecificBusinessView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
	int i = [[BusinessData GetInstance] selectedItem];
    
    // Create Pin on the View
    NSString *newTitle = [NSString stringWithString:[[[BusinessData GetInstance] names] objectAtIndex:i]];
    CLLocationCoordinate2D newCoord;
    newCoord.latitude = [[[[BusinessData GetInstance] lats] objectAtIndex:i] doubleValue];
    newCoord.longitude = [[[[BusinessData GetInstance] lngs] objectAtIndex:i] doubleValue];
    
    NSLog(@"LAT=%f LNG=%f LOC=%@", [[[[BusinessData GetInstance] lats] objectAtIndex:i] doubleValue], [[[[BusinessData GetInstance] lngs] objectAtIndex:i] doubleValue], newTitle);
    
    MyAnnotations *newPin = [[MyAnnotations alloc] initWithTitle:newTitle coord:newCoord];
    [mapView addAnnotation:newPin];
    
    // Set up Labels
    nameLabel.text = [[[BusinessData GetInstance] names] objectAtIndex:i];
    locLabel.text = [[[BusinessData GetInstance] locs] objectAtIndex:i];
    coordsLabel.text = [NSString stringWithFormat:@"Lat: %f, Lng: %f", [[[[BusinessData GetInstance] lats] objectAtIndex:i] doubleValue], [[[[BusinessData GetInstance] lngs] objectAtIndex:i] doubleValue]];
    
    // Set up map's initial view point
    // Set up map's initial view point
    MKCoordinateSpan span;
    span.latitudeDelta = 3.0f;
    span.longitudeDelta = 3.0f;
    
    CLLocationCoordinate2D center;
    center.latitude = [[[[BusinessData GetInstance] lats] objectAtIndex:i] doubleValue];
    center.longitude =[[[[BusinessData GetInstance] lngs] objectAtIndex:i] doubleValue];
    
    MKCoordinateRegion region;
    region.center = center;
    region.span = span;
    mapView.region = region;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
