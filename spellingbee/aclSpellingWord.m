//
//  aclSpellingWord.m
//  spellingbee
//
//  Created by Amit Londhe on 3/15/14.
//  Copyright (c) 2014 Amit Londhe. All rights reserved.
//

#import "aclSpellingWord.h"

@implementation aclSpellingWord

@synthesize uniqueId = _uniqueId;
@synthesize word = _word;
@synthesize origin = _origin;
@synthesize partOfSpeech = _partOfSpeech;



- (void) dealloc {
    self.word = nil;
    self.origin = nil;
    self.partOfSpeech = nil;
    //[super dealloc];
}



@end
