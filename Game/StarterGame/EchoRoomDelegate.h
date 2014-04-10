//
//  EchoRoomDelegate.h
//  StarterGame
//
//  Created by Student2 on 4/2/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RoomDelegate.h"

@interface EchoRoomDelegate : NSObject<RoomDelegate>

-(void)say:(NSString *)word fromRoom:(Room *)room;
-(BOOL)forceField;
-(void)passcode:(NSString *)word;

@end
