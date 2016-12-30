//
//  ViewController.h
//  Map
//
//  Created by student14 on 29/12/16.
//  Copyright © 2016 Felix-ITs-Divesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property(nonatomic,retain) CLLocationManager *manager;
@property(nonatomic,retain)CLGeocoder *geocoder;

 

@end

