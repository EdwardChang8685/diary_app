//
//  DiaryDetailViewController.m
//  Diary
//
//  Created by Ed Chang on 2022/2/10.
//

#import "DiaryDetailViewController.h"

#define  textFieldPlaceHolder @"Input Note Title Here!"
#define  textViewPlaceHolder @"Input Content Here!"

@interface DiaryDetailViewController ()

@end

@implementation DiaryDetailViewController

# pragma mark - VC Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self registerKeyboardNotification];
    [self configureNavigation];
    [self setScrollView];
    [self setTextField];
    [self setTextView];
    [self checkDiaryMode];
    [self setPlaceHolder];
}

- (void)dealloc {
    
    [self unregisterKeyboardNotification];
}

# pragma mark - Methods

- (void)registerKeyboardNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillShow:) name: UITextViewTextDidBeginEditingNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillHide:) name: UIKeyboardWillHideNotification object: nil];
}

- (void)unregisterKeyboardNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver: self name: UITextViewTextDidBeginEditingNotification object: nil];
    [[NSNotificationCenter defaultCenter] removeObserver: self name: UIKeyboardWillHideNotification object: nil];
}

- (void)checkDiaryMode {
    
    self.isNewDiary = !self.diary ? YES : NO;
    if(!self.isNewDiary) {
        self.textField.text = self.diary.title;
        self.textView.text = self.diary.content;
    }
}

- (void)configureNavigation {
    
    self.title = @"Add New Note";
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle: @"Done"
                                   style: UIBarButtonItemStylePlain
                                   target: self
                                   action: @selector(completeEdition:)];
    
    
    self.navigationItem.rightBarButtonItem = doneButton;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle: @"Back"
                                   style: UIBarButtonItemStylePlain
                                   target: self
                                   action: @selector(dismissVC)];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
}
- (void) dismissVC {
    
    [self dismissViewControllerAnimated: YES completion: NULL];
}

- (void)completeEdition:(id)sender {
    
    if (self.isNewDiary) {
        DiaryInfo *diary = [[DiaryInfo alloc] init];
        diary.title = self.textField.text;
        diary.content = self.textView.text;
        [self.delegate AddDiaryInfo: diary];
    } else {
        self.diary.title = self.textField.text;
        self.diary.content = self.textView.text;
        [self.delegate editDiaryInfo: self.diary andAtRow:self.indexpath];
    }
    
    [self dismissViewControllerAnimated: YES completion: NULL];
}

- (void)setScrollView {
    
    self.scrollView = [[UIScrollView alloc]initWithFrame: self.view.bounds];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: self.scrollView];
}

- (void)setTextField {
    
    self.textField = [[UITextField alloc]init];
    [self.scrollView addSubview: self.textField];
    self.textField.delegate = self;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = textFieldPlaceHolder;
    self.textField.text = self.diary.title;
    [self.textField setTranslatesAutoresizingMaskIntoConstraints: NO];
    [[self.textField.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant:30] setActive:YES];
    [[self.textField.leadingAnchor constraintGreaterThanOrEqualToAnchor: self.view.leadingAnchor constant:30] setActive:YES];
    [[self.textField.trailingAnchor constraintGreaterThanOrEqualToAnchor: self.view.trailingAnchor constant:-30] setActive:YES];
    [[self.textField.heightAnchor constraintEqualToConstant:30] setActive: YES];
    [[self.textField.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor]setActive:YES];
}

- (void)setTextView {

    self.textView = [[UITextView alloc]init];
    [self.scrollView addSubview: self.textView];
    self.textView.delegate = self;
    self.textView.font = [UIFont systemFontOfSize: 14.0f];
    self.textView.backgroundColor = [UIColor systemGray6Color];
    [self.textView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [[self.textView.topAnchor constraintEqualToAnchor: self.textField.bottomAnchor constant:30] setActive:YES];
    [[self.textView.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor constant:20] setActive:YES];
    [[self.textView.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor constant:-20] setActive:YES];
    [[self.textView.bottomAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor constant:0] setActive:YES];
}

- (void)setPlaceHolder {
    
    if (self.isNewDiary) {
        UILabel *placeHolder = [[UILabel alloc]init];
        self.placeHolderLabel = placeHolder;
        placeHolder.text = textViewPlaceHolder;
        placeHolder.textColor = [UIColor systemGrayColor];
        [self.textView addSubview: placeHolder];
        [placeHolder setTranslatesAutoresizingMaskIntoConstraints: NO];
        [[placeHolder.topAnchor constraintEqualToAnchor: self.textView.topAnchor] setActive: YES];
        [[placeHolder.leadingAnchor constraintEqualToAnchor:  self.textView.leadingAnchor constant: 8] setActive: YES];
        [[placeHolder.trailingAnchor constraintEqualToAnchor:  self.textView.trailingAnchor constant: -8] setActive: YES];
        [[placeHolder.heightAnchor constraintEqualToConstant: 30] setActive: YES];
    }
}

- (void)keyboardWillShow:(NSNotification *)notification {
//    NSDictionary *keyboardInfo = [notification userInfo];
//    CGFloat keyboardHeight = [[keyboardInfo objectForKey: UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
//    if(self.isEditingTextView) {
    [UIView animateWithDuration: 0.3 animations:^{
        CGRect frame = self.view.frame;
//        frame.origin.y = -keyboardHeight;
        frame.origin.y = -80;
        self.view.frame = frame;
    }];
//    }
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0, 0, 80, 0);
    self.scrollView.scrollIndicatorInsets = contentInsets;
    self.scrollView.scrollEnabled = YES;
}

- (void)keyboardWillHide:(NSNotification *)notification {
    
    [UIView animateWithDuration: 0.3 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = 0.0f;
        self.view.frame = frame;
    }];
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0, 0, -80, 0);
    self.scrollView.scrollIndicatorInsets = contentInsets;
    self.scrollView.scrollEnabled = NO;
}

# pragma mark - TextFiled & TextView Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textView becomeFirstResponder];
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.isEditingTextView = YES;
    NSLog(@"TextView did begin editing");
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    self.isEditingTextView = NO;
    self.diary.content = textView.text;
    [textView resignFirstResponder];
}

- (void)textViewDidChange:(UITextView *)textView {
    if (!textView.text.length) {
        self.placeHolderLabel.alpha = 1;
    } else {
        self.placeHolderLabel.alpha = 0;
    }
}

@end
