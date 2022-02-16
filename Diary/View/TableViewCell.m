//
//  TableViewCell.m
//  Diary
//
//  Created by Ed Chang on 2022/2/16.
//

#import "TableViewCell.h"
#import "DiaryModel.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureCell: (DiaryInfo*) model {
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.content;
}

+ (NSString *) identifier {
    return [self description];
}

@end
