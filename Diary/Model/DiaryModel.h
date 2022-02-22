//
//  DataModel.h
//  Diary
//
//  Created by Ed Chang on 2022/2/10.
//

#import <UIKit/UIKit.h>
#import <Mantle/Mantle.h>

NS_ASSUME_NONNULL_BEGIN

@interface DiaryInfo : MTLModel<MTLJSONSerializing, NSSecureCoding>

@property (nonatomic, nullable) NSNumber *diaryID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, nullable) NSData *imageData;

@end


@interface Diary : MTLModel<MTLJSONSerializing, NSSecureCoding>

@property (nonatomic, strong) NSMutableArray<DiaryInfo *> *diaries;

@end

NS_ASSUME_NONNULL_END
