//
//  RoomDelegate.h
//  StarterGame
//
//  Created by Student1 on 4/4/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Room;

@protocol RoomDelegate <NSObject>

-(void)say:(NSString *)word fromRoom:(Room *)room;
-(BOOL)forceField;
-(void)passcode:(NSString *)word;

@end
