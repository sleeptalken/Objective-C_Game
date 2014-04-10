//
//  PortalCommand.m
//  StarterGame
//
//  Created by Student1 on 4/11/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "PortalCommand.h"


@implementation PortalCommand

-(id)init
{
	self = [super init];
    
    if (nil != self) {
        name = @"portal";
    }
    
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
        [player outputMessage:[NSString stringWithFormat:@"\nI can not portal to %@", secondWord]];
	}
    else {
        [player portal];
    }
	return NO;
}

-(NSString *)description
{
    return @"\nThe portal command is used to save a \nreference to the room or return to the room.\n\n";
}

@end