//
//  MapViewController.m
//  HACAnnotationClustering
//
//  Created by Hipolito Arias on 14/10/15.
//  Copyright © 2015 Theodore Calmes. All rights reserved.
//

#import "MapViewController.h"
#import "HACMKMapView.h"

@interface MapViewController () <HACMKMapViewDelegate>

@property (weak, nonatomic) IBOutlet HACMKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.mapDelegate = self;
    
    // 1. Example with more than 150.000 annotations
    [self.mapView.coordinateQuadTree buildTreeWithExample];
    
    // 2. Custom markers example
//    NSArray *data = @[
//                      @{kLatitude:@48.47352, kLongitude:@3.87426,  kTitle : @"Title 1", kSubtitle : @"Subtitle 1",  kIndex : @0, kIsMedical: @NO, kIsRecreational: @YES, kIsVerified: @YES},
//                      @{kLatitude:@52.59758, kLongitude:@-1.93061, kTitle : @"Title 2", kSubtitle : @"Subtitle 2",  kIndex : @1, kIsMedical: @YES, kIsRecreational: @YES, kIsVerified: @YES},
//                      @{kLatitude:@48.41370, kLongitude:@3.43531,  kTitle : @"Title 3", kSubtitle : @"Subtitle 3",  kIndex : @2, kIsMedical: @NO, kIsRecreational: @YES, kIsVerified: @YES},
//                      @{kLatitude:@48.31921, kLongitude:@18.10184, kTitle : @"Title 4", kSubtitle : @"Subtitle 4",  kIndex : @3, kIsMedical: @YES, kIsRecreational: @YES, kIsVerified: @YES},
//                      @{kLatitude:@47.84302, kLongitude:@22.81101, kTitle : @"Title 5", kSubtitle : @"Subtitle 5",  kIndex : @4, kIsMedical: @NO, kIsRecreational: @YES, kIsVerified: @YES},
//                      @{kLatitude:@60.88622, kLongitude:@26.83792, kTitle : @"Title 6", kSubtitle : @"Subtitle 6",  kIndex : @5, kIsMedical: @YES, kIsRecreational: @YES, kIsVerified: @YES}
//                      ];
//    
//    [self.mapView.coordinateQuadTree buildTreeWithArray:data];
//
//    [self.mapView.coordinateQuadTree buildTreeWithArray:data];
//    self.mapView.backgroundAnnotation = [UIColor redColor];
//    self.mapView.borderAnnotation = [UIColor whiteColor];
//    self.mapView.textAnnotation = [UIColor whiteColor];
    self.mapView.compassFrame = CGRectMake(10, 10, 25, 25);
    self.mapView.legalFrame = CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds)-50, CGRectGetHeight([UIScreen mainScreen].bounds)-50, 50, 50);
}

# pragma mark - HACMKMapViewDelegate

-(void)viewForAnnotationView:(HAClusterAnnotationView *)annotationView annotation:(HAClusterAnnotation *)annotation{
    NSLog(@"%i", annotation.isMedical);
    if (annotation.index % 2 == 0) {
        if (annotation.index == 2) {
            annotationView.canShowCallout = NO;
        }
        annotationView.image = [UIImage imageNamed:@"pin_museum"];
    }else{
        annotationView.image = [UIImage imageNamed:@"pin_coffee"];
    }
}

-(void)didSelectAnnotationView:(HAClusterAnnotation *)annotationView{
    NSLog(@"You ara select annotation index %ld", (long)annotationView.index);
}

@end
