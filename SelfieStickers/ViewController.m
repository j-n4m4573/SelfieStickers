//
//  ViewController.m
//  SelfieStickers
//
//  Created by Jamar Gibbs on 1/21/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

#import "ViewController.h"
#import "Sticker.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property Sticker *stickerView;
@property Sticker *stickerView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stickerView = [[Sticker alloc]initWithImage:[UIImage imageNamed:@"glasses.jpg"]];
    [self.view addSubview:self.stickerView];
    self.stickerView.center = self.view.center;
    
    self.stickerView2 = [[Sticker alloc]initWithImage:[UIImage imageNamed:@"whiskers.jpg"]];
    [self.view addSubview:self.stickerView2];
    self.stickerView2.center = self.view.center;
}

- (IBAction)onTakePhotoPressed:(id)sender {
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.allowsEditing = YES; 
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)onChoosePhotoPresssed:(id)sender {
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    self.imageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:nil]; 
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}




@end
