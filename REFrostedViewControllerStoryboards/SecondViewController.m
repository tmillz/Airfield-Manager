//
//  DEMOSecondViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

{
    NSArray *_pickerData;
}

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initialize Data
    _pickerData = @[@"B-1B",
                    @"B-52G",
                    @"B-52H",
                    @"FB-111A",
                    @"F-4C",
                    @"F-4D",
                    @"F-4E",
                    @"F-4G",
                    @"F-5E",
                    @"F-5F",
                    @"F-15A",
                    @"F-15B",
                    @"F-15C",
                    @"F-15D",
                    @"F-15E",
                    @"F-16A",
                    @"F-16B",
                    @"F-16C",
                    @"F-16D",
                    @"F-22",
                    @"F-100",
                    @"F-106A/B",
                    @"F-111A",
                    @"F-111D",
                    @"F-111E",
                    @"F-111F",
                    @"A-7D",
                    @"A-7K",
                    @"A-10A",
                    @"AC-130A",
                    @"AC-130H/U",
                    @"A-37B",
                    @"OV-10A",
                    @"SR-71A",
                    @"RF-4C",
                    @"EC-130E/H",
                    @"EC-135A",
                    @"EC-135C",
                    @"EC-135E",
                    @"EC-135G",
                    @"EC-135H",
                    @"EC-135J",
                    @"EC-135K",
                    @"EC-135L",
                    @"EC-135P",
                    @"EC-135Y",
                    @"RC-135M",
                    @"RC-135S",
                    @"RC-135U",
                    @"RC-135V",
                    @"RC-135W",
                    @"WC-135B",
                    @"EF-111A",
                    @"E-3A Core",
                    @"E-3A STD",
                    @"E-3B",
                    @"E-3C",
                    @"E-4B",
                    @"EC-18B",
                    @"WC-130E/H",
                    @"MC-130E/H",
                    @"C-5A",
                    @"C-5B",
                    @"C-9A",
                    @"C-9C",
                    @"C-12A",
                    @"C-12C/D",
                    @"C-12F",
                    @"C-12J",
                    @"C-17A",
                    @"C-20A",
                    @"C-20B",
                    @"C-21A",
                    @"C-22B",
                    @"C-23A",
                    @"VC-25A",
                    @"CT-39A/B",
                    @"C-130B",
                    @"C-130D",
                    @"C-130E",
                    @"C-130H",
                    @"HC-130H",
                    @"HC-130N",
                    @"HC-130P",
                    @"KC-135E",
                    @"KC-135R",
                    @"KC-135A",
                    @"C-135A",
                    @"C-135B",
                    @"VC-137B",
                    @"VC-137C",
                    @"C-140A/B",
                    @"C-141B",
                    @"KC-10A",
                    @"T-33A",
                    @"T-37B",
                    @"T-38A",
                    @"T-38B",
                    @"T-43A",
                    @"DC-9-30",
                    @"B-700-120B",
                    @"B-700-320C",
                    @"B-727",
                    @"B-737-200",
                    @"DC-8-73",
                    @"A-300-600",
                    @"A-300C",
                    @"A-300F",
                    @"DC-10-10",
                    @"DC-10-30",
                    @"DC-10-40",
                    @"L-1011-500",
                    @"B-747-100B",
                    @"B-747-200B",
                    @"B-747 SR",
                    @"B-747 SP",
                    @"B-747-200F",
                    @"B-747-300",
                    @"B-747-300M Combi",
                    @"B-747-400",
                    @"B-757-200",
                    @"B-757-200PF",
                    @"B-767-200",
                    @"B-767-200ER",
                    @"B-767-300",
                    @"B-767-300ER",
                    @"Tornado"];
    
    // Connect data
    self.picker.dataSource = self;
    self.picker.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

- (IBAction)showMenu
{
    // Dismiss keyboard (optional)
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    [self.frostedViewController presentMenuViewController];
}

@end
