//
//  InventoryCommand.m
//  StarterGame
//
//  Created by csu on 4/10/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "WeightCommand.h"

@implementation WeightCommand

-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"weight";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
        [player outputMessage:@"Just say 'weight' to show your current weight."];
	}
	else {
        [player showWeight];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe weight command is used to show how much weight you are carrying in your inventory.\n\n\n";
}

@end