//
//  DropCommand.m
//  StarterGame
//
//  Created by csu on 4/10/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "DropCommand.h"

@implementation DropCommand

-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"drop";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
        [player drop:secondWord];
	}
	else {
        [player outputMessage:@"\nDrop what item?"];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe drop command is used to drop items in a room.\n\n\n";
}

@end