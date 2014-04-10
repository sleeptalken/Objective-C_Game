//
//  Player.h
//  StarterGame
//
//  Created by Rodrigo A. Obando on 3/7/12.
//  Copyright 2012 Columbus State University. All rights reserved.
//
//  Modified by Rodrigo A. Obando on 3/7/13.

#import <Cocoa/Cocoa.h>
#import "Room.h"
#import "GameIO.h"
#import "Item.h"


@interface Player : NSObject {
    NSMutableArray *roomsTraveled;
    NSMutableDictionary *inventory;
    NSInteger inventoryWeight;
    NSInteger MAX_WEIGHT;
    NSMutableDictionary *equippedItems;
}

@property (retain, nonatomic)Room *currentRoom;
@property (retain, nonatomic)GameIO *io;
@property (retain, nonatomic)Room *specialPlace;
@property (retain, nonatomic)id roomDelegate;
@property (retain, nonatomic)Room *thePortal;
@property (nonatomic)NSInteger inventoryWeight;
@property (nonatomic)NSInteger MAX_WEIGHT;

-(id)init;
-(id)initWithRoom:(Room *)room andIO:(GameIO *)theIO;
-(void)walkTo:(NSString *)direction;
-(void)back;
-(void)say:(NSString *)word;
-(void)grab:(NSString *)item;
-(void)drop:(NSString *)item;
-(void)removeExit:(NSString *)exit;
-(void)placeExit:(NSString *)exit;
-(void)passCode:(NSString *)passcode forExit:(NSString *)exit;
-(void)removeDelegate;
-(void)placeDelegate;
-(void)outputMessage:(NSString *)message;
-(void)showItems;
-(void)showInventory;
-(void)showWeight;
-(void)portal;
-(void)equipItem:(NSString *)theItem;
-(void)unequipItem:(NSString *)theItem;
-(void)showGear;

@end
