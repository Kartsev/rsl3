//
//  RSLViewController.m
//  rsl3
//
//  Created by Kartsev on 3/21/13.
//  Copyright (c) 2013 Kartsev. All rights reserved.
//

#import "RSLViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "fullSearchViewController.h"
#import "searchResultsViewController.h"

@interface RSLViewController (){
UITextField *quickSearchTF;
}
@end

@implementation RSLViewController

@synthesize fullSearchButton;

- (void)viewDidLoad
{

    quickSearchTF = [[UITextField alloc] initWithFrame:CGRectMake(110, 270, 548, 70)];
    quickSearchTF.borderStyle = UITextBorderStyleRoundedRect;
    [quickSearchTF setText:@""];
    quickSearchTF.font = [UIFont systemFontOfSize:32.0f];
    quickSearchTF.layer.borderWidth=3;
    quickSearchTF.layer.cornerRadius = 20;
    quickSearchTF.layer.borderColor=[[UIColor darkGrayColor] CGColor];
    quickSearchTF.clipsToBounds=true;
    [quickSearchTF.layer setBorderWidth:3.0];
    quickSearchTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:quickSearchTF];
    quickSearchTF.delegate=(id)self;
    
    NSString *defLanguage = [[NSLocale preferredLanguages] objectAtIndex:0]; //язык - 2 буквы en/ru
    
    NSString *alertViewText = [[NSString alloc] initWithFormat:@"%@",defLanguage];
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"alert" message:alertViewText
                                                  delegate:nil cancelButtonTitle:@"Back" otherButtonTitles:@"yes", nil];
    [alert show];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)fullSearchPressed:(id)sender{
    fullSearchViewController *fullSearchView = [[fullSearchViewController alloc] init];
    [fullSearchView setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:fullSearchView animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:quickSearchTF.text forKey:@"searchText"];
    searchResultsViewController *searchResultsView = [[searchResultsViewController alloc] init];
    [searchResultsView setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:searchResultsView animated:YES completion:nil];

    return YES;
}

@end
