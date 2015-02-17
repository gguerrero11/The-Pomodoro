//
//  PORoundsViewController.m
//  The Pomodoro
//
//  Created by Ethan Hess on 2/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PORoundsViewController.h"
#import "POTimer.h"

@interface PORoundsViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *roundTimes;

@end

@implementation PORoundsViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView = [UITableView new];
    CGRect roundsTableViewFrame = self.view.bounds;
    self.tableView.frame = roundsTableViewFrame;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

-(NSArray *)returnRoundTimes {
    
    self.roundTimes = @[@25,@5,@25,@5,@25,@5,@25,@15];
    return self.roundTimes;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self returnRoundTimes].count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {


    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = self.returnRoundTimes[indexPath.row];
    
    //cell.textLabel.text = @"HBAHAH";
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.currentRound = indexPath.row;
    [self roundSelected];
    
}

-(void)roundSelected {
    
    [POTimer sharedInstance].minutes = (long)self.roundTimes[self.currentRound];
    
    
}


-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
