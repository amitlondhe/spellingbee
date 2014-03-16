//
//  aclSpellingBeeDatabase.h
//  spellingbee
//
//  Created by Amit Londhe on 3/15/14.
//  Copyright (c) 2014 Amit Londhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface aclSpellingBeeDatabase : NSObject {
    sqlite3 *_database;

}

+ (aclSpellingBeeDatabase*)database;
- (NSArray *)spellingWords;


@end
