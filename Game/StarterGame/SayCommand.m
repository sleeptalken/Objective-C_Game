//
//  SayCommand.m
//  StarterGame
//
//  Created by Student2 on 3/21/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "SayCommand.h"

@implementation SayCommand


-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"say";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
		[player say:secondWord];
	}
	else {
        [player outputMessage:@"\nSay what?"];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe say command is used to blah blah blah in the room.\nsay <word>\n\n";
}

@end
