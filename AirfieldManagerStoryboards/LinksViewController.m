//
//  LinksViewController.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 9/17/14.
//  Copyright (c) 2014 Terrance Miller. All rights reserved.
//

#import "LinksViewController.h"

@interface LinksViewController ()

@end

@implementation LinksViewController

- (IBAction)showMenu
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}

- (IBAction)link1:(id)sender {
    //UIButton *button = (UIButton *)sender;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.aisr.nas.faa.gov/AISR/"]];
}

- (IBAction)link2:(id)sender {
    //UIButton *button = (UIButton *)sender;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.faa.gov/air_traffic/publications/"]];
}

- (IBAction)link3:(id)sender {
    //UIButton *button = (UIButton *)sender;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.e-publishing.af.mil/"]];
}

- (IBAction)link4:(id)sender {
    //UIButton *button = (UIButton *)sender;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://transportation.wes.army.mil/acnpcn/Default.aspx"]];
}

@end
