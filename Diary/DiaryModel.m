//
//  DataModel.m
//  Diary
//
//  Created by Ed Chang on 2022/2/10.
//

#import "DiaryModel.h"

@implementation DiaryInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
        @"diaryID" : @"id",
        @"title" : @"title",
        @"content" : @"content"
    };
    // key for model name, value for JSON key
}

+ (BOOL)supportsSecureCoding
{
    return YES;
}

@end


@implementation Diary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
        @"diaries" : @"data.diaries"
    };
}

+ (NSValueTransformer *)diariesJSONTransformer {
    
    return [MTLJSONAdapter arrayTransformerWithModelClass:[DiaryInfo class]];
}

+ (BOOL)supportsSecureCoding
{
    return YES;
}

@end
