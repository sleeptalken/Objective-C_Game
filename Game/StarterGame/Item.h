//
//  Item.h
//  StarterGame
//
//  Created by csu on 4/10/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject {
    NSInteger weight;
    NSString *name;
    BOOL equipable;
    NSString *bodyPart;
}

@property (nonatomic)NSInteger weight;
@property (nonatomic)BOOL equipable;
@property (retain, nonatomic)NSString *name;
@property (retain, nonatomic)NSString *bodyPart;

-(id)init;
-(id)initWithName:(NSString *)theName;
-(id)initWithName:(NSString *)theName andWeight:(NSInteger)theWeight;
-(id)initWithName:(NSString *)theName andWeight:(NSInteger)theWeight isEquipable:(BOOL)yesOrNo andBodyPart:(NSString *)bodyPart;

@end
