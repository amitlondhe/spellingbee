//
//  aclSpellingBeeDatabase.m
//  spellingbee
//
//  Created by Amit Londhe on 3/15/14.
//  Copyright (c) 2014 Amit Londhe. All rights reserved.
//

#import "aclSpellingBeeDatabase.h"
#import "aclSpellingWord.h"


@implementation aclSpellingBeeDatabase

static aclSpellingBeeDatabase *_database;

+ (aclSpellingBeeDatabase*)database {
    if (_database == nil) {
        NSLog(@"Creating Database handle");
        _database = [[aclSpellingBeeDatabase alloc] init];
    }
    return _database;
}

- (id)init {
    if ((self = [super init])) {
        
        // This should be the one used on phone app. Not sure yet about bundling it with nib
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"mydata"
                                                             ofType:@"sqlite3"];
        
        //This is being used so that local testing data can be persisted
        sqLiteDb = @"file:/Users/amit/mydata.db";
        NSLog(@"Opening the Sqlite Database %@", sqLiteDb);
        
        int ret = sqlite3_open([sqLiteDb UTF8String], &_database);
        NSLog(@"Opening the Sqlite Database return code is %d", ret);

        if (ret != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

- (void)dealloc {
    sqlite3_close(_database);
//    [super dealloc];
}

- (NSArray *)spellingWords {
    NSLog(@"Here in SpellingWords");
    NSMutableArray *retval = [[NSMutableArray alloc] init];

    /*
    NSString *createQuery = @"CREATE TABLE EMP (EMPID,EMPNAME);";
    sqlite3_stmt *statementForCreate;
    int sqlReturnStatus = sqlite3_prepare_v2(_database, [createQuery UTF8String], -1, &statementForCreate, nil);
    NSLog(@"sqlite3_prepare_v2 CreateQuery returnStatus -  %d",sqlReturnStatus);
    int executionStatus = sqlite3_step(statementForCreate);
    NSLog(@"Executing create statement returnStatus -  %d",executionStatus);

    
    NSString *insertQuery1 = @"INSERT INTO EMP values('1','Amit');";
    sqlite3_stmt *statementForInsert;
    sqlReturnStatus = sqlite3_prepare_v2(_database, [insertQuery1 UTF8String], -1, &statementForInsert, nil);
    NSLog(@"sqlite3_prepare_v2 InsertQuery returnStatus -  %d",sqlReturnStatus);
    if (sqlite3_step(statementForInsert) != SQLITE_DONE)
    {
        NSLog(@"error: %s", sqlite3_errmsg(_database));
    }

    NSString *selectQuery = @"SELECT EMPID,EMPNAME from EMP;";
    sqlite3_stmt *statementForSelect;
    sqlReturnStatus = sqlite3_prepare_v2(_database, [selectQuery UTF8String], -1, &statementForSelect, nil);
    NSLog(@"sqlite3_prepare_v2 SelectQuery returnStatus -  %d",sqlReturnStatus);
    while (sqlite3_step(statementForSelect) == SQLITE_ROW) {
        NSLog(@"Here in while");
        char *empid = (char *) sqlite3_column_text(statementForSelect, 0);
        char *empName = (char *) sqlite3_column_text(statementForSelect, 1);
        NSLog(@"EMPID - %s And EMPNAME - %s",empid,empName);
    }
    */
    
    NSString *query = @"SELECT id, spelling_word, origin, part_of_speech FROM words;";
    sqlite3_stmt *statement;
    int sqlReturnStatus = sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil);
    NSLog(@"Executing statement returnStatus -  %d",sqlReturnStatus);
    
    if (sqlReturnStatus == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            
            NSLog(@"Here in while");

            int uniqueId = sqlite3_column_int(statement, 0);
            char *spellingWordChars = (char *) sqlite3_column_text(statement, 1);
            char *originChars = (char *) sqlite3_column_text(statement, 2);
            char *partOfSpeechChars = (char *) sqlite3_column_text(statement, 3);
            NSString *spellingWord = [[NSString alloc] initWithUTF8String:spellingWordChars];
            NSString *origin = [[NSString alloc] initWithUTF8String:originChars];
            NSString *partOfSpeech = [[NSString alloc] initWithUTF8String:partOfSpeechChars];
           
            aclSpellingWord *info = [aclSpellingWord alloc];
            info.uniqueId = uniqueId;
            info.word = spellingWord;
            info.origin = origin;
            info.partOfSpeech = partOfSpeech;
            
            /* not sure why this does not work */
//            aclSpellingWord *info = [[aclSpellingWord alloc] initWithUniqueId:uniqueId word:spellingWord origin:origin partOfSpeech:partOfSpeech];
            
            [retval addObject:info];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

@end
