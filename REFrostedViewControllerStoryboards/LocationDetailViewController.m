//
//  LocationDetailViewController.m
//  Airfield-Manager
//
//  Created by Terrance Miller on 2/18/16.
//  Copyright © 2016 Terrance Miller. All rights reserved.
//

#import "LocationDetailViewController.h"
#import "LocationInfo.h"
#import "DiscViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LocationDetailViewController ()
@end

@implementation LocationDetailViewController

@synthesize field_disc = _field_disc;
@synthesize field_lat = _field_lat;
@synthesize field_lng = _field_lng;
@synthesize takePhoto;
@synthesize pic;
@synthesize picData;


-(void)save {
    NSLog(@"save button pressed");
    NSString *disc = [_field_disc text];
    NSString *lat = [_field_lat text];
    NSString *lng = [_field_lng text];
    NSString *date = [_field_date text];
    NSString *name = [_field_name text];
    NSString *notes = [_field_notes text];
    DiscViewController *save = [[DiscViewController alloc] init];
    [save idParam:_uniqueId discParam:disc latParam:lat lngParam:lng picParam:pic dateParam:date nameParam:name notesParam:notes];
}

-(void)email {
    [self sendEmail:self];
}

-(void)viewDidUnload {
    self.field_disc = nil;
    self.field_lat = nil;
    self.field_lng = nil;
    self.takePhoto = nil;
    self.field_date = nil;
    self.field_name = nil;
    self.field_notes = nil;
}

-(void)dealloc {
    self.field_disc = nil;
    self.field_lat = nil;
    self.field_lng = nil;
    self.takePhoto = nil;
    self.field_date = nil;
    self.field_name = nil;
    self.field_notes = nil;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:(BOOL)animated];
    //NSLog(@"viewWillAppearCalled");
    
    LocationInfo *details = [[DiscViewController locationsDB] locationInfos:_uniqueId];
    NSString *field_pic = details.field_pic;
    [takePhoto.imageView setFrame:takePhoto.bounds];
    [takePhoto.imageView setContentMode:UIViewContentModeScaleAspectFit];
    if (details != nil) {
        [_field_disc setText:details.field_disc];
        [_field_lat setText:details.field_lat];
        [_field_lng setText:details.field_lng];
        [_field_date setText:details.field_date];
        [_field_name setText:details.field_name];
        [_field_notes setText:details.field_notes];
        NSData *picMeData = [[NSData alloc] initWithBase64EncodedString:field_pic options:0];
        //NSString *picMe = [[NSString alloc] initWithData:picMeData encoding:NSUTF8StringEncoding];
        UIImage *img = [UIImage imageWithData:picMeData];
        [takePhoto setImage:img forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"viewDidLoadCalled");
    
    self.field_notes.layer.borderWidth = 0.3f;
    self.field_notes.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.field_notes.layer.cornerRadius = 4;
    self.field_notes.layer.masksToBounds = YES;
    
    UIDatePicker *datePicker=[[UIDatePicker alloc]init];
    datePicker.datePickerMode=UIDatePickerModeDate;
    [_field_date setInputView:datePicker];
    
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done:)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    
    [_field_date setInputAccessoryView:toolBar];

    // Do view setup here.
    LocationInfo *details = [[DiscViewController locationsDB] locationInfos:_uniqueId];
    NSString *field_pic = details.field_pic;
    [takePhoto.imageView setFrame:takePhoto.bounds];
    [takePhoto.imageView setContentMode:UIViewContentModeScaleAspectFit];
    if (details != nil) {
        [_field_disc setText:details.field_disc];
        [_field_lat setText:details.field_lat];
        [_field_lng setText:details.field_lng];
        [_field_date setText:details.field_date];
        [_field_name setText:details.field_name];
        [_field_notes setText:details.field_notes];
        NSData *picMeData = [[NSData alloc] initWithBase64EncodedString:field_pic options:0];
        //NSString *picMe = [[NSString alloc] initWithData:picMeData encoding:NSUTF8StringEncoding];
        UIImage *img = [UIImage imageWithData:picMeData];
        [takePhoto setImage:img forState:UIControlStateNormal];
    }
}

-(void) done:(id)sender {
    
    UIDatePicker *picker = (UIDatePicker*)_field_date.inputView;
    [picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd MMM yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    _field_date.text = [NSString stringWithFormat:@"%@",dateString];
    [_field_date resignFirstResponder];
}

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Choose a photo:"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // this runs when the cameraAction is selected
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    }];
    UIAlertAction *photoLibraryAction = [UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // runs when the photoLibraryAction is selected
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    }];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cameraAction];
    [alert addAction:photoLibraryAction];
    [alert addAction:defaultAction];
    
    UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
    
    popPresenter.sourceView = takePhoto;
    popPresenter.sourceRect = takePhoto.bounds;
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    //[self scaleAndRotateImage:chosenImage];
    
    //Copy Image to Album?
    //UIImageWriteToSavedPhotosAlbum(chosenImage, self, @selector(chosenImage:didFinishSavingWithError:contextInfo:), nil);
    
    //NSURL *imageURL = [info valueForKey:UIImagePickerControllerReferenceURL];
    
    picData = UIImagePNGRepresentation(chosenImage);
    //pic = [imageURL absoluteString];
    pic = [picData base64EncodedStringWithOptions:0];
    [takePhoto setImage:chosenImage forState:UIControlStateNormal];
    //takePhoto.imageView.image=info[UIImagePickerControllerOriginalImage];
    [self save];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

/*- (void)chosenImage:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo: (void *)contextInfo {
    if (error != nil) {
        NSLog(@"Image Can not be saved");
    }
    else {
        NSLog(@"Successfully saved Image");
    }
}*/

#pragma mark - IBAction methods
- (IBAction)sendEmail:(id)sender {
    LocationInfo *details = [[DiscViewController locationsDB] locationInfos:_uniqueId];
    //email subject
    NSString * subject = @"Marker Details";
    //email body
    NSString *field_disc = details.field_disc;
    NSString *field_lat = details.field_lat;
    NSString *field_lng = details.field_lng;
    NSString *field_pic = details.field_pic;
    NSString *field_date = details.field_date;
    NSString *field_name = details.field_name;
    NSString *field_notes = details.field_notes;
    
    NSData *picMeData = [[NSData alloc] initWithBase64EncodedString:field_pic options:0];
    //UIImage *img = [UIImage imageWithData:picMeData];
    
    NSString * msg = [NSString stringWithFormat:@"Title: %@ \n Latititude: %@ \n Longitude: %@ \n Link: https://www.google.com/maps?t=k&q=%@,%@ \n Date ID'd: %@ \n ID'd By: %@ \n Notes: %@ \n\n Sent with Airfield Manager App", field_disc, field_lat, field_lng, field_lat, field_lng, field_date, field_name, field_notes];
    NSString * body = msg;
    //recipient(s)
    NSArray * recipients = [NSArray arrayWithObjects:@"", nil];
    
    //create the MFMailComposeViewController
    MFMailComposeViewController * composer = [[MFMailComposeViewController alloc] init];
    composer.mailComposeDelegate = self;
    [composer setSubject:subject];
    [composer setMessageBody:body isHTML:NO];
    //[composer setMessageBody:body isHTML:YES]; //if you want to send an HTML message
    [composer setToRecipients:recipients];
    
    //get the filepath from resources
    //NSString *filePath = [[NSBundle mainBundle] pathForResource:@"" ofType:@"png"];
    
    //read the file using NSData
    //NSData * fileData = [NSData dataWithContentsOfFile:filePath];
    // Set the MIME type
    /*you can use :
     - @"application/msword" for MS Word
     - @"application/vnd.ms-powerpoint" for PowerPoint
     - @"text/html" for HTML file
     - @"application/pdf" for PDF document
     - @"image/jpeg" for JPEG/JPG images
     */
    //NSString *mimeType = @"image/png";
    
    //add attachement
    if (picMeData != nil) {
        [composer addAttachmentData:picMeData mimeType:@"image/png" fileName:@"Marker Image.png"];
    }
    //[composer addAttachmentData:picMeData mimeType:@"image/png" fileName:@"Marker Image.png"];
    
    //present it on the screen
    //[self.frostedViewController.contentViewController presentViewController:composer animated:YES completion:NULL];
    
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:composer                                                                                                    animated:YES completion:NULL];
    
}

#pragma mark - MFMailComposeViewControllerDelegate methods
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled"); break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved"); break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent"); break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]); break;
        default:
            break;
    }
    
    // close the Mail Interface
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] dismissViewControllerAnimated:YES completion:NULL];
}


@end
