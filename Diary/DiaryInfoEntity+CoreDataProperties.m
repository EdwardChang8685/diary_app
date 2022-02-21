//
//  DiaryInfoCoreData+CoreDataProperties.m
//  
//
//  Created by Ed Chang on 2022/2/21.
//
//

#import "DiaryInfoEntity+CoreDataProperties.h"

@implementation DiaryInfoEntity (CoreDataProperties)

+ (NSFetchRequest<DiaryInfoEntity *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DiaryInfoCoreData"];
}

@dynamic content;
@dynamic id;
@dynamic imageData;
@dynamic title;

@end
