//
//  Borsa.h
//  diadia
//
//  Created by Davide Orlando on 04/05/15.
//  Copyright (c) 2015 Davide Orlando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Attrezzo.h"

@interface Borsa : NSObject

@property int pesoMax, numeroAttrezzi;
@property NSMutableArray *attrezzi;

-(Borsa *)initWithPesoMax;
-(Borsa *)initWithPeso:(int) peso;
-(BOOL)addAttrezzo:(Attrezzo *) attrezzo;
-(Attrezzo *) getAttrezzo:(NSString *) nomeAttrezzo;
-(int)getPeso;
-(BOOL)isEmpty;
-(BOOL)hasAttrezzo:(NSString *) nomeAttrezzo;
-(Attrezzo *) removeAttrezzo:(NSString*)nomeAttrezzo;
-(NSString *)description;
@end
