//
//  ItemsCommand.h
//  StarterGame
//
//  Created by csu on 4/10/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"
#import "Room.h"

@interface ItemsCommand : Command

-(id)init;
-(BOOL)execute:(Player *)player;

@end