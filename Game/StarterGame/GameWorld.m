//
//  GameWorld.m
//  StarterGame
//
//  Created by Student2 on 3/19/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "GameWorld.h"
#import "Player.h"
#import "EchoRoomDelegate.h"
#import "ForceFieldRoomDelegate.h"

@implementation GameWorld

@synthesize entrance;

static GameWorld *myOnlyInstance = nil;

+(id)sharedInstance
{
    if(!myOnlyInstance)
    {
        myOnlyInstance = [[[self class] alloc] init];
        [myOnlyInstance createWorld];
        [[myOnlyInstance entrance] setExit:@"rabbithole" toRoom:[myOnlyInstance createWorldAlternate]];
        [myOnlyInstance registerForNotifications];
    }
    return myOnlyInstance;
}

-(id)init
{
    self = [super init];
    if(nil != self)
    {
        triggerRoom=nil;
        fromRoom=nil;
        toRoom=nil;
    }
    return self;
}

-(void)createWorld
{
	Room *outside, *cctParking, *boulevard, *universityParking, *parkingDeck, *cct, *theGreen, *universityHall, *schuster;
	
	outside = [[[Room alloc] initWithTag:@"outside the main entrance of the university"] autorelease];
	cctParking = [[[Room alloc] initWithTag:@"in the parking lot at CCT"] autorelease];
	boulevard = [[[Room alloc] initWithTag:@"on the boulevard"] autorelease];
	universityParking = [[[Room alloc] initWithTag:@"in the parking lot at University Hall"] autorelease];
	parkingDeck = [[[Room alloc] initWithTag:@"in the parking deck"] autorelease];
	cct = [[[Room alloc] initWithTag:@"in the CCT building"] autorelease];
	theGreen = [[[Room alloc] initWithTag:@"in the green in front of Schuster Center"] autorelease];
	universityHall = [[[Room alloc] initWithTag:@"in University Hall"] autorelease];
	schuster = [[[Room alloc] initWithTag:@"in the Schuster Center"] autorelease];
	
	[outside setExit:@"west" toRoom:boulevard];
	
	[boulevard setExit:@"east" toRoom:outside];
	[boulevard setExit:@"south" toRoom:cctParking];
	[boulevard setExit:@"west" toRoom:theGreen];
	[boulevard setExit:@"north" toRoom:universityParking];
	
	[cctParking setExit:@"west" toRoom:cct];
	[cctParking setExit:@"north" toRoom:boulevard];
	
	[cct setExit:@"east" toRoom:cctParking];
	[cct setExit:@"north" toRoom:schuster];
	
	[schuster setExit:@"south" toRoom:cct];
	[schuster setExit:@"north" toRoom:universityHall];
	[schuster setExit:@"east" toRoom:theGreen];
	
	[theGreen setExit:@"west" toRoom:schuster];
	[theGreen setExit:@"east" toRoom:boulevard];
	
	[universityHall setExit:@"south" toRoom:schuster];
	[universityHall setExit:@"east" toRoom:universityParking];
	
	[universityParking setExit:@"south" toRoom:boulevard];
	[universityParking setExit:@"west" toRoom:universityHall];
	[universityParking setExit:@"north" toRoom:parkingDeck];
	
	[parkingDeck setExit:@"south" toRoom:universityParking];
    
    Item *chestplate = [[[Item alloc]initWithName:@"chestplate" andWeight:60 isEquipable:YES andBodyPart:@"chest"] autorelease];
    Item *dragonLegs = [[[Item alloc]initWithName:@"dragonlegs" andWeight:10 isEquipable:YES andBodyPart:@"legs"] autorelease];
    Item *drum = [[[Item alloc]initWithName:@"drum" andWeight:60 isEquipable:NO andBodyPart:@""] autorelease];
    [schuster placeItemInRoom:chestplate];
    [schuster placeItemInRoom:dragonLegs];
    [schuster placeItemInRoom:drum];
    
    toRoom = schuster;
    ForceFieldRoomDelegate *fDelegate = [[[ForceFieldRoomDelegate alloc] init] autorelease];
    [fDelegate setMagicWord:@"money"];
    [universityHall setDelegate:fDelegate];
    
	entrance = outside;
}

-(Room *)createWorldAlternate
{
	Room *outside, *cctParking, *boulevard, *universityParking, *parkingDeck, *cct, *theGreen, *universityHall, *schuster;
	
	outside = [[[Room alloc] initWithTag:@"outside the main entrance of the university"] autorelease];
	cctParking = [[[Room alloc] initWithTag:@"in the parking lot at CCT"] autorelease];
	boulevard = [[[Room alloc] initWithTag:@"on the boulevard"] autorelease];
	universityParking = [[[Room alloc] initWithTag:@"in the parking lot at University Hall"] autorelease];
	parkingDeck = [[[Room alloc] initWithTag:@"in the parking deck"] autorelease];
	cct = [[[Room alloc] initWithTag:@"in the CCT building"] autorelease];
	theGreen = [[[Room alloc] initWithTag:@"in the green in front of Schuster Center"] autorelease];
	universityHall = [[[Room alloc] initWithTag:@"in University Hall"] autorelease];
	schuster = [[[Room alloc] initWithTag:@"in the Schuster Center"] autorelease];
	
	[outside setExit:@"boulevard" toRoom:boulevard];
	
	[boulevard setExit:@"outside" toRoom:outside];
	[boulevard setExit:@"cctpark" toRoom:cctParking];
	[boulevard setExit:@"thegreen" toRoom:theGreen];
	[boulevard setExit:@"upark" toRoom:universityParking];
	
	[cctParking setExit:@"cct" toRoom:cct];
	[cctParking setExit:@"boulevard" toRoom:boulevard];
	
	[cct setExit:@"cctpark" toRoom:cctParking];
	[cct setExit:@"schuster" toRoom:schuster];
	
	[schuster setExit:@"cct" toRoom:cct];
	[schuster setExit:@"uhall" toRoom:universityHall];
	[schuster setExit:@"thegreen" toRoom:theGreen];
	
	[theGreen setExit:@"schuster" toRoom:schuster];
	[theGreen setExit:@"boulevard" toRoom:boulevard];
	
	[universityHall setExit:@"schuster" toRoom:schuster];
	[universityHall setExit:@"upark" toRoom:universityParking];
	
	[universityParking setExit:@"boulevard" toRoom:boulevard];
	[universityParking setExit:@"uhall" toRoom:universityHall];
	[universityParking setExit:@"parkdeck" toRoom:parkingDeck];
	
	[parkingDeck setExit:@"upark" toRoom:universityParking];
    
    [schuster setDelegate:[[[EchoRoomDelegate alloc] init] autorelease]];
    
    triggerRoom = schuster;
    fromRoom = schuster;
	
	return outside;
}

-(void)registerForNotifications
{ 
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willExitRoom:) name:@"playerWillExitRoom" object:nil];
}
-(void)willExitRoom:(NSNotification *)notification
{
    Player *player = (Player *)[notification object];
    if([player currentRoom] == triggerRoom)
    {
        [fromRoom setExit:@"redpill" toRoom:toRoom];
        NSLog(@"We made a connection to the real world through %@.\n", [[player currentRoom] tag]);

    }
    [player outputMessage:[NSString stringWithFormat:@"The Player will exit room %@.\n", [[player currentRoom] tag]]];
    NSLog(@"The player will exit room %@.\n", [[player currentRoom] tag]);
}


@end
