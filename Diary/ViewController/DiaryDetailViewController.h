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

@property (strong, nonatomic) UIScrollView *scrollView;

@property (nonatomic, strong) UITextField *textField;
    
@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *placeHolderLabel;

@property (nonatomic, strong) DiaryInfo *diary;

@property (nonatomic, strong) NSIndexPath *indexpath;

@property (nonatomic, weak) id <DiaryDetailVCDelegate> delegate;

@property (nonatomic, assign) BOOL isNewDiary;

@property (nonatomic, assign) BOOL isEditingTextView;

@end



NS_ASSUME_NONNULL_END
