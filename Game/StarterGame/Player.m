//
//  Player.m
//  StarterGame
//
//  Created by Rodrigo A. Obando on 3/7/12.
//  Copyright 2012 Columbus State University. All rights reserved.
//
//  Modified by Rodrigo A. Obando on 3/7/13.

#import "Player.h"
#import "Item.h"


@implementation Player

@synthesize currentRoom;
@synthesize io;
@synthesize roomDelegate;
@synthesize thePortal;
@synthesize inventoryWeight;
@synthesize MAX_WEIGHT;

-(id)init
{
	return [self initWithRoom:nil andIO:nil];
}

-(id)initWithRoom:(Room *)room andIO:(GameIO *)theIO
{
	self = [super init];
    
	if (nil != self) {
		[self setCurrentRoom:room];
        [self setIo:theIO];
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listen:) name:@"soundFromRoom" object:[self currentRoom]];
        roomsTraveled = [[NSMutableArray alloc] init];
        inventory = [[NSMutableDictionary alloc] initWithCapacity:5];
        [self setInventoryWeight:0];
        [self setMAX_WEIGHT:70];
        [self setThePortal:nil];
        equippedItems = [[NSMutableDictionary alloc] initWithCapacity: 5];
	}
    
	return self;
}

-(void)walkTo:(NSString *)direction
{
	Room *nextRoom = [currentRoom getExit:direction];
	if (nextRoom) {
        if ([nextRoom forceField]){
            [self outputMessage:[NSString stringWithFormat:@"\nThere is a force field on %@.", direction]];
        }
        else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"playerWillExitRoom" object:self];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"soundFromRoom" object:[self currentRoom]];
            
        [roomsTraveled addObject:currentRoom];
            
		[self setCurrentRoom:nextRoom];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listen:) name:@"soundFromRoom" object:[self currentRoom]];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"playerDidExitRoom" object:self];
        [self outputMessage:[NSString stringWithFormat:@"\n%@", nextRoom]];
            [self setRoomDelegate:nil];
        }
	}
	else {
        [self outputMessage:[NSString stringWithFormat:@"\nThere is no door on %@!", direction]];
	}
}

-(void)back
{
    Room *previousRoom = [roomsTraveled lastObject];
    if(previousRoom) {
        [roomsTraveled removeLastObject];
        [self setCurrentRoom:previousRoom];
        [self outputMessage:[NSString stringWithFormat:@"\n%@", currentRoom]];
    }
    else {
        [self outputMessage:[NSString stringWithFormat:@"You can't go back\n"]];
    }
}

-(void)grab:(NSString *)theItem
{
    Item *temp = [currentRoom returnItemFromRoom:theItem];
    NSInteger surpassedWeight = (inventoryWeight + [temp weight] - MAX_WEIGHT);
    if(temp) {
        if(inventoryWeight + [temp weight] <= MAX_WEIGHT) {
            [temp retain];
            [currentRoom removeItemFromRoom:theItem];
            [self setInventoryWeight:(inventoryWeight + [temp weight])];
            [inventory setObject:temp forKey:[temp name]];
            [self outputMessage:[NSString stringWithFormat:@"You grabbed the %@.\n", [temp name]]];
        }
        else {
            [self outputMessage:[NSString stringWithFormat:@"Grabbing the %@ will surpass your MAX_WEIGHT by %li!\n", [temp name], surpassedWeight]];
        }
    }
    else {
        [self outputMessage:[NSString stringWithFormat:@"The room does not contain the %@!\n", theItem]];
    }
}
-(void)drop:(NSString *)theItem
{
    Item *temp = (Item *)[inventory objectForKey:theItem];
    Item *temp1 = (Item *)[equippedItems objectForKey:theItem];
    if(temp || temp1) {
        if(temp1)
        {
            [temp1 retain];
            [equippedItems removeObjectForKey:[temp1 name]];
            [self setInventoryWeight:(inventoryWeight - [temp1 weight])];
            [currentRoom placeItemInRoom:temp1];
            [self outputMessage:[NSString stringWithFormat:@"You unequipped and dropped the %@.\n", [temp1 name]]];
        }
        else {
            [temp retain];
            [inventory removeObjectForKey:[temp name]];
            [self setInventoryWeight:(inventoryWeight - [temp weight])];
            [currentRoom placeItemInRoom:temp];
            [self outputMessage:[NSString stringWithFormat:@"You dropped the %@.\n", [temp name]]];
        }
    }
    else {
        [self outputMessage:[NSString stringWithFormat:@"You don't have the %@.\n", theItem]];
    }
}

-(void)equipItem:(NSString *)theItem
{
    Item *temp = (Item *)[inventory objectForKey:theItem];
    if(temp) {
        if([temp equipable]) {
            [temp retain];
            [equippedItems setObject:temp forKey:[temp name]];
            [inventory removeObjectForKey:[temp name]];
            [self outputMessage:[NSString stringWithFormat:@"You equipped %@ on your %@ \n", [temp name], [temp bodyPart]]];
        }
        else {
            [self outputMessage:[NSString stringWithFormat:@"The %@ is not equipable", [temp name]]];
        }
    }
    else {
        [self outputMessage:[NSString stringWithFormat:@"You don't have the %@!\n", theItem]];
    }
}

-(void)unequipItem:(NSString *)theItem
{
    Item *temp = (Item *)[equippedItems objectForKey:theItem];
    if(temp) {
        [temp retain];
        [equippedItems removeObjectForKey:[temp name]];
        [inventory setObject:temp forKey:[temp name]];
        [self outputMessage:[NSString stringWithFormat:@"You unequipped %@. \n", [temp name]]];
    }
    else {
        if([temp equipable]) {
            [self outputMessage:[NSString stringWithFormat:@"You don't have the %@ equipped!", [temp name]]];
        }
        else {
            [self outputMessage:[NSString stringWithFormat:@"You don't have the %@ equipped.", theItem]];
        }
    }
}

-(void)showGear
{
    NSArray *myEquippedItems = [equippedItems allKeys];
    Item *currentItem = [[[Item alloc]initWithName:@"" andWeight:0 isEquipable:NO andBodyPart:@""] autorelease];
    if(myEquippedItems) {
        for(int i=0; i <= ([myEquippedItems count]); i++)
        {
            currentItem = (Item *)[equippedItems objectForKey:[myEquippedItems objectAtIndex:i]];
            [self outputMessage:[NSString stringWithFormat:@"%@: %@", [currentItem bodyPart], [myEquippedItems objectAtIndex:i]]];
        }
        [self outputMessage:@"\n"];
    }
    else {
        [self outputMessage:@"You don't have any items equipped!"];
    }
}

-(void)showInventory
{
    NSArray *myInventory = [inventory allKeys];
	[self outputMessage:[myInventory componentsJoinedByString:@"\n"]];
}

-(void)showItems
{
    NSArray *roomItems = [currentRoom showAllKeys];
	[self outputMessage:[roomItems componentsJoinedByString:@"\n"]];
}

-(void)showWeight
{
    [self outputMessage:[NSString stringWithFormat:@"Your current weight is: %li\n", inventoryWeight]];
}

-(void)say:(NSString *)word
{
    [currentRoom say:word];
    //[self outputMessage:word];
}

-(void)removeExit:(NSString *)exit
{
    if(![self specialPlace])
    {
        Room *theOne = [[self currentRoom] removeExit:exit];
        if(theOne)
        {
            [self setSpecialPlace:theOne];
        }
        else
        {
            [self outputMessage:[NSString stringWithFormat:@"\nThere is not exit on %@.", exit]];
        }
    }
}
-(void)placeExit:(NSString *)exit
{
    if([self specialPlace])
    {
        [[self currentRoom] setExit:exit toRoom:[self specialPlace]];
        [self setSpecialPlace:nil];
    }
}

-(void)passCode:(NSString *)passcode forExit:(NSString *)exit{
    [currentRoom passCode:passcode forExit:exit];
}

-(void)listen:(NSNotification *)notification
{
    //[self outputMessage:@"I got the notification"];
    NSDictionary *userinfo = [notification userInfo];
    NSString *sound = [userinfo objectForKey:@"sound"];
    if (sound)
    {
        [self outputMessage:sound];
    }
}

-(void)removeDelegate
{
    if(!roomDelegate){
        [self setRoomDelegate:[currentRoom delegate]];
        [currentRoom setDelegate:nil];
    }
    else{
        [self outputMessage:@"You already have a delegate, buddy!"];
    }
}

-(void)placeDelegate
{
    if(![currentRoom delegate]) {
        [currentRoom setDelegate:[self roomDelegate]];
        [self setRoomDelegate:nil];
    }
    else{
        [self outputMessage:@"The room already has a delegate, bud."];
    }
}

-(void)outputMessage:(NSString *)message
{
    [io sendLines:message];
}

-(void)portal
{
    if(thePortal) {
        [[self currentRoom] setExit:@"portal" toRoom:thePortal];
        Room *theOldRoom = [self currentRoom];
        [self outputMessage:@"Whoooooosh! Using the portal.\n"];
        [self walkTo:@"portal"];
        [theOldRoom removeExit:@"portal"];
        [self setThePortal:nil];
        [roomsTraveled removeAllObjects];
        
    }
    else {
        [self setThePortal:[self currentRoom]];
        [self outputMessage:@"You set the target room for the portal."];
    }
}

-(void)dealloc
{
	[currentRoom release];
    [io release];
    [inventory release];
    [roomsTraveled release];
    //[portal release];
	
	[super dealloc];
}

@end
