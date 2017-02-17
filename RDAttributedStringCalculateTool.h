//
//  RDAttributedStringCalculateTool.h
//  RiceDonate
//
//  Created by ozr on 17/2/16.
//  Copyright © 2017年 ricedonate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDAttributedStringCalculateTool : NSObject

/**
 *  专门用来计算富文本的工具
 *
 *  @param string     任意字符串
 *  @param attributes 富文本参数
 *  @param size       控件的size
 *
 *  @return 工具
 */
+ (instancetype)toolWithString:(NSString *)string
                    attributes:(NSDictionary *)attributes
                          size:(CGSize)size;

- (instancetype)initWithString:(NSString *)string attributes:(NSDictionary *)attributes size:(CGSize)size;

@property (nonatomic, strong, readonly) NSAttributedString *richText;
@property (nonatomic, assign, readonly) CGFloat richTextHeight;

@end
