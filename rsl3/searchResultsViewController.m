//
//  searchResultsViewController.m
//  rsl3
//
//  Created by Kartsev on 3/29/13.
//  Copyright (c) 2013 Kartsev. All rights reserved.
//

#import "searchResultsViewController.h"

@interface searchResultsViewController()//: UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    
   }

@end

@implementation searchResultsViewController

@synthesize tableViewArray,array,tableView;


- (void)viewDidLoad
{

    [super viewDidLoad];
    [tableView setDelegate:(id)self];
    [tableView setDataSource:(id)self];NSString *tmp;
    tmp=@"dsfadsf";
    [array addObject:tmp];
    
    self.tableViewArray = array;
    
    NSIndexPath *newIndexPath=[[NSIndexPath alloc]init];
    newIndexPath = [NSIndexPath indexPathForRow:[self.tableViewArray count] inSection:0];
    //[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    //[tableView reloadData];

    [self addCell];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableViewArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableViewArray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
        return 60;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [self addCell];
    /*NSString *alertViewText = [[NSString alloc] initWithFormat:@"%@",@"fghjy"];
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"alert" message:alertViewText
                                                  delegate:nil cancelButtonTitle:@"Back" otherButtonTitles:@"yes", nil];
    [alert show];*/}

-(void)addCell{
    NSString *tmp;
    tmp=@"dsfadsf";
    [array addObject:tmp];
    
    self.tableViewArray = array;
    
    NSIndexPath *newIndexPath=[[NSIndexPath alloc]init];
    newIndexPath = [NSIndexPath indexPathForRow:[self.tableViewArray count] inSection:0];
    //[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
   // [tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)dismissView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
