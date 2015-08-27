//
//  DetailViewController.m
//  Lesson7_ex
//
//  Created by Кирилл Ковыршин on 27.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *buttonSave;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Делаем кнопку не активной
    self.buttonSave.userInteractionEnabled = NO;
    
    //Минимальная дата(не ниже текущей)
    self.datePicker.minimumDate = [NSDate date];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self action:@selector(handleBackgroundTap:)];
    [self.view addGestureRecognizer:tap];
    [self.textField becomeFirstResponder]; // Открываем клавиатуру сразу
    
    //Метод для датапикера, который записывает в property дату при изменении
    [self.datePicker addTarget:self action:@selector(datePickerAction) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Метод сворачивающий клавиатуру
- (void) handleBackgroundTap: (UITapGestureRecognizer *) tap {
    
    [self.view endEditing:YES];
}


//Выбор даты
-(void) datePickerAction{
    
    self.eventDate = self.datePicker.date;
}

//Обработка текстового поля

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    //Условие при котором проверяем какое текстовое поле нажато и оно не пустое
    if([textField isEqual:self.textField] && self.textField.text.length != 0){
        
        [self.textField resignFirstResponder];
        return YES;
        
    }else{ //если пустое вызываем метод вывода ошибки
        [self showAlertWithMessage:@"Для завершения оперции введите значения для события"];
        
    }
    return NO;
    
    
}

//Сообщение об ошибке
- (void) showAlertWithMessage: (NSString *) message {
    
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Внимание!!!" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil ];
    
    [alert show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
