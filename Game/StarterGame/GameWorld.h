//
//  GameWorld.h
//  StarterGame
//
//  Created by Student2 on 3/19/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"

@interface GameWorld : NSObject {
    Room *entrance;
    Room *triggerRoom, *fromRoom, *toRoom;
}

@property(readonly, nonatomic) Room *entrance;

+(id)sharedInstance;

-(void)createWorld;
-(Room *)createWorldAlternate;
-(void)registerForNotifications;
-(void)willExitRoom:(NSNotification *)notification;

@end
