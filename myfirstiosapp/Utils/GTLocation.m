//
//  GTLocation.m
//  myfirstiosapp
//
//  Created by dongfang lu on 2024/3/19.
//

#import "GTLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface GTLocation()<CLLocationManagerDelegate>

@property(nonatomic, strong, readwrite) CLLocationManager *manager;

@end


@implementation GTLocation

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager = [[CLLocationManager alloc]init];
        self.manager.delegate = self;
    }
    return self;
}

+ (nonnull GTLocation *)locationManage {
    static GTLocation *location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[GTLocation alloc]init];
    });
    return location;
}

- (void)checkLocationAuthorization {
    
    //判断系统是否开启
    if (![CLLocationManager locationServicesEnabled]) {
        //  pop dialog tip
        
    }

    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [self.manager requestWhenInUseAuthorization];
    }
    
}
# pragma mark - delegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.manager startUpdatingLocation];
    } else if(status == kCLAuthorizationStatusDenied){
        NSLog(@"locationManager--- refuse");
    }else{
        NSLog(@"locationManager---unknow");
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
  
    // 地理信息
    CLLocation *location =  [locations firstObject];
    
   CLGeocoder *coder = [[CLGeocoder alloc]init];
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        //地标信息
        
    }];
    
    [self.manager stopUpdatingLocation];
    
}


@end
