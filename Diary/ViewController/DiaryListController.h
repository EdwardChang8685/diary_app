//
//  ViewController.h
//  Diary
//
//  Created by Ed Chang on 2022/2/8.
//

#import <UIKit/UIKit.h>
#import "DiaryDetailViewController.h"
#import "DiaryModel.h"

@interface DiaryListController : UIViewController <UITableViewDelegate, UITableViewDataSource, DiaryDetailVCDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray<DiaryInfo *> *diaries;

@property (strong, nonatomic) NSDictionary *dict;

@end
