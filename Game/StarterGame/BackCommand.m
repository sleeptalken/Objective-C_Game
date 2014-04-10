//
//  BackCommand.m
//  StarterGame
//
//  Created by csu on 4/9/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "BackCommand.h"

@implementation BackCommand

-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"back";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
        [player outputMessage:@"\nJust say 'back'"];
	}
	else {
		[player back];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe back command is used to move back to the previous room.\n\n\n";
}

@end