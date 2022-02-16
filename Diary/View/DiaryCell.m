//
//  DiaryCell.m
//  Diary
//
//  Created by Ed Chang on 2022/2/9.
//

#import "DiaryCell.h"
#import "DiaryModel.h"

@implementation DiaryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont fontWithName:@"System" size:16.0f];
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.font = [UIFont fontWithName:@"System" size:12.0f];
        [self.contentView addSubview: _titleLabel];
        [self.contentView addSubview: _contentLabel];
        
        [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints: NO];
        
        [[self.titleLabel.topAnchor constraintEqualToAnchor: self.contentView.topAnchor constant:8] setActive:YES];
        [[self.titleLabel.leftAnchor constraintEqualToAnchor: self.contentView.leftAnchor constant:8] setActive:YES];
        [[self.titleLabel.rightAnchor constraintEqualToAnchor: self.contentView.rightAnchor constant:-8] setActive:YES];
        [[self.titleLabel.heightAnchor constraintEqualToConstant:30] setActive:YES];
        
        [self.contentLabel setTranslatesAutoresizingMaskIntoConstraints: NO];
        
        [[self.contentLabel.topAnchor constraintEqualToAnchor: self.titleLabel.bottomAnchor constant:4] setActive:YES];
        [[self.contentLabel.leftAnchor constraintEqualToAnchor: self.contentView.leftAnchor constant:8] setActive:YES];
        [[self.contentLabel.rightAnchor constraintEqualToAnchor: self.contentView.rightAnchor constant:-8] setActive:YES];
        [[self.contentLabel.bottomAnchor constraintEqualToAnchor: self.contentView.bottomAnchor constant:-8] setActive:YES];

    }
    return self;
}

- (void)configureCell: (DiaryInfo*) model {
    self.titleLabel.text = model.title;
    self.contentLabel.numberOfLines = 3;
    self.contentLabel.text = model.content;
}

@end
