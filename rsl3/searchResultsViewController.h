//
//  searchResultsViewController.h
//  rsl3
//
//  Created by Kartsev on 3/29/13.
//  Copyright (c) 2013 Kartsev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface searchResultsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

{


}

@property(nonatomic, retain) NSArray *tableViewArray;
@property(nonatomic, retain) NSMutableArray *array;
@property(nonatomic, retain) IBOutlet UITableView *tableView;
@property(nonatomic, retain) IBOutlet UINavigationBar *navBar;
@end
