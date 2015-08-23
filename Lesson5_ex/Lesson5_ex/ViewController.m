//
//  ViewController.m
//  Lesson5_ex
//
//  Created by Кирилл Ковыршин on 22.08.15.
//  Copyright (c) 2015 datastore24. All rights reserved.
//

#import "ViewController.h"
#import "ProtocolClass.h"

@interface ViewController () <ProtocolClassDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSArray * arrayData;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self performSelector:@selector(start) withObject:nil afterDelay:2.0 ];
    
    }

- (void) start{
    
    ProtocolClass * protocol = [ProtocolClass new];
    protocol.delegate = self;
    [protocol methodWithString:@"TEST"];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ProtocolClassDelegate

- (void) protocolMethod: (ProtocolClass *) protocolClass array: (NSMutableArray *) array{
    self.arrayData = [[NSArray alloc] initWithArray:array];
    [self reloadTableView];
}

-(void) reloadTableView {
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationLeft];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count; 
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    NSDictionary * dict = [self.arrayData objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dict objectForKey:@"name"];
    cell.detailTextLabel.text = [dict objectForKey:@"date"];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:1];
    NSLog(@"Не трогай меня: %li", indexPath.row);
}

@end
