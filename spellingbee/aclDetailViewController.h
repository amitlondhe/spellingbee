//
//  aclDetailViewController.h
//  spellingbee
//
//  Created by Amit Londhe on 12/25/13.
//  Copyright (c) 2013 Amit Londhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "aclSpellingWord.h"

@interface aclDetailViewController : UIViewController

@property (strong, nonatomic) aclSpellingWord *detailItem;

@property (weak, nonatomic) IBOutlet UILabel *word;
@property (weak, nonatomic) IBOutlet UILabel *origin;
@property (weak, nonatomic) IBOutlet UILabel *partOfSpeech;


@end
