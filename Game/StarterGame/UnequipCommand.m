//
//  UnequipCommand.m
//  StarterGame
//
//  Created by William Christian on 4/12/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "UnequipCommand.h"

@implementation UnequipCommand

-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"unequip";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
        [player unequipItem:secondWord];
	}
	else {
		[player outputMessage:@"\nUnequip what item?"];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe unequip command is used to unequip an equipable item from your body.\n\n\n";
}

@end