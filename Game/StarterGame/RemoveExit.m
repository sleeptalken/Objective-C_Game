//
//  RemoveExit.m
//  StarterGame
//
//  Created by Student2 on 3/28/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "RemoveExit.h"

@implementation RemoveExit

-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"removeexit";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
		[player removeExit:secondWord];
	}
	else {
        [player outputMessage:@"\nRemove which exit?"];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe remove command is used to remove an exit from one room.\n\nremoveExit <exit>\n";
}



@end
