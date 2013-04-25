//
//  searchResultsViewController.m
//  rsl3
//
//  Created by Kartsev on 3/29/13.
//  Copyright (c) 2013 Kartsev. All rights reserved.
//

#import "searchResultsViewController.h"

@interface searchResultsViewController (){
    bool finishsearch,digital;
    NSMutableArray *ids;
    NSMutableArray *indexes,*isopen;
    NSString *collections,*collections1;
    int from,till;
    bool nothingfound;
    NSString *languages;
    NSURLConnection *theConnection;
   
}

@end

@implementation searchResultsViewController

@synthesize tableView,tableViewArray;
@synthesize array,webData;



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
    // Do any additional setup after loading the view from its nib.
    tableView= [[UITableView alloc] initWithFrame:CGRectMake(10, 0, 738, 784)
                                                style:UITableViewStylePlain];
    
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [super viewDidLoad];
    finishsearch=true;
    ids = [[NSMutableArray alloc] initWithObjects:nil];
    array = [[NSMutableArray alloc] initWithObjects:nil];
    indexes=[[NSMutableArray alloc] initWithObjects:nil];
    isopen=[[NSMutableArray alloc] initWithObjects:nil];
    self.tableViewArray = array;	// Do any additional setup after loading the view.
    collections=@"0,1,02,9,7,12,4,5,";
    collections1=@"1,02,9,7,12,4,5,";
    [prefs setObject:@"" forKey:@"languages"];
    [prefs setObject:@"0,1,02,9,7,12,4,5,13," forKey:@"collections"];
    collections = [prefs stringForKey:@"collections"];
    [prefs setObject:@"NO" forKey:@"somethingChanged"];
    [prefs setObject:@"-5500" forKey:@"pubyearfrom"];
    [prefs setObject:@"" forKey:@"speccode"];
    [prefs setObject:@"3000" forKey:@"pubyeartill"];
    [prefs setObject:@"FALSE" forKey:@"openonly"];
    [prefs setObject:@"" forKey:@"sortby"];
    [prefs setObject:@"релевантности" forKey:@"sortButtonName"];
    // [prefs setObject:@"NO" forKey:@"User"];
    tableView.delegate = (id)self;
    tableView.dataSource = (id)self;
    [prefs setObject:@"fdate desc" forKey:@"sortby"];
    [prefs setObject:@"white" forKey:@"color"];
    // [self buttonPressed:searchButton];

    // sortTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    
    
    [self search];
}

-(void)search{
    NSString *urlStr=@"";
    {
        from=1;
        till=10;
    }
   
   // [array removeAllObjects];
   // [tableView reloadData];
      if(finishsearch){
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        while(tableView.subviews.count > 0) [[tableView.subviews objectAtIndex:0] removeFromSuperview];
               

        indexes=[[NSMutableArray alloc] initWithObjects: nil];
        ids=[[NSMutableArray alloc] initWithObjects: nil];
        
              
        for(int i=1;i<11;i++)
        {
            [ids addObject:@""];
            [indexes addObject:@""];
        }
               
   //     tableView.separatorColor=[UIColor clearColor];
      // [myLabel removeFromSuperview];
        {
             if(finishsearch){
               /* indicatorBig = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                
                
                indicatorBig.center = CGPointMake(self.view.frame.size.width/2,430);
                [indicatorBig startAnimating];
                [self.view addSubview:indicatorBig];
                
                
                lLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-80, 360, 270, 40)];
                
                lLabel.font = [UIFont systemFontOfSize: 35.0];
                lLabel.text = @"Загрузка...";*/
                NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
                /*
                if ([[prefs objectForKey:@"language"]isEqualToString:@"eng"]) {
                    lLabel.text = @"Loading...";
                }
                lLabel.backgroundColor = [UIColor clearColor];
                
                
                if ([[prefs objectForKey:@"color"]isEqualToString:@"black"]) {
                    lLabel.textColor = [UIColor whiteColor];}
                if ([[prefs objectForKey:@"color"]isEqualToString:@"white"]) {
                    lLabel.textColor = [UIColor blackColor];
                }
                if ([[prefs objectForKey:@"color"]isEqualToString:@"blue"]) {
                    lLabel.textColor = [UIColor whiteColor];
                }
                lLabel.numberOfLines = ceilf([lLabel.text  sizeWithFont:[UIFont boldSystemFontOfSize:14] constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap].height/10.0);
                
                [self.view addSubview:lLabel];
                */
                
                nothingfound=true;
                indexes=[[NSMutableArray alloc] initWithObjects:nil];
                ids=[[NSMutableArray alloc] initWithObjects:nil];
                isopen=[[NSMutableArray alloc] initWithObjects:nil];
                NSString *searchString = [prefs objectForKey:@"searchText"];
                 searchString=@"as";
              //  [array removeAllObjects];
              //  [tableView reloadData];
                
             
                collections = [prefs stringForKey:@"collections"];
                collections=[collections stringByReplacingOccurrencesOfString:@"02" withString:@"2"];
                
                
                urlStr=[[NSString alloc] initWithFormat:@"http://search.rsl.ru/rest/search?query=%@&from=%i&step=%i",searchString,from,10] ;
                
                /* NSString *alertViewText = [[NSString alloc] initWithFormat:@"%@",[prefs stringForKey:@"pubyeartill"]];
                 UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"alert" message:alertViewText
                 delegate:nil cancelButtonTitle:@"Back" otherButtonTitles:@"yes", nil];
                 [alert show];*/
                
                
                NSString *tempcol=collections;
                if ([tempcol length]!=0) {
                    while ([tempcol rangeOfString:@","].location!=NSNotFound) {
                        
                        urlStr=[urlStr stringByAppendingString:[NSString stringWithFormat:@"&c[%@]=%@",[tempcol substringToIndex:[tempcol rangeOfString:@","].location],[tempcol substringToIndex:[tempcol rangeOfString:@","].location]]];
                        tempcol=[tempcol substringFromIndex:[tempcol rangeOfString:@","].location+1];
                        
                        
                    }
                }
                if(digital==true){
                    urlStr=[urlStr stringByAppendingString:[NSString stringWithFormat:@"&digital=1"]];
                }
                else{
                    urlStr=[urlStr stringByAppendingString:[NSString stringWithFormat:@"&digital=0"]];
                }
                
                languages =[prefs stringForKey:@"languages"] ;
                if ([languages length]!=0){
                    while ([languages rangeOfString:@","].location!=NSNotFound) {
                        int langint;
                        langint=0;
                        NSString *templang;
                        templang=[languages substringToIndex:[languages rangeOfString:@","].location];
                        
                        for (int i=0; i<[[languages substringToIndex:[languages rangeOfString:@","].location] length]&i<4; i++) {
                            langint = (langint <<=8)|[templang characterAtIndex:i] ;
                        }
                        
                        urlStr=[urlStr stringByAppendingString:[NSString stringWithFormat:@"&lang[%@]=%@",templang,templang]];
                        languages=[languages substringFromIndex:[languages rangeOfString:@","].location+1];
                        
                    }
                    
                }
                
                
                if (![[prefs stringForKey:@"speccode"]isEqualToString:@""]){
                    urlStr=[urlStr stringByAppendingString:[NSString stringWithFormat:@"&vak-code[%@]=%@",[prefs stringForKey:@"speccode"],[prefs stringForKey:@"speccode"]]];
                }
                // NSTimeInterval timeStamp = [[NSDate date]timeIntervalSince1970];
                
                
                //  NSString *timenow = [[NSString alloc] initWithFormat:@"%.f",timeStamp];
                //  NSString *timeyesterday=[[NSString alloc] initWithFormat:@"%.f",timeStamp-86400*30*6];
                
                
                
                if ([[prefs stringForKey:@"openonly"] isEqualToString:@"TRUE"]) {
                    urlStr=[urlStr stringByAppendingString:[NSString stringWithFormat:@"&open=1"]];
                }
                else{
                    urlStr=[urlStr stringByAppendingString:[NSString stringWithFormat:@"&open=0"]];
                }
                
                if (![[prefs stringForKey:@"sortby"] isEqualToString:@""]) {
                    urlStr=[urlStr stringByAppendingString:[NSString stringWithFormat:@"&sort=%@",[prefs objectForKey:@"sortby"]]];
                }
                
                urlStr=[urlStr stringByAppendingString:[NSString stringWithFormat:@"&searchTxt=1"]];
                                
                urlStr=[urlStr stringByAppendingString:[NSString stringWithFormat:@"&pub-min=%@",[prefs stringForKey:@"pubyearfrom"]]];
                urlStr=[urlStr stringByAppendingString:[NSString stringWithFormat:@"&pub-max=%@",[prefs stringForKey:@"pubyeartill"]]];

                urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
               
                NSURL *url=[NSURL URLWithString:urlStr];
                NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
                [theRequest addValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
                theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
                [theConnection start];
                if( theConnection )
                {
                    webData = [NSMutableData data];
                }
                
            }
        }
    }
    }

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    [webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
            [webData appendData:data];
    
}



- (NSInteger)tableView:(UITableView *)ttableView numberOfRowsInSection:(NSInteger)section{
    return [tableViewArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleTableIdentifier"];
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SimpleTableIdentifier"];
            
        }
        cell.textLabel.font=[UIFont systemFontOfSize:17];
        UIColor *theFontColor ;
        cell.textLabel.textColor = theFontColor;
        cell.textLabel.text = [tableViewArray objectAtIndex:indexPath.row];
        cell.textLabel.numberOfLines = 2;
        cell.backgroundColor=[UIColor clearColor];
        return cell;
        
}

- (CGFloat)tableView:(UITableView *)tableView1 heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
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
