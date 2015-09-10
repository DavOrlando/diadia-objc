//
//  Giocatore.m
//  diadia
//
//  Created by Davide Orlando on 04/05/15.
//  Copyright (c) 2015 Davide Orlando. All rights reserved.
//

#import "Giocatore.h"

@implementation Giocatore

-(Giocatore *)initWithBorsa{
    self.borsa = [[Borsa alloc]initWithPesoMax];
    return self;
}

@end
