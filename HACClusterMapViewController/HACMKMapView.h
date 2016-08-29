//
//  HACMKMapView.h
//  HAClusterMapView
//
//  Created by Hipolito Arias on 23/10/15.
//  Copyright © 2015 MasterApp. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "HACManagerQuadTree.h"
#import "HAClusterAnnotation.h"
#import "HAClusterAnnotationView.h"

@class HACMKMapView;

IB_DESIGNABLE
@protocol HACMKMapViewDelegate <NSObject>

@optional
- (void)regionWillChangeAnimated:(BOOL)animated;
- (void)regionDidChangeAnimatd:(BOOL)animated;
- (void)viewForAnnotationView:(HAClusterAnnotationView *)annotationView annotation:(HAClusterAnnotation *)annotation;
- (void)viewForAnnotationView:(HAClusterAnnotationView *)annotationView clusteredAnnotation:(HAClusterAnnotation *)annotation;
- (UIColor*)fillColorForAnnotation:(HAClusterAnnotation *)annotation;
- (void)didSelectClusterAnnotation:(HAClusterAnnotation *)clusterAnnotation annotationView:(HAClusterAnnotationView *)annotationView;
- (void)didSelectAnnotation:(HAClusterAnnotation *)annotation annotationView:(HAClusterAnnotationView *)annotationView;
- (void)didDeselectAnnotation:(HAClusterAnnotation *)annotation annotationView:(HAClusterAnnotationView *)annotationView;
- (void)didFinishAddingAnnotations;
- (void)didAddAnnotationViews:(NSArray *)views;
@end

@interface HACMKMapView : MKMapView <MKMapViewDelegate>

@property (weak, nonatomic) id<HACMKMapViewDelegate>mapDelegate;

@property (nonatomic) IBInspectable UIColor* borderAnnotation;
@property (nonatomic) IBInspectable UIColor* backgroundAnnotation;
@property (nonatomic) IBInspectable UIColor* textAnnotation;
@property (nonatomic) IBInspectable UIImage* defaultImage;
@property (nonatomic) IBInspectable CGRect compassFrame;
@property (nonatomic) IBInspectable CGRect legalFrame;

@property (strong, nonatomic) HACManagerQuadTree *coordinateQuadTree;

@end
