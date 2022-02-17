//
//  DiaryCell.h
//  Diary
//
//  Created by Ed Chang on 2022/2/9.
//

#import <UIKit/UIKit.h>
#import"DiaryModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DiaryCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong, nullable) UIImageView *diaryImageView;

- (void)configureCell: (DiaryInfo*) model;

@end

NS_ASSUME_NONNULL_END
