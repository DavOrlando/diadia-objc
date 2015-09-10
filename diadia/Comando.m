//
//  Comando.m
//  diadia
//
//  Created by Davide Orlando on 02/05/15.
//  Copyright (c) 2015 Davide Orlando. All rights reserved.
//

#import "Comando.h"

@implementation Comando

@synthesize nome,parametro;

-(Comando *)initWithIstruzione:(NSString *const)istruzione {
    NSArray *informazioni = [istruzione componentsSeparatedByString:@" "];
    if(informazioni[0]){
        [self setNome:informazioni[0]];
    }
    if([informazioni count] > 1 && informazioni[1]){
        [self setParametro:informazioni[1]];
    }
    return self;
}

-(BOOL) sconosciuto{
    return [self nome] == NULL;
}

@end

