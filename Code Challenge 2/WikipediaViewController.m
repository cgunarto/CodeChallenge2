//
//  WikipediaViewController.m
//  Code Challenge 2
//
//  Created by CHRISTINA GUNARTO on 10/30/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import "WikipediaViewController.h"

@interface WikipediaViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WikipediaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *url = self.city.url;
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
    [self.view addSubview:self.webView];

}



- (IBAction)onBackButtonPressed:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];

}



@end
