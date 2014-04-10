//
//  Item.m
//  StarterGame
//
//  Created by csu on 4/10/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "Item.h"


@implementation Item

@synthesize weight;
@synthesize name;
@synthesize bodyPart;
@synthesize equipable;

-(id)init
{
    return [self initWithName:@"No name"];
}

-(id)initWithName:(NSString *)theName;
{
    return [self initWithName:theName andWeight:0 isEquipable:NO andBodyPart:@""];
}

-(id)initWithName:(NSString *)theName andWeight:(NSInteger)theWeight
{
    return [self initWithName:theName andWeight:theWeight isEquipable:NO andBodyPart:@""];
}

-(id)initWithName:(NSString *)theName andWeight:(NSInteger)theWeight isEquipable:(BOOL)yesOrNo andBodyPart:(NSString *)theBodyPart
{
    self = [super init];
    
    if(nil != self) {
        name = theName;
        weight = theWeight;
        equipable = yesOrNo;
        bodyPart = theBodyPart;
        
    }
    return self;
}

-(NSString *)description
{
	return [NSString stringWithFormat:@"\nName: %@. \nWeight: %li\nEquipable: %c.", name, weight, equipable];
}

-(void)dealloc
{
	[name release];
	
	[super dealloc];
}

@end