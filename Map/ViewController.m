//
//  ViewController.m
//  Map
//
//  Created by student14 on 29/12/16.
//  Copyright © 2016 Felix-ITs-Divesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    MKPointAnnotation *point1 = [[MKPointAnnotation alloc]init];
    
    point1.title=@"Mangrulpir";
    point1.subtitle=@"Maharashtra, India";
    
    CLLocationCoordinate2D loc;
    
    loc.latitude=20.3149;
    loc.longitude=77.3419;
    
    
    point1.coordinate=loc;
    
    [self.map addAnnotation:point1];
    
    
    
    
    
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
