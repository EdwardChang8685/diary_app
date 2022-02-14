//
//  DiaryDetailViewController.h
//  Diary
//
//  Created by Ed Chang on 2022/2/10.
//

#import <UIKit/UIKit.h>
#import "DiaryModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface DiaryDetailViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) UITextField *textField;
    
@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) DiaryInfo *diary;

@property (nonatomic, assign) BOOL isCreatMode;

@property (nonatomic, copy, nonnull) DiaryInfo * (^Block)(DiaryInfo*);
@end

NS_ASSUME_NONNULL_END
