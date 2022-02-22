//
//  DiaryInfoEntity+CoreDataProperties.m
//  Diary
//
//  Created by Ed Chang on 2022/2/21.
//
//

#import "DiaryInfoEntity+CoreDataProperties.h"

@implementation DiaryInfoEntity (CoreDataProperties)

+ (NSFetchRequest<DiaryInfoEntity *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DiaryInfoEntity"];
}

@dynamic content;
@dynamic imageData;
@dynamic title;
@dynamic id;

@end
