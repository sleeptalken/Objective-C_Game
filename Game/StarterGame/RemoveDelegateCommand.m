//
//  RemoveDelegateCommand.m
//  StarterGame
//
//  Created by Student2 on 4/9/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "RemoveDelegateCommand.h"

@implementation RemoveDelegateCommand

-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"removedelegate";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
        [player outputMessage:@"\nI cannot remove that delegate"];
	}
	else {
        [player removeDelegate];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe removedelegate command is used to remove the delegate from the current room.\n\nremovedelegate\n";
}

@end
