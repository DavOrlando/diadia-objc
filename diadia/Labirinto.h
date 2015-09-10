//
//  Labirinto.h
//  diadia
//
//  Created by Davide Orlando on 04/05/15.
//  Copyright (c) 2015 Davide Orlando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stanza.h"

@interface Labirinto : NSObject

@property Stanza *stanzaIniziale, *stanzaVincente;

-(Labirinto *)initWithStanzaIniziale: (Stanza *) stanzaIniziale andWithStanzaVincente:(Stanza *) stanzaVincente;
-(void)initLabirinto;

@end
