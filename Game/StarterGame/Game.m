//
//  Game.m
//  StarterGame
//
//  Created by Rodrigo A. Obando on 3/7/12.
//  Copyright 2012 Columbus State University. All rights reserved.
//
//  Modified by Rodrigo A. Obando on 3/7/13.

#import "Game.h"
#import "GameWorld.h"


@implementation Game

@synthesize parser;
@synthesize player;

-(id)initWithGameIO:(GameIO *)theIO
{
	self = [super init];
	if (nil != self) {
		[self setParser:[[[Parser alloc] init] autorelease]];
		[self setPlayer:[[[Player alloc] initWithRoom:[[GameWorld sharedInstance] entrance] andIO:theIO] autorelease]];
        playing = NO;
	}
	return self;
}
-(void)start
{
    playing = YES;
    [player outputMessage:[self welcome]];
    //Cheat Codes
    //[self execute:@"go west"];
    //[self execute:@"go west"];
    //[self execute:@"go west"];
}

-(void)end
{
    [player outputMessage:[self goodbye]];
    playing = NO;
}

-(BOOL)execute:(NSString *)commandString
{
	BOOL finished = NO;
    if (playing) {
        [player outputMessage:[NSString stringWithFormat:@">%@",commandString]];
        Command *command = [parser parseCommand:commandString];
        if (command) {
            finished = [command execute:player];
        }
        else {
            [player outputMessage:@"\nI don't understand..."];
        }
    }
    return finished;
}

-(NSString *)welcome
{
	NSString *message = @"Welcome to the World of CSU!\nThe World of CSU is a new, incredibly boring adventure game.\nType 'help' if you need help.";
	return [NSString stringWithFormat:@"\n\n%@\n%@", message, [player currentRoom]];
}

-(NSString *)goodbye
{
    return @"\nThank you for playing, Goodbye.\n";
}

-(void)dealloc
{
	[parser release];
	[player release];
	
	[super dealloc];
}

@end
