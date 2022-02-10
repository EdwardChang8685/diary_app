//
//  ViewController.h
//  Diary
//
//  Created by Ed Chang on 2022/2/8.
//

#import <UIKit/UIKit.h>
#import "DiaryModel.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray<DiaryInfo *> *diaries;

@property (strong, nonatomic) NSDictionary *dict;

@end
