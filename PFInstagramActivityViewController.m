//
//  ViewController.m
//  iso500
//
//  Created by David Charlec on 10/23/12.
//  Copyright (c) 2012 Pulpfingers. All rights reserved.
//

#import "PFInstagramActivityViewController.h"

@interface PFInstagramActivityViewController ()

@end

@implementation PFInstagramActivityViewController

- (id)initWithImage:(UIImage *)image {

    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        sharedImage = image;
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 612.0, 612.0)];
    [imageView setImage:sharedImage];
    [imageView setContentMode:UIViewContentModeScaleAspectFill];

    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    path = [path stringByAppendingString:@"/localImage.igo"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSError *error;
        if (![fileManager removeItemAtPath:path error:&error]) {
            NSLog(@"Error removing file: %@", error);
        }
    }
    
    UIGraphicsBeginImageContext(imageView.bounds.size);
    [imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    NSData *data = UIImageJPEGRepresentation(viewImage, 1.0);
    [data writeToFile:path atomically:YES];
    
    documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:path]];
    documentInteractionController.UTI = @"com.instagram.exclusivegram";
    documentInteractionController.delegate = self;
    [documentInteractionController presentOpenInMenuFromRect:CGRectZero inView:self.view animated:YES];
    
}

- (void)documentInteractionControllerDidDismissOpenInMenu:(UIDocumentInteractionController *)controller {
    [self.delegate instagramActivityViewControllerDidFinish];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
