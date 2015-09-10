//
//  Partita.h
//  diadia
//
//  Created by Davide Orlando on 02/05/15.
//  Copyright (c) 2015 Davide Orlando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stanza.h"
#import "Labirinto.h"
#import "Giocatore.h"

@interface Partita : NSObject

@property Stanza *stanzaCorrente;
@property Giocatore *giocatore;
@property Labirinto *labirintoPartita;
@property BOOL finita;
@property int cfu;

-(Partita *) initWithCfuIniziali;
-(BOOL) vinta;
-(BOOL) isFinita;

@end
