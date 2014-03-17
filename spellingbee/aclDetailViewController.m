//
//  aclDetailViewController.m
//  spellingbee
//
//  Created by Amit Londhe on 12/25/13.
//  Copyright (c) 2013 Amit Londhe. All rights reserved.
//

#import "aclDetailViewController.h"
#import "aclSpellingWord.h"

@interface aclDetailViewController ()
- (void)configureView;
@end

@implementation aclDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(aclSpellingWord*)newDetailItem
{
    NSLog(@"In setDetailItem");
    NSLog(@"In setDetailItem %d: %@, %@, %@", newDetailItem.uniqueId, newDetailItem.word, newDetailItem.origin, newDetailItem.partOfSpeech);
    
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    NSLog(@"End setDetailItem");
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    NSLog(@"In configureView %d: %@, %@, %@", self.detailItem.uniqueId, self.detailItem.word, self.detailItem.origin,self.detailItem.partOfSpeech);
    
    if (self.detailItem) {
        self.word.text = self.detailItem.word;
        self.origin.text = self.detailItem.origin;
        self.partOfSpeech.text = self.detailItem.partOfSpeech;
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
