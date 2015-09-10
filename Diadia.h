//
//  Diadia.h
//  diadia
//
//  Created by Davide Orlando on 03/05/15.
//  Copyright (c) 2015 Davide Orlando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Partita.h"
#import "Comando.h"
#import "string.h"



@interface Diadia : NSObject

@property Partita *partita;

-(void) initWithPartitaSemplice;

-(void) gioca;

-(BOOL)processaIstruzione:(NSString *) istruzione;

-(void) vai:(NSString *) direzione;

-(void) fine;

-(void) prendi:(NSString *) nomeAttrezzo;

-(void) posa: (NSString *) nomeAttrezzo;

-(void) aiuto;
@end
