//
//  PFInstagramActivity.m
//  iso500
//
//  Created by David Charlec on 10/23/12.
//  Copyright (c) 2012 Pulpfingers. All rights reserved.
//

#import "PFInstagramActivity.h"

@implementation PFInstagramActivity

- (NSString *)activityTitle {
    return @"Share on Instagram";
}

- (NSString *)activityType {
    return @"PFInstagramActivity";
}


- (UIImage *)activityImage {
    return [UIImage imageNamed:@"instagram.png"];
}


- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://app"];
    if (![[UIApplication sharedApplication] canOpenURL:instagramURL]) return NO;
    
    for (UIActivityItemProvider *item in activityItems) {
        if ([item isKindOfClass:[UIImage class]]) {
            return YES;
        }
    }
    
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    
    for (id item in activityItems) {
        if ([item isKindOfClass:[UIImage class]]) {
            sharedImage = (UIImage *)item;
        }        
    }
}


- (UIViewController *)activityViewController {
    dummyViewController = [[PFInstagramActivityViewController alloc] initWithImage:sharedImage];
    dummyViewController.delegate = self;
    return dummyViewController;
}


- (void)instagramActivityViewControllerDidFinish {
    [self activityDidFinish:YES];
}


@end
