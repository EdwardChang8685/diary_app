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
        self.diaryImageView = [[UIImageView alloc] init];
        [self.contentView addSubview: _titleLabel];
        [self.contentView addSubview: _contentLabel];
        [self.contentView addSubview: _diaryImageView];
        
        [self.diaryImageView setTranslatesAutoresizingMaskIntoConstraints: NO];
        self.diaryImageView.contentMode = UIViewContentModeScaleAspectFit;
        [[self.diaryImageView.topAnchor constraintGreaterThanOrEqualToAnchor: self.contentView.topAnchor constant:8] setActive:YES];
        [[self.diaryImageView.bottomAnchor constraintLessThanOrEqualToAnchor: self.contentView.bottomAnchor constant:-8] setActive:YES];
        [[self.diaryImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor] setActive:YES];
        [[self.diaryImageView.rightAnchor constraintEqualToAnchor: self.contentView.rightAnchor constant:-8] setActive:YES];
        [[self.diaryImageView.heightAnchor constraintEqualToConstant: 80] setActive:YES];
        [[self.diaryImageView.widthAnchor constraintEqualToAnchor:self.diaryImageView.heightAnchor multiplier:1] setActive:YES];
        
        [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints: NO];
        [[self.titleLabel.topAnchor constraintEqualToAnchor: self.contentView.topAnchor constant:8] setActive:YES];
        [[self.titleLabel.leftAnchor constraintEqualToAnchor: self.contentView.leftAnchor constant:8] setActive:YES];
        [[self.titleLabel.rightAnchor constraintEqualToAnchor: self.diaryImageView.leftAnchor constant:-8] setActive:YES];
        [[self.titleLabel.heightAnchor constraintEqualToConstant:30] setActive:YES];
        
        [self.contentLabel setTranslatesAutoresizingMaskIntoConstraints: NO];
        [[self.contentLabel.topAnchor constraintEqualToAnchor: self.titleLabel.bottomAnchor constant:4] setActive:YES];
        [[self.contentLabel.leftAnchor constraintEqualToAnchor: self.contentView.leftAnchor constant:8] setActive:YES];
        [[self.contentLabel.rightAnchor constraintEqualToAnchor: self.diaryImageView.leftAnchor constant:-8] setActive:YES];
        [[self.contentLabel.bottomAnchor constraintLessThanOrEqualToAnchor: self.contentView.bottomAnchor constant:-8] setActive:YES];
    }
    return self;
}

- (void)configureCell: (DiaryInfo*) model {
    self.titleLabel.text = model.title;
    self.contentLabel.numberOfLines = 3;
    self.contentLabel.text = model.content;
    UIImage *image = [UIImage imageWithData:model.imageData];
    self.diaryImageView.image = image;
}

@end
