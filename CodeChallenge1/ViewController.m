//
//  ViewController.m
//  CodeChallenge1
//
//  Created by Maxi Casal on 10/2/14.
//  Copyright (c) 2014 Maxi Casal. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *valueTwoTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueOneTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *web;
@property (weak, nonatomic) IBOutlet UINavigationItem *answerTitle;

@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (int)doCalculations {
    int valueOne = 0;
    int valueTwo = 0;
    int resultValue = 0;
    valueOne= [self.valueOneTextField.text intValue];
    valueTwo= [self.valueTwoTextField.text intValue];
    resultValue = valueOne * valueTwo;
    return resultValue;
}

- (void)updateWebButton:(int)resultValue {
    if (resultValue % 5 != 0) {
        self.web.enabled = NO;
    }else{
        self.web.enabled=YES;
    }
}

- (IBAction)onCalculateButtonPressed:(id)sender {
    [self.view endEditing:YES];
    int resultValue;
    resultValue = [self doCalculations];
    self.answerTitle.title = [NSString stringWithFormat:@"%d", resultValue];
    
    self.resultVal = resultValue;
    
    [self updateWebButton:resultValue];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    WebViewController *webViewController = [segue destinationViewController];
    webViewController.resultVal = self.resultVal;
}

@end
