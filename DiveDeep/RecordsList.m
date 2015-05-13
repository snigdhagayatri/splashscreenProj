//
//  RecordsList.m
//  DiveDeep
//
//  Created by ReddyBasha on 3/1/15.
//  Copyright (c) 2015 tech. All rights reserved.
//

#import "RecordsList.h"

@implementation RecordsList

+ (RecordsList *)recordsList
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        self.allRecords = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
