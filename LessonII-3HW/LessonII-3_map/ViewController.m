//
//  ViewController.m
//  LessonII-3_map
//
//  Created by Кирилл Ковыршин on 21.09.15.
//  Copyright © 2015 datastore24. All rights reserved.
//

#import "ViewController.h"
#import "CustomAnnotation.h"
#import "CustomMapPinView.h"


@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView; //View карты
@property (strong,nonatomic) CLLocationManager * locationManager; //Менеджер положения
@property (strong,nonatomic) CLLocation * currentLocation; // Текущее положение

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isCurrentLocation = NO; //Не определили текущее местоположение
    isRendered = NO; //Значение по умолчанию для рендера карты

    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestAlwaysAuthorization]; // Спрашиваем пользователя о доступе к геолакации
    
    [self.locationManager startUpdatingLocation]; //Отслеживание положение в реальном времени
    self.locationManager.delegate = self; //подписываемся на протокол
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Определение текущего положения
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    
    if(!isCurrentLocation){
        isCurrentLocation = YES;
        [self centerOnUserLocation:newLocation.coordinate]; //Центровка карты
        
    }
}

//Центруем карту
- (void) centerOnUserLocation: (CLLocationCoordinate2D) coord{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 17000, 17000);
    [self.mapView setRegion:region animated:YES];
}

//Метод установки пинов на карту
- (void) setPins {
    //Координаты
    NSNumber * oneLat = [NSNumber numberWithDouble:55.76344054384816];
    NSNumber * oneLon = [NSNumber numberWithDouble:37.61650085449219];
    
    NSNumber * twoLat = [NSNumber numberWithDouble:55.82674463605464];
    NSNumber * twoLon = [NSNumber numberWithDouble:37.5567626953125];
    
    NSNumber * threeLat = [NSNumber numberWithDouble:55.82520185788676];
    NSNumber * treeLon = [NSNumber numberWithDouble:37.68104553222656];
    
    //
    
    //Создаем коллекцию с координатами
   NSDictionary * one = [[NSDictionary alloc] initWithObjectsAndKeys:
                         oneLat, @"lat",
                         oneLon, @"lon"
                         , nil];
    NSDictionary * two = [[NSDictionary alloc] initWithObjectsAndKeys:
                          twoLat, @"lat",
                          twoLon, @"lon"
                          , nil];
    NSDictionary * three = [[NSDictionary alloc] initWithObjectsAndKeys:
                          threeLat, @"lat",
                          treeLon, @"lon"
                          , nil];
    
    
    //Создаем массив со всеми координатами пинов
    NSArray * array = [[NSArray alloc] initWithObjects:one,two,three, nil];
    //
    
    //Установка пинов в цикле, парсинг данных
    for (int i = 0; i<array.count; i++) {
        
        NSDictionary * dict = [array objectAtIndex:i]; //Выдегиваем коллекцию по порядку
        
        double lat = [[dict objectForKey:@"lat"]floatValue]; //ширина
        double lon = [[dict objectForKey:@"lon"]floatValue]; //долгота
        
        //Вызов кастомного метода инициализации, с координатами
        CustomAnnotation * annotation = [[CustomAnnotation alloc] initWithLatitude:lat andLogitude:lon];
        
        //Добавление на карту
        [self.mapView addAnnotation:annotation];
    }
}

//Метод пинов
- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
   //Првоерка: Если ты не положение пользователя, то
    if(!([annotation isKindOfClass:[MKUserLocation class]])){
        
        //Создание объекта с кастомной инициализацией для нестандартного изображения пина
        CustomMapPinView * customPin = [[CustomMapPinView alloc] initWithImage];
        
        
        return customPin;

    }
    
    return nil;
}


//Метод срабатывает когда карта полностью загружена

- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered{
    if(fullyRendered){
       
        if(!isRendered){
             isRendered = YES; // Карта отрендрена
             [self performSelector:@selector(setPins) withObject:nil afterDelay:3.0];
        }
        
    }
}

//Когда карта будет отображена, появляются пины
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views{
    
    
    for (CustomMapPinView * view in views) {
        
        //Пропустим пользовательское местоположение
        if(![view.annotation isKindOfClass:[MKUserLocation class]]){
            //Первичное положение пинов (скрываем их)
            view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y - self.view.frame.size.height - 700, view.frame.size.width, view.frame.size.height);
            
            //Делаем падение пинов
            [UIView animateWithDuration:1.3 delay:0.07 * [views indexOfObject:view] options:0 animations:^{
                view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y + self.view.frame.size.height + 700, view.frame.size.width, view.frame.size.height);
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    
    
    
}

//Метод, когда пин выбран
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    for (UIView * baloon in view.subviews) {
        if(baloon.tag == 24){
            [UIView animateWithDuration:1.3 delay:0.0 options:0 animations:^{
                baloon.frame = CGRectMake(baloon.frame.origin.x, baloon.frame.origin.y+10, baloon.frame.size.width, baloon.frame.size.height);
         
                baloon.layer.cornerRadius= 3;
                baloon.layer.borderWidth = 2;
                [baloon setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:1]];
                
            } completion:^(BOOL finished) {
                
            }];
        }else if (baloon.tag == 25 || baloon.tag == 26){
            [UIView animateWithDuration:1.3 delay:0.0 options:0 animations:^{
                baloon.frame = CGRectMake(baloon.frame.origin.x, baloon.frame.origin.y+10, baloon.frame.size.width, baloon.frame.size.height);
                
                baloon.alpha = 1;
                
            } completion:^(BOOL finished) {
                
            }];

        }
    }
}

//Метод, когда пин не выбран
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view{
    for (UIView * baloon in view.subviews) {
        if(baloon.tag == 24){
            [UIView animateWithDuration:0.3 delay:0.0 options:0 animations:^{
                baloon.frame = CGRectMake(baloon.frame.origin.x, baloon.frame.origin.y - 10, baloon.frame.size.width, baloon.frame.size.height);
                baloon.layer.borderWidth = 0;
                [baloon setBackgroundColor:[[UIColor clearColor] colorWithAlphaComponent:0]];
                
            } completion:^(BOOL finished) {
                
            }];
        }else if (baloon.tag == 25 || baloon.tag == 26){
            [UIView animateWithDuration:0.3 delay:0.0 options:0 animations:^{
                baloon.frame = CGRectMake(baloon.frame.origin.x, baloon.frame.origin.y - 10, baloon.frame.size.width, baloon.frame.size.height);
                baloon.alpha = 0;
                
            } completion:^(BOOL finished) {
                
            }];
           
        }
        
    }

}





@end
