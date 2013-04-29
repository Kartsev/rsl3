//
//  fullSearchViewController.m
//  rsl3
//
//  Created by Kartsev on 3/22/13.
//  Copyright (c) 2013 Kartsev. All rights reserved.
//

#import "fullSearchViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface fullSearchViewController ()

@end

@implementation fullSearchViewController
@synthesize textView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITextField *authorSearhTF = [[UITextField alloc] initWithFrame:CGRectMake(110, 170, 548, 70)];
    authorSearhTF.borderStyle = UITextBorderStyleRoundedRect;
    [authorSearhTF setText:@""];
    authorSearhTF.font = [UIFont systemFontOfSize:32.0f];
    authorSearhTF.layer.borderWidth=3;
    authorSearhTF.layer.cornerRadius = 20;
    authorSearhTF.layer.borderColor=[[UIColor darkGrayColor] CGColor];
    authorSearhTF.clipsToBounds=true;
    [authorSearhTF.layer setBorderWidth:3.0];
    authorSearhTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:authorSearhTF];

    UITextField *nameSearhTF = [[UITextField alloc] initWithFrame:CGRectMake(110, 320, 548, 70)];
    nameSearhTF.borderStyle = UITextBorderStyleRoundedRect;
    [nameSearhTF setText:@""];
    nameSearhTF.font = [UIFont systemFontOfSize:32.0f];
    nameSearhTF.layer.borderWidth=3;
    nameSearhTF.layer.cornerRadius = 20;
    nameSearhTF.layer.borderColor=[[UIColor darkGrayColor] CGColor];
    nameSearhTF.clipsToBounds=true;
    [nameSearhTF.layer setBorderWidth:3.0];
    nameSearhTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:nameSearhTF];

    UITextField *phraseSearhTF = [[UITextField alloc] initWithFrame:CGRectMake(110, 470, 548, 70)];
    phraseSearhTF.borderStyle = UITextBorderStyleRoundedRect;
    [phraseSearhTF setText:@""];
    phraseSearhTF.font = [UIFont systemFontOfSize:32.0f];
    phraseSearhTF.layer.borderWidth=3;
    phraseSearhTF.layer.cornerRadius = 20;
    phraseSearhTF.layer.borderColor=[[UIColor darkGrayColor] CGColor];
    phraseSearhTF.clipsToBounds=true;
    [phraseSearhTF.layer setBorderWidth:3.0];
    phraseSearhTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:phraseSearhTF];

    UITextField *directionSearhTF = [[UITextField alloc] initWithFrame:CGRectMake(110, 620, 548, 70)];
    directionSearhTF.borderStyle = UITextBorderStyleRoundedRect;
    [directionSearhTF setText:@""];
    directionSearhTF.font = [UIFont systemFontOfSize:32.0f];
    directionSearhTF.layer.borderWidth=3;
    directionSearhTF.layer.cornerRadius = 20;
    directionSearhTF.layer.borderColor=[[UIColor darkGrayColor] CGColor];
    directionSearhTF.clipsToBounds=true;
    [directionSearhTF.layer setBorderWidth:3.0];
    directionSearhTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:directionSearhTF];

    UITextField *yearFromTF = [[UITextField alloc] initWithFrame:CGRectMake(170, 770, 170, 70)];
    yearFromTF.borderStyle = UITextBorderStyleRoundedRect;
    [yearFromTF setText:@""];
    yearFromTF.font = [UIFont systemFontOfSize:32.0f];
    yearFromTF.layer.borderWidth=3;
    yearFromTF.layer.cornerRadius = 20;
    yearFromTF.layer.borderColor=[[UIColor darkGrayColor] CGColor];
    yearFromTF.clipsToBounds=true;
    [yearFromTF.layer setBorderWidth:3.0];
    yearFromTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:yearFromTF];

    UITextField *yearTillTF = [[UITextField alloc] initWithFrame:CGRectMake(430, 770, 170, 70)];
    yearTillTF.borderStyle = UITextBorderStyleRoundedRect;
    [yearTillTF setText:@""];
    yearTillTF.font = [UIFont systemFontOfSize:32.0f];
    yearTillTF.layer.borderWidth=3;
    yearTillTF.layer.cornerRadius = 20;
    yearTillTF.layer.borderColor=[[UIColor darkGrayColor] CGColor];
    yearTillTF.clipsToBounds=true;
    [yearTillTF.layer setBorderWidth:3.0];
    yearTillTF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:yearTillTF];
    // Do any additional setup after loading the view from its nib.
    
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
