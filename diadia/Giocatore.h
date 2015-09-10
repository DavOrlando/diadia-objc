//
//  Giocatore.h
//  diadia
//
//  Created by Davide Orlando on 04/05/15.
//  Copyright (c) 2015 Davide Orlando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Borsa.h"

@interface Giocatore : NSObject
@property Borsa *borsa;

-(Giocatore *)initWithBorsa;
@end
