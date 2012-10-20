//
//  ViewController.m
//  MGInstagramDemo
//
//  Created by Mark Glagola on 10/20/12.
//  Copyright (c) 2012 Mark Glagola. All rights reserved.
//

#import "ViewController.h"
#import "MGInstagram.h"

@interface ViewController ()
- (IBAction)post612InstagramPressed:(id)sender;
- (IBAction)post1024InstagramPressed:(id)sender;

- (IBAction)incorrectlyPost302InstagramPressed:(id)sender;
- (IBAction)correctlyPost302InstagramPressed:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) postInstagramImage:(UIImage*) image
{
    if ([[MGInstagram sharedInstance] isAppInstalled])
        [[MGInstagram sharedInstance] postImage:image inView:self.view];
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Instagram Not Installed!" message:@"Instagram must be installed on the device in order to post images" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)post612InstagramPressed:(id)sender
{
    UIImage *image = [UIImage imageNamed:@"MGInstagramPhoto"];
    [self postInstagramImage:image];
}
- (IBAction)post1024InstagramPressed:(id)sender
{
    UIImage *image = [UIImage imageNamed:@"MGInstagramPhotoLarge"];
    [self postInstagramImage:image];
}


- (IBAction)incorrectlyPost302InstagramPressed:(id)sender
{
    //BAD PRACTICE
    UIImage *image = [UIImage imageNamed:@"MGInstagramPhotoSmall"];
    [self postInstagramImage:image];
}
- (IBAction)correctlyPost302InstagramPressed:(id)sender
{
    UIImage *image = [UIImage imageNamed:@"MGInstagramPhotoSmall"];
    if ([[MGInstagram sharedInstance] isImageCorrectSize:image]) //GOOD PRACTICE
        [self postInstagramImage:image];
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Image TOO SMALL" message:@"Images must be 612x612 or larger to be posted on instagram" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    }
}

@end
