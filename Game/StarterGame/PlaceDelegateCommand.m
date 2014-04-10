//
//  PlaceDelegateCommand.m
//  StarterGame
//
//  Created by Student2 on 4/9/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "PlaceDelegateCommand.h"

@implementation PlaceDelegateCommand

-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"placedelegate";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
        [player outputMessage:@"\nI cannot place that delegate there."];
	}
	else {
        [player removeDelegate];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe placedelegate command is used to place the delegate from the current room.\n\nplacedelegate\n";
}

@end
