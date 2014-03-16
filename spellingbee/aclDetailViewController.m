//
//  aclDetailViewController.m
//  spellingbee
//
//  Created by Amit Londhe on 12/25/13.
//  Copyright (c) 2013 Amit Londhe. All rights reserved.
//

#import "aclDetailViewController.h"

@interface aclDetailViewController ()
- (void)configureView;
@end

@implementation aclDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem word];
        self.Origin.text = [self.detailItem origin];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
