//
//  InventoryCommand.m
//  StarterGame
//
//  Created by csu on 4/10/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "InventoryCommand.h"

@implementation InventoryCommand

-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"inventory";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
        [player outputMessage:@"\nJust say 'item'"];
	}
	else {
        [player showInventory];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe inventory command is used to look at the items in your inventory.\n\n\n";
}

@end