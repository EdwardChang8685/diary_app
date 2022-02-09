//
//  ViewController.h
//  Diary
//
//  Created by Ed Chang on 2022/2/8.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray *content;

@end
