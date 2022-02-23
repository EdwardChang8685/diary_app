//
//  DiaryInfoEntity+CoreDataProperties.m
//  Diary
//
//  Created by Ed Chang on 2022/2/23.
//
//

#import "DiaryInfoEntity+CoreDataProperties.h"

@implementation DiaryInfoEntity (CoreDataProperties)

+ (NSFetchRequest<DiaryInfoEntity *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DiaryInfoEntity"];
}

@dynamic content;
@dynamic diaryId;
@dynamic imageData;
@dynamic title;
@dynamic createdTime;
@dynamic updatedTime;

@end
