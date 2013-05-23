//
//  SpecificBusinessView.h
//  MDF3
//
//  Created by Nick Stelzer on 5/23/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SpecificBusinessView : UIViewController
{
	IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *locLabel;
    IBOutlet UILabel *coordsLabel;
    IBOutlet MKMapView *mapView;
}
@end
