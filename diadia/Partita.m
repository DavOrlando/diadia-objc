//
//  Partita.m
//  diadia
//
//  Created by Davide Orlando on 02/05/15.
//  Copyright (c) 2015 Davide Orlando. All rights reserved.
//

#import "Partita.h"

@implementation Partita

@synthesize labirintoPartita;

const int CFU_INIZIALI = 20;

-(Partita *) initWithCfuIniziali{
    self = [self init];
    Giocatore *studente = [[Giocatore alloc]initWithBorsa];
    [self setGiocatore:studente];
    Stanza *atrio = [[Stanza alloc]initWithNome:@"Atrio"];
    Stanza *biblioteca = [[Stanza alloc]initWithNome:@"Biblioteca"];
    Labirinto *labirinto = [[Labirinto alloc]initWithStanzaIniziale:atrio andWithStanzaVincente:biblioteca];
    [self setLabirintoPartita:labirinto];
    [self setStanzaCorrente:[[self labirintoPartita] stanzaIniziale]];
    [self setFinita:false];
    [self setCfu:CFU_INIZIALI];
    return self;
}

-(BOOL) vinta{
    return [[self stanzaCorrente] isEqualTo:[[self labirintoPartita] stanzaVincente]];
}

-(BOOL) isFinita{
    return [self cfu] == 0 || [self finita] || [self vinta];
}



@end
