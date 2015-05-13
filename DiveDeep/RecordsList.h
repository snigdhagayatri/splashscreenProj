//
//  RecordsList.h
//  DiveDeep
//
//  Created by ReddyBasha on 3/1/15.
//  Copyright (c) 2015 tech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecordsList : NSObject

@property (atomic, strong) NSMutableArray *allRecords;

+ (RecordsList *)recordsList;

@end
