//
//  DiaryDetailViewController.m
//  Diary
//
//  Created by Ed Chang on 2022/2/10.
//

#import "DiaryDetailViewController.h"

@interface DiaryDetailViewController ()

@end

@implementation DiaryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureNavigation];
    [self setTextField];
    [self setTextView];
    [self showDiaryInfo];
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
    DiaryInfo *diary = [[DiaryInfo alloc] init];
    diary.diaryID = @1;
    diary.title = self.textField.text;
    diary.content = self.textView.text;
    
    self.diary = diary;
    
    NSLog(@"%@",self.textField.text);
    NSLog(@"%@",self.textView.text);
    NSLog(@"%@",self.diary.title);
    NSLog(@"%@",self.diary.content);
    
    if (self.indexpath) {
        [self.delegate editDiaryInfo: self.diary andAtRow:self.indexpath];
        
    } else {
        [self.delegate AddDiaryInfo: self.diary];
    }
    //    self.editBlock(self.diary);
    
    [self dismissViewControllerAnimated: YES completion: NULL];
}

- (void)setTextField {
    
    self.textField = [[UITextField alloc]init];
    [self.view addSubview: self.textField];
    self.textField.delegate = self;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Input Note Title Here!";
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
    [self.view addSubview: self.textView];
    self.textView.delegate = self;
    self.textView.text = @"Input Content Here!";
    self.textView.backgroundColor = [UIColor systemGray6Color];
    [self.textView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [[self.textView.topAnchor constraintEqualToAnchor: self.textField.bottomAnchor constant:30] setActive:YES];
    [[self.textView.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor constant:20] setActive:YES];
    [[self.textView.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor constant:-20] setActive:YES];
    [[self.textView.bottomAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor constant:0] setActive:YES];
}

- (void)showDiaryInfo {
    if (self.diary) {
        self.textField.text = self.diary.title;
        self.textView.text = self.diary.content;
    }
}

# pragma mark - TableView Delegate

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.diary.title = textField.text;
}

- (void)textViewDidChange:(UITextView *)textView {
    self.diary.content = textView.text;
}

@synthesize delegate;

@end
