//
//  Attrezzo.m
//  diadia
//
//  Created by Davide Orlando on 02/05/15.
//  Copyright (c) 2015 Davide Orlando. All rights reserved.
//

#import "Attrezzo.h"

@implementation Attrezzo

-(Attrezzo *)initWithNome:(NSString *)nomeAttrezzo andWithPeso:(int)pesoAttrezzo{
    [self setNome:nomeAttrezzo];
    [self setPeso:pesoAttrezzo];
    return self;
}

-(NSString *)description{
    return [NSString stringWithFormat: @"%@ (%d kg)",[self nome],[self peso]];
}

@end
