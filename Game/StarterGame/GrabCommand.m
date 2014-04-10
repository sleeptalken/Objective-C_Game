//
//  GrabCommand.m
//  StarterGame
//
//  Created by csu on 4/10/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "GrabCommand.h"

@implementation GrabCommand

-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"grab";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
        [player grab:secondWord];
	}
	else {
		[player outputMessage:@"\nGrab what item?"];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe grab command is used to grab items that are present in the room.\n\n\n";
}

@end