//
//  DataModel.h
//  Diary
//
//  Created by Ed Chang on 2022/2/10.
//

#import <UIKit/UIKit.h>
#import "Mantle.h"

NS_ASSUME_NONNULL_BEGIN

@interface DiaryInfo : MTLModel<MTLJSONSerializing>

@property (nonatomic, assign) NSNumber *diaryID;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *content;

@end


@interface Diary : MTLModel<MTLJSONSerializing>

@property (nonatomic, retain) DiaryInfo *diaries;

@end

NS_ASSUME_NONNULL_END
