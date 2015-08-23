//
//  ViewController.m
//  Lesson5HW
//
//  Created by Кирилл Ковыршин on 23.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "ViewController.h"
#import "ShopClass.h"

@interface ViewController () <ShopClassDelegate,UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *welcomeText;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray * arrayData;
@property (weak, nonatomic) IBOutlet UIButton *userButton;
@property (weak, nonatomic) IBOutlet UIButton *shopButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    ShopClass * protocol = [ShopClass new];
    protocol.delegate = self;
    NSArray * welcomePhoneArray = [[NSArray alloc] initWithArray:[protocol welcome]];
  
    NSString * welcomeText = [NSString stringWithFormat:@"%@",[welcomePhoneArray objectAtIndex:0]];
    NSString * phoneText = [NSString stringWithFormat:@"%@",[welcomePhoneArray objectAtIndex:1]];
    self.welcomeText.text = welcomeText;
    self.phoneNumber.text = phoneText;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickShopButton:(id)sender {
    ShopClass * protocol = [ShopClass new];
    protocol.delegate = self;
    [protocol performSelector:@selector(getShop) withObject:nil afterDelay:1.0];
    
}
- (IBAction)clickUsersButton:(id)sender {
    ShopClass * protocol = [ShopClass new];
    protocol.delegate = self;
    [protocol performSelector:@selector(getUsers) withObject:nil afterDelay:1.0];
}


#pragma mark - ShopClassDelegate

-(void) reloadTableView {
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationLeft];
}

- (void) showShopItems: (ShopClass *) shopclass array: (NSMutableArray *) array{
    
    self.arrayData = [[NSArray alloc] initWithArray:array];
    [self reloadTableView];
    
}


- (void) showUsers: (ShopClass *) shopcalss array: (NSMutableArray *) array{
    
    self.arrayData = [[NSArray alloc] initWithArray:array];
    [self reloadTableView];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
        return self.arrayData.count;
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    NSDictionary * dict = [self.arrayData objectAtIndex:indexPath.row];
    
    if (dict.count > 2) {
        NSString * nameAndLogin = [NSString stringWithFormat:@"%@ [%@]",
                                      [dict objectForKey:@"uName"],[dict objectForKey:@"uLogin"]];
                                      
        cell.textLabel.text = nameAndLogin;
        cell.detailTextLabel.text = [dict objectForKey:@"uPassword"];
      
    }else{
        cell.textLabel.text = [dict objectForKey:@"items"];
        cell.detailTextLabel.text = [dict objectForKey:@"price"];
    }
    
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:1];
}




@end
