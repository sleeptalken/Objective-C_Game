//
//  ItemsCommand.m
//  StarterGame
//
//  Created by csu on 4/10/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "ItemsCommand.h"

@implementation ItemsCommand

-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"items";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
        [player outputMessage:@"\nJust say 'items'"];
	}
	else {
        [player showItems];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe drop command is used to drop items in a room.\n\n\n";
}

@end