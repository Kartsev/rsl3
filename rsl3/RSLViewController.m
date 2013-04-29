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
    UIButton *checkbox;
    BOOL checkBoxSelected;
}
@end

@implementation RSLViewController

@synthesize fullSearchButton,textView,mainView;

- (void)viewDidLoad
{

    quickSearchTF = [[UITextField alloc] initWithFrame:CGRectMake(193, 500, 382, 44)];
    quickSearchTF.borderStyle = UITextBorderStyleRoundedRect;
    [quickSearchTF setText:@""];
    quickSearchTF.font = [UIFont systemFontOfSize:16.0f];
    quickSearchTF.layer.cornerRadius = 21;
    quickSearchTF.layer.borderColor=[[UIColor darkGrayColor] CGColor];
    quickSearchTF.clipsToBounds=true;
    [quickSearchTF.layer setBorderWidth:1.5];
    quickSearchTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    quickSearchTF.userInteractionEnabled=true;
    quickSearchTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    quickSearchTF.leftViewMode=UITextFieldViewModeUnlessEditing;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    imageView.image = [UIImage imageNamed:@"search.png"];
    quickSearchTF.leftView = imageView;
    [quickSearchTF setPlaceholder:@"Быстрый поиск"];
    
    [self.view addSubview:quickSearchTF];
    quickSearchTF.delegate=(id)self;
    
    NSString *defLanguage = [[NSLocale preferredLanguages] objectAtIndex:0]; //язык - 2 буквы en/ru
    NSString *alertViewText = [[NSString alloc] initWithFormat:@"%@",defLanguage];
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"alert" message:alertViewText
                                                  delegate:nil cancelButtonTitle:@"Back" otherButtonTitles:@"yes", nil];
    [alert show];
	// Do any additional setup after loading the view, typically from a nib.
    
   // textView = [[UITextView alloc] initWithFrame:CGRectMake(1, 1, 320, 222)];
    [textView setText:@"asdasdasdasddscgxcbdafkjkl asdillas df okjsdfklh kljafsh jkas dfhjk\n asdfasdf ajksdhfkh adsfg k khjasdfgh ajksdfg "];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineHeightMultiple = 20.0f;
    paragraphStyle.maximumLineHeight = 20.0f;
    paragraphStyle.minimumLineHeight = 20.0f;
    NSString *string = @"if you want reduce or increase space between lines in uitextview ,you can do this with this,but donot set font on this paragraph , set this on uitextveiw.";
    
    NSDictionary *ats = @{
    NSParagraphStyleAttributeName : paragraphStyle,
    };
    
   
    [textView setFont:[UIFont fontWithName:@"Arial" size:30.0f]];
      textView.attributedText = [[NSAttributedString alloc] initWithString:string attributes:ats];
    
    
    checkbox = [[UIButton alloc] initWithFrame:CGRectMake(207,557,16,16)];
                
                
                [checkbox setBackgroundImage:[UIImage imageNamed:@"notselectedcheckbox.png"] forState:UIControlStateNormal];
                [checkbox setBackgroundImage:[UIImage imageNamed:@"selectedcheckbox.png"]
                                    forState:UIControlStateSelected];
                [checkbox setBackgroundImage:[UIImage imageNamed:@"selectedcheckbox.png"]
                                    forState:UIControlStateHighlighted];
                checkbox.adjustsImageWhenHighlighted=YES;
                [checkbox addTarget: self action:@selector(checkboxSelected:) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:checkbox];
                [super viewDidLoad];

}

-(void)checkboxSelected:(id)sender
{
    checkBoxSelected = !checkBoxSelected;
    [checkbox setSelected:checkBoxSelected];
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
