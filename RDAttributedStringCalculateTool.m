//
//  RDAttributedStringCalculateTool.m
//  RiceDonate
//
//  Created by ozr on 17/2/16.
//  Copyright © 2017年 ricedonate. All rights reserved.
//

#import "RDAttributedStringCalculateTool.h"

@implementation RDAttributedStringCalculateTool

+ (instancetype)toolWithString:(NSString *)string attributes:(NSDictionary *)attributes size:(CGSize)size
{
    RDAttributedStringCalculateTool *tool = [[self alloc] initWithString:string attributes:attributes size:size];
    return tool;
}

- (instancetype)initWithString:(NSString *)string attributes:(NSDictionary *)attributes size:(CGSize)size
{
    if (self = [self init]) {
        NSParagraphStyle *style = attributes[NSParagraphStyleAttributeName];
        NSMutableParagraphStyle *mutableStyle = [self mutalbeStyleWithStyle:style];
        UIFont *font = attributes[NSFontAttributeName];
        NSParameterAssert(font);
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:attributes];
        CGFloat strHeight = [attributedString boundingRectWithSize:size
                                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                           context:nil].size.height;
        //如果一行，则需要矫正系统bug
        if (strHeight / font.lineHeight < 2 && style) {
            mutableStyle.lineSpacing = 0;
            [attributedString addAttribute:NSParagraphStyleAttributeName
                                     value:mutableStyle
                                     range:NSMakeRange(0, string.length)];
        }
        
        _richTextHeight = [attributedString boundingRectWithSize:size
                                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                         context:nil].size.height;
        _richText = attributedString;
    }
    
    return self;
}

- (NSMutableParagraphStyle *)mutalbeStyleWithStyle:(NSParagraphStyle *)style
{
    if (!style) {
        return [NSMutableParagraphStyle new];
    }
    
    NSMutableParagraphStyle *mutableStyle = [NSMutableParagraphStyle new];
    mutableStyle.lineSpacing = style.lineSpacing;
    mutableStyle.paragraphSpacing = style.paragraphSpacing;
    mutableStyle.alignment = style.alignment;
    mutableStyle.firstLineHeadIndent = style.firstLineHeadIndent;
    mutableStyle.headIndent = style.headIndent;
    mutableStyle.tailIndent = style.tailIndent;
    mutableStyle.lineBreakMode = style.lineBreakMode;
    mutableStyle.minimumLineHeight = style.minimumLineHeight;
    mutableStyle.maximumLineHeight = style.maximumLineHeight;
    mutableStyle.baseWritingDirection = style.baseWritingDirection;
    mutableStyle.lineHeightMultiple = style.lineHeightMultiple;
    mutableStyle.paragraphSpacingBefore = style.paragraphSpacingBefore;
    mutableStyle.hyphenationFactor = style.hyphenationFactor;
    mutableStyle.tabStops = style.tabStops;
    mutableStyle.defaultTabInterval = style.defaultTabInterval;
    mutableStyle.allowsDefaultTighteningForTruncation = style.allowsDefaultTighteningForTruncation;
    return mutableStyle;
    
}

@end
