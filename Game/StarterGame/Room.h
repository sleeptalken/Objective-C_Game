//
//  Room.h
//  StarterGame
//
//  Created by Rodrigo A. Obando on 3/7/12.
//  Copyright 2012 Columbus State University. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RoomDelegate.h"
#import "Item.h"


@interface Room : NSObject<RoomDelegate> {
	NSMutableDictionary *exits;
    id delegate;
    NSMutableDictionary *items;
    
}

@property (retain, nonatomic)NSString *tag;
@property (retain, nonatomic)id delegate;

-(id)init;
-(id)initWithTag:(NSString *)newTag;
-(void)setExit:(NSString *)exit toRoom:(Room *)room;
-(Room *)getExit:(NSString *)exit;
-(Room *)removeExit:(NSString *)exit;
-(NSString *)getExits;
-(void)setItems;
-(NSString *)getItems;
-(void)say:(NSString *)word;
-(BOOL)forceField;
-(void)passCode:(NSString *)passcode forExit:(NSString *)exit;
-(Item *)returnItemFromRoom:(NSString *)theItem;
-(void)removeItemFromRoom:(NSString *)theItem;
-(void)placeItemInRoom:(Item *)theItem;
-(void)theItems;
-(NSArray *)showAllKeys;

@end
