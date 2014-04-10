//
//  Room.m
//  StarterGame
//
//  Created by Rodrigo A. Obando on 3/7/12.
//  Copyright 2012 Columbus State University. All rights reserved.
//

#import "Room.h"


@implementation Room

@synthesize tag;
@synthesize delegate;

-(id)init
{
	return [self initWithTag:@"No Tag"];
}

-(id)initWithTag:(NSString *)newTag
{
	self = [super init];
    
	if (nil != self) {
		[self setTag:newTag];
		exits = [[NSMutableDictionary alloc] initWithCapacity:10];
        [self setDelegate:nil];
        items = [[NSMutableDictionary alloc] initWithCapacity:10];
	}
    
	return self;
}

-(void)setExit:(NSString *)exit toRoom:(Room *)room
{
	[exits setObject:room forKey:exit];
}

-(Room *)getExit:(NSString *)exit
{
	return [exits objectForKey:exit];
}

-(Room *)removeExit:(NSString *)exit
{
    Room *tempRoom = [exits objectForKey:exit];
    if(tempRoom)
    {
        [tempRoom retain];
        [exits removeObjectForKey:exit];
    }
    return [tempRoom autorelease];
}

-(NSString *)getExits
{
	NSArray *exitNames = [exits allKeys];
	return [NSString stringWithFormat:@"Exits: %@", [exitNames componentsJoinedByString:@" "]];
}

-(Item *)returnItemFromRoom:(NSString *)theItem
{
    Item *temp = (Item *)[items objectForKey:theItem];
    if(temp) {
        [temp retain];
    }
    return [temp autorelease];
}

-(void)removeItemFromRoom:(NSString *)theItem
{
    [items removeObjectForKey:theItem];
}

-(void)placeItemInRoom:(Item *)theItem
{
    [items setObject:theItem forKey:[theItem name]];
}

-(NSArray *)showAllKeys
{
    NSArray *roomItems = [items allKeys];
    return roomItems;
}

-(void)say:(NSString *)word fromRoom:(Room *)room
{
    
}

-(void)say:(NSString *)word
{
    if(delegate)
    {
        [delegate say:word fromRoom:self];
    }
    else
    {
        NSMutableDictionary *userinfo = [[NSMutableDictionary alloc] initWithCapacity:10];
        [userinfo setObject:word forKey:@"sound"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"soundFromRoom" object:self userInfo:[userinfo autorelease]];
    }
}

-(void)passcode:(NSString *)word{
    if (delegate){
        [delegate passcode:word];
    }
}

-(BOOL)forceField{
    BOOL answer = NO;
    if (delegate){
        answer = [delegate forceField];
    }
    return answer;
}

-(void)passCode:(NSString *)passcode forExit:(NSString *)exit{
    Room *aRoom = [exit getExit:exit];
    if (aRoom){
        [aRoom passcode:passcode];
    }
}

-(NSString *)description
{
	return [NSString stringWithFormat:@"You are %@.\n *** %@", tag, [self getExits]];
}

-(void)dealloc
{
	[tag release];
	[exits release];
    [items release];
	
	[super dealloc];
}

@end
