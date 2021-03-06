//
//  HAClusterAnnotation.h
//  HAClusterMapView
//
//  Created by Hipolito Arias on 14/10/15.
//  Copyright © 2015 MasterApp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
//#import "MultiRowAnnotationProtocol.h"

@interface HAClusterAnnotation : NSObject <MKAnnotation>

@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *dispensaryId;
@property (assign, nonatomic) NSInteger count;
@property (assign, nonatomic) UIColor* fillColor;
@property (assign, nonatomic) NSInteger index;
@property (copy, nonatomic) NSMutableArray *indexes;
@property (assign, nonatomic) BOOL isMedical;
@property (assign, nonatomic) BOOL isRecreational;
@property (assign, nonatomic) BOOL isDelivery;
@property (assign, nonatomic) BOOL isDeliveryOnly;
@property (assign, nonatomic) NSInteger sortWeight;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate count:(NSInteger)count index:(NSInteger)index;

- (void)updateSubtitleIfNeeded;

@end
