//
//  NSString+LoremIpsum.h
//  Scroll Test
//
//  Created by Timothy Donnelly on 1/18/13.
//  Copyright (c) 2013 Tim Donnelly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LoremIpsum)

+ (NSString *)loremIpsum;
+ (NSString *)loremIpsumWithWords:(NSInteger)words;
+ (NSString *)loremIpsumWithSentences:(NSInteger)sentences;
+ (NSString *)loremIpsumWithParagraphs:(NSInteger)paragraphs;

@end
