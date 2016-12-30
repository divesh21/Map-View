//
//  ViewController.m
//  Map
//
//  Created by Divesh  on 29/12/16.
//  Copyright © 2016 Felix-ITs-Divesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _manager =[[CLLocationManager alloc]init];
    _manager.desiredAccuracy=kCLLocationAccuracyBest;
    _manager.delegate=self;
    [_manager startUpdatingLocation];
    
    _geocoder=[[CLGeocoder alloc]init];
    
    
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{

    CLLocation *currentLocation =[locations lastObject];
    
    [_geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
       
        CLPlacemark *descr=[placemarks objectAtIndex:0];
        
        MKPointAnnotation *point1 = [[MKPointAnnotation alloc]init];
        
        point1.title=descr.locality;
        point1.subtitle=descr.country;
        
        CLLocationCoordinate2D loc;
        
        loc.latitude=currentLocation.coordinate.latitude;
        loc.longitude=currentLocation.coordinate.longitude;
        
        
        point1.coordinate=loc;
        
        [self.map addAnnotation:point1];

        
    }];

}


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{

    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pin"];
    pin.tintColor=[UIColor brownColor];
    pin.pinTintColor=[UIColor greenColor];
    pin.canShowCallout=YES;
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeInfoLight];
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    pin.rightCalloutAccessoryView=btn;
    
    return pin;


}

-(void) btnclick
{

    NSLog(@"Button Clicked");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
