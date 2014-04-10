//
//  PlaceExit.h
//  StarterGame
//
//  Created by Student2 on 3/28/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

@interface PlaceExit : Command

-(id)init;
-(BOOL)execute:(Player *)player;

@end
