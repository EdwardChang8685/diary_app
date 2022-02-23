//
//  DiaryInfoEntity+CoreDataProperties.h
//  Diary
//
//  Created by Ed Chang on 2022/2/23.
//
//

#import "DiaryInfoEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DiaryInfoEntity (CoreDataProperties)

+ (NSFetchRequest<DiaryInfoEntity *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nullable, nonatomic, copy) NSString *content;
@property (nonatomic) int64_t diaryId;
@property (nullable, nonatomic, retain) NSData *imageData;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSDate *createdTime;
@property (nullable, nonatomic, copy) NSDate *updatedTime;

@end

NS_ASSUME_NONNULL_END
