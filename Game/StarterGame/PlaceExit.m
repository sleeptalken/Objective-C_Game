//
//  PlaceExit.m
//  StarterGame
//
//  Created by Student2 on 3/28/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "PlaceExit.h"

@implementation PlaceExit


-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"placeexit";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasSecondWord]) {
		[player placeExit:secondWord];
	}
	else {
        [player outputMessage:@"\nPlace which exit?"];
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe place command is used to place a exit from one room.\n\nplaceexit <exit>\n";
}

@end
