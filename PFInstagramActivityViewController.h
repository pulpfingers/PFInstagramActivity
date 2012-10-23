//
//  PFInstagramActivityViewController.h
//  iso500
//
//  Created by David Charlec on 10/23/12.
//  Copyright (c) 2012 Pulpfingers. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PFInstagramActivityViewControllerDelegate;

@interface PFInstagramActivityViewController : UIViewController  <UIDocumentInteractionControllerDelegate> {
    UIImage *sharedImage;
    UIDocumentInteractionController *documentInteractionController;
}

- (id)initWithImage:(UIImage *)sharedImage;

@property(nonatomic, weak) id<PFInstagramActivityViewControllerDelegate> delegate;

@end

@protocol PFInstagramActivityViewControllerDelegate <NSObject>

- (void)instagramActivityViewControllerDidFinish;

@end
