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
    self.title = @"Rounds";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    
    
}

-(NSArray *)returnRoundTimes {
    
    return self.roundTimes = @[@25,@5,@25,@5,@25,@5,@25,@15];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self returnRoundTimes].count;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ Minutes",self.returnRoundTimes[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.currentRound = indexPath.row;
    [self roundSelected];
    
}

-(void)roundSelected {
    
    [POTimer sharedInstance].minutes;
    
    
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
