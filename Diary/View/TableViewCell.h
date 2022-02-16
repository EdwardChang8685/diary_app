//
//  TableViewCell.h
//  Diary
//
//  Created by Ed Chang on 2022/2/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

+ (NSString *) identifier;

@end

NS_ASSUME_NONNULL_END
