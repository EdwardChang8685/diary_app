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
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureNavigation];
    [self setTextField];
    [self setTextView];
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
                                   action: @selector(completeEdition:)];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
}
- (void) dismissVC {
    [self dismissViewControllerAnimated: YES completion: NULL];
}

- (void)completeEdition:(id)sender {
    [self dismissViewControllerAnimated: YES completion: NULL];
}

- (void)setTextField {
    UITextField *textField = [[UITextField alloc] init];
    [self.view addSubview: textField];
    textField.delegate = self;
    textField.text = @"Input Note Title Here!";
    [self.view setTranslatesAutoresizingMaskIntoConstraints: NO];
    [[textField.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant:30] setActive:YES];
    [[textField.leadingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.leadingAnchor constant:30] setActive:YES];
    [[textField.trailingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.trailingAnchor constant:30] setActive:YES];
    [[textField.bottomAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor constant:0] setActive:YES];
}

- (void)setTextView {
    UITextView *textView = [[UITextView alloc]init];
    [self.view addSubview: textView];
    textView.delegate = self;
    textView.text = @"Input Note Title Here!";
    [self.view setTranslatesAutoresizingMaskIntoConstraints: NO];
    [[textView.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant:30] setActive:YES];
    [[textView.leadingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.leadingAnchor constant:30] setActive:YES];
    [[textView.trailingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.trailingAnchor constant:30] setActive:YES];
    [[textView.bottomAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.bottomAnchor constant:0] setActive:YES];
}

@end
