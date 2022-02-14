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

#pragma mark - NSSecureCoding

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    self = [super init];
    if (self) {
        self.diaryID = [coder decodeObjectForKey:@"id"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.content = [coder decodeObjectForKey:@"content"];

    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.diaryID forKey:@"id"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.content forKey:@"content"];
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

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    self = [super init];
    if (self) {
        self.diaries = [coder decodeObjectForKey:@"diaries"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.diaries forKey:@"diaries"];
}

@end
