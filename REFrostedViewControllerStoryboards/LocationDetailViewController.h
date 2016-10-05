//
//  LocationDetailViewController.h
//  Airfield-Manager
//
//  Created by Terrance Miller on 2/18/16.
//  Copyright © 2016 Terrance Miller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface LocationDetailViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate,MFMailComposeViewControllerDelegate> {
    
    int _uniqueId;
    UILabel *_id;
    UITextField *_field_lat;
    UITextField *_field_lng;
    UITextField *_field_disc;
    UITextField *_field_date;
    UITextField *_field_name;
    UITextView *_field_notes;
    UIButton *takePhoto;
    NSString *pic;
    NSData *picData;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, retain) IBOutlet UITextField *field_lat;
@property (nonatomic, retain) IBOutlet UITextField *field_lng;
@property (nonatomic, retain) IBOutlet UITextField *field_disc;
@property (nonatomic, retain) IBOutlet UIButton *takePhoto;
@property (nonatomic, retain) NSString *pic;
@property (nonatomic, retain) NSData *picData;
@property (nonatomic, retain) IBOutlet UITextField *field_name;
@property (nonatomic, retain) IBOutlet UITextField *field_date;
@property (nonatomic, retain) IBOutlet UITextView *field_notes;
//@property (nonatomic, strong) UIPopoverController *popOver;


-(IBAction)save;
-(IBAction)takePhoto:(UIButton *)sender;
-(IBAction)email;

@end
