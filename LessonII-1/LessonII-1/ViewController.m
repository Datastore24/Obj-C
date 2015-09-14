//
//  ViewController.m
//  LessonII-1
//
//  Created by Кирилл Ковыршин on 11.09.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "ViewController.h"
#import "Animation.h"

@interface ViewController (){
        BOOL isButton;
}

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIView *someView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    isButton = YES;
    self.button.layer.borderWidth = 1;
    self.button.layer.cornerRadius = 4;
    self.button.layer.borderColor = [UIColor blueColor].CGColor;
    [self.button setBackgroundColor:[UIColor blueColor]];
    
    self.button2.layer.borderWidth = 1;
    self.button2.layer.cornerRadius = 4;
    self.button2.layer.borderColor = [UIColor blueColor].CGColor;
    
    [self.button addTarget:self action:@selector(check1) forControlEvents:UIControlEventTouchUpInside];
    [self.button2 addTarget:self action:@selector(check2) forControlEvents:UIControlEventTouchUpInside];
    
    self.label1.text = @"Да";
    self.label2.text = @"Нет";
    
    self.someView.alpha = 0;
}

- (void) check1 {
    if(!isButton){
        isButton = YES;
        
        [Animation animationView:self.button withColor:[UIColor blueColor]];
        [Animation animationView:self.button2 withColor:[UIColor whiteColor]];
        
        [Animation animateTextInLabel:self.label1 withText:@"Да"];
        [Animation animateTextInLabel:self.label2 withText:@"Нет"];
        
//        CGRect newFrame = self.someView.frame;
//        newFrame.origin.x = newFrame.origin.x + 50;
//        newFrame.size.width = newFrame.size.width + 50;
//        newFrame.size.height = newFrame.size.height + 50;
//        [Animation animationFrameView:self.someView withFrame:newFrame];
        
        [Animation animateTransformView:self.someView withScale:1.8 move_X:0.0 move_Y:0.0 alpha:1 delay:0.0];
        [Animation animateTransformView:self.someView withScale:1.0 move_X:0.0 move_Y:0.0 alpha:0 delay:0.2];
        
        [Animation animateImageView:self.imageView image:[UIImage imageNamed:@"Geta.jpg"] alpa:0];
        
        
        
    }
    
}

- (void) check2 {
    
    if(isButton){
        isButton = NO;
        [Animation animationView:self.button withColor:[UIColor whiteColor]];
        [Animation animationView:self.button2 withColor:[UIColor blueColor]];
        
        [Animation animateTextInLabel:self.label1 withText:@"Нет"];
        [Animation animateTextInLabel:self.label2 withText:@"Да"];
        
//        CGRect newFrame = self.someView.frame;
//        newFrame.origin.x = newFrame.origin.x - 50;
//        newFrame.size.width = newFrame.size.width - 50;
//        newFrame.size.height = newFrame.size.height - 50;
//        [Animation animationFrameView:self.someView withFrame:newFrame];
        
        [Animation animateTransformView:self.someView withScale:1.8 move_X:-30.0 move_Y:-30.0 alpha:1 delay:0.0];
        [Animation animateTransformView:self.someView withScale:1.0 move_X:-30.0 move_Y:-30.0 alpha:1 delay:0.2];
        [Animation animateImageView:self.imageView image:[UIImage imageNamed:@"Geta.jpg"] alpa:1];
        

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
