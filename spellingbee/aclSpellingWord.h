//
//  aclSpellingWord.h
//  spellingbee
//
//  Created by Amit Londhe on 3/15/14.
//  Copyright (c) 2014 Amit Londhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface aclSpellingWord : NSObject {
    int _uniqueId;
    NSString *_word;
    NSString *_origin;
    NSString *_partOfSpeech;
}

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *word;
@property (nonatomic, copy) NSString *origin;
@property (nonatomic, copy) NSString *partOfSpeech;

+ (id)initWithUniqueId:(int)uniqueId word:(NSString *)word origin:(NSString *)origin
                 partOfSpeech:(NSString *)partOfSpeech;


@end
