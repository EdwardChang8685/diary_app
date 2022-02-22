//
//  DiaryInfoEntity+CoreDataProperties.h
//  Diary
//
//  Created by Ed Chang on 2022/2/21.
//
//

#import "DiaryInfoEntity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DiaryInfoEntity (CoreDataProperties)

+ (NSFetchRequest<DiaryInfoEntity *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nullable, nonatomic, copy) NSString *content;
@property (nullable, nonatomic, retain) NSData *imageData;
@property (nullable, nonatomic, copy) NSString *title;
@property (nonatomic) int64_t id;

@end

NS_ASSUME_NONNULL_END
