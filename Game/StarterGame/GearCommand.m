//
//  GearCommand.m
//  StarterGame
//
//  Created by William Christian on 4/12/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//
#import "GearCommand.h"

@implementation GearCommand

-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"gear";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
        [player outputMessage:@"Just say 'gear' to show the items you are currently wearing."];
	}
	else {
        [player showGear];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe gear command is used to show what items you are currently wearing.\n\n\n";
}

@end