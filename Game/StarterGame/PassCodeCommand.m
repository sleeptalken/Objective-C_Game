//
//  PassCodeCommand.m
//  StarterGame
//
//  Created by Student1 on 4/4/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "PassCodeCommand.h"

@implementation PassCodeCommand

-(id)init
{
	self = [super init];
    if (nil != self) {
        name = @"passcode";
    }
    return self;
}

-(BOOL)execute:(Player *)player
{
	if ([self hasThirdWord]) {
		[player passCode:[self thirdWord] forExit:[self secondWord]];
	}
	else {
        if ([self hasSecondWord]){
            [player outputMessage:@"\nYou forgot the passcode."];
        } else{
            [player outputMessage:@"\nPassCode for which exit?"];
        }
        
	}
	return NO;
}

-(NSString *)description
{
    return @"\nThe passcode command is used to remove a force field from one exit.\n\npasscode <exit>\n";
}


@end
