//
//  NSString+LoremIpsum.m
//  Scroll Test
//
//  Created by Timothy Donnelly on 1/18/13.
//  Copyright (c) 2013 Tim Donnelly. All rights reserved.
//

#import "NSString+LoremIpsum.h"

@implementation NSString (LoremIpsum)

+ (NSString *)loremIpsum
{
	return [[self class] loremIpsumWithParagraphs:1];
}

+ (NSString *)loremIpsumWithWords:(NSInteger)words
{
	return [[self class] loremIpsumWithWords:words insertComma:NO];
}

+ (NSString *)loremIpsumWithWords:(NSInteger)words insertComma:(BOOL)insertComma
{
	static NSArray *loremIpsumWords;
	if (!loremIpsumWords)
	{
		loremIpsumWords = @[
			@"duis",
			@"mollis",
			@"est",
			@"non",
			@"commodo",
			@"luctus",
			@"nisi",
			@"erat",
			@"porttitor",
			@"ligula",
			@"eget",
			@"lacinia",
			@"odio",
			@"sem",
			@"nec",
			@"elit",
			@"consectetur",
			@"adipiscing",
			@"elit",
			@"nulla",
			@"vitae",
			@"elit",
			@"libero",
			@"a",
			@"pharetra",
			@"augue",
			@"aenean",
			@"lacinia",
			@"bibendum",
			@"nulla",
			@"sed",
			@"consectetur",
			@"nullam",
			@"id",
			@"dolor",
			@"nibh",
			@"ultricies",
			@"vehicula",
			@"ut",
			@"id",
			@"elit",
		];
	}
	NSMutableString *str = [[NSMutableString alloc] init];
	
	NSInteger commaIndex = words/2;
	
	for (int i=0; i < words; i++)
	{
		NSInteger wordIndex = arc4random() % [loremIpsumWords count];
		NSString *word = [loremIpsumWords objectAtIndex:wordIndex];
		[str appendString:word];
		
		if (insertComma && commaIndex == i)
		{
			[str appendString:@","];
		}
		
		if (i < words-1)
		{
			[str appendString:@" "];
		}
	}
	[str replaceCharactersInRange:NSMakeRange(0,1) withString:[[str substringToIndex:1] uppercaseString]];
	return str;
}

+ (NSString *)loremIpsumWithSentences:(NSInteger)sentences useDefaultFirstSentence:(BOOL)useDefaultFirstSentence
{	
	static NSString *firstSentence;
	if (!firstSentence)
	{
		firstSentence = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
	}
	NSMutableString *str = [[NSMutableString alloc] init];
	
	if (useDefaultFirstSentence)
	{
		[str appendString:firstSentence];
		if (sentences > 1)
		{
			[str appendString:@" "];
			sentences -= 1;
		}
	}
	
	for (int i=0; i < sentences; i++)
	{
		int sentenceLength = 8 + (arc4random() % 12);
		[str appendString:[self loremIpsumWithWords:sentenceLength insertComma:(sentenceLength > 14)]];
		[str appendString:@"."];
		if (i < sentences - 1)
		{
			[str appendString:@" "];
		}
	}
	return str;
}

+ (NSString *)loremIpsumWithSentences:(NSInteger)sentences
{
	return [self loremIpsumWithSentences:sentences useDefaultFirstSentence:YES];
}

+ (NSString *)loremIpsumWithParagraphs:(NSInteger)paragraphs
{
	NSMutableString *str = [[NSMutableString alloc] init];
	for (int i=0; i<paragraphs; i++)
	{
		int paragraphLength = 3 + (arc4random() % 3);
		[str appendString:[self loremIpsumWithSentences:paragraphLength useDefaultFirstSentence:(i == 0 ? YES : NO)]];
		if (i < paragraphs-1 || YES)
		{
			[str appendString:@"\r\n"];
		}
	}
	return str;
}

@end
