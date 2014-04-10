//
//  UnequipCommand.h
//  StarterGame
//
//  Created by William Christian on 4/12/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

@interface UnequipCommand : Command

-(id)init;
-(BOOL)execute:(Player *)player;

@end
