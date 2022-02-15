//
//  DiaryDetailViewController.h
//  Diary
//
//  Created by Ed Chang on 2022/2/10.
//

#import <UIKit/UIKit.h>
#import "DiaryModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DiaryDetailVCDelegate <NSObject>
- (void) editDiaryInfo:(DiaryInfo*) diary andAtRow:(NSIndexPath*) indexpath;
- (void) AddDiaryInfo:(DiaryInfo*) diary;
@end

@interface DiaryDetailViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) UITextField *textField;
    
@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) DiaryInfo *diary;

@property (nonatomic, strong) NSIndexPath *indexpath;

@property (nonatomic, weak) id <DiaryDetailVCDelegate> delegate;

@property (nonatomic, copy, nonnull) void (^editBlock)(DiaryInfo*);

@end



NS_ASSUME_NONNULL_END
