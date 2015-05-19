//
//  WebViewController.m
//  CodeChallenge1
//
//  Created by Maxi Casal on 10/2/14.
//  Copyright (c) 2014 Maxi Casal. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleWeb;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleWeb.title = [NSString stringWithFormat:@"%d", self.resultVal];
    [self loadHomePage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadURLString: (NSString *) urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

-(void) loadHomePage{
    [self loadURLString:@"http://www.mobilemakers.co/"];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
}

@end
