//
//  EquipCommand.m
//  StarterGame
//
//  Created by William Christian on 4/12/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "EquipCommand.h"

@implementation EquipCommand

-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"equip";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
        [player equipItem:secondWord];
	}
	else {
		[player outputMessage:@"\nEquip what item?"];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe equip command is used to equip an equipable item from your inventory.\n\n\n";
}

@end