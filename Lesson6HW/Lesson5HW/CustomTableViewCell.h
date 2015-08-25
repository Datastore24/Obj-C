//
//  CustomTableViewCell.h
//  Lesson5HW
//
//  Created by Кирилл Ковыршин on 25.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *uNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *uLoginLabel;
@property (weak, nonatomic) IBOutlet UILabel *uPasswordLabel;
@property (weak, nonatomic) IBOutlet UILabel *uEmailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *uImage;

@end
