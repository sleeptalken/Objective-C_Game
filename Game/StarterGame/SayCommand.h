//
//  SayCommand.h
//  StarterGame
//
//  Created by Student2 on 3/21/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

@interface SayCommand : Command

-(id)init;
-(BOOL)execute:(Player *)player;

@end
