//
//  PFInstagramActivity.h
//  iso500
//
//  Created by David Charlec on 10/23/12.
//  Copyright (c) 2012 Pulpfingers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFInstagramActivityViewController.h"

@interface PFInstagramActivity : UIActivity <PFInstagramActivityViewControllerDelegate> {
    
    UIImage *sharedImage;
    PFInstagramActivityViewController *dummyViewController;
    
}

@end
