//
//  Borsa.m
//  diadia
//
//  Created by Davide Orlando on 04/05/15.
//  Copyright (c) 2015 Davide Orlando. All rights reserved.

#import "Borsa.h"

@implementation Borsa

const int DEFAULT_PESO_MAX_BORSA = 10;

-(Borsa *)initWithPesoMax{
    return [self initWithPeso:DEFAULT_PESO_MAX_BORSA];
}

-(Borsa *)initWithPeso:(int) peso{
    [self setPesoMax:peso];
    [self setNumeroAttrezzi:0];
    self.attrezzi = [[NSMutableArray alloc]initWithCapacity:10];
    return self;
}

-(BOOL)addAttrezzo:(Attrezzo *) attrezzo{
    if ([self getPeso]+[attrezzo peso]>[self pesoMax]) {
        return false;
    }
    if ([self numeroAttrezzi]==10) {
        return false;
    }
    self.attrezzi[self.numeroAttrezzi] = attrezzo;
    self.numeroAttrezzi++;
    return true;
}

-(int)getPeso{
    int peso = 0;
    for (int i = 0; i<self.numeroAttrezzi; i++) {
        peso+= [self.attrezzi[i] peso];
    }
    return peso;
}

-(BOOL)isEmpty{
    return self.numeroAttrezzi==0;
}

-(Attrezzo *) getAttrezzo:(NSString * )nomeAttrezzo{
    if (self.numeroAttrezzi==0)
        return NULL;
    if(nomeAttrezzo==NULL)
        return NULL;
    for (int i =0; i<self.numeroAttrezzi; i++) {
        if([[self.attrezzi[i] nome] isEqualToString:nomeAttrezzo])
            return self.attrezzi[i];
    }
    return NULL;
}

-(BOOL) hasAttrezzo:(NSString *)nomeAttrezzo{
    return [self getAttrezzo:nomeAttrezzo]!=NULL;
}

-(Attrezzo *) removeAttrezzo:(NSString *)nomeAttrezzo{
    Attrezzo *a;
    if (nomeAttrezzo == NULL) {
        return NULL;
    }
    if (self.numeroAttrezzi == 0) {
        return NULL;
    }
    for (int i = 0; i<self.numeroAttrezzi && a==NULL; i++) {
        if ([[self.attrezzi[i] nome]isEqualToString:nomeAttrezzo]) {
            a = self.attrezzi[i];
            self.attrezzi[i] = self.attrezzi[self.numeroAttrezzi-1];
            self.attrezzi[self.numeroAttrezzi-1] = [[Attrezzo alloc]init];
            self.numeroAttrezzi--;
        }
    }
    return a;
}

-(NSString *) description{
    NSMutableString *descrizioneOggetto;
    if (![self isEmpty]) {
        descrizioneOggetto= [[NSMutableString alloc]initWithFormat:@"Contenuto borsa(%d kg / %d kg): ",[self getPeso],[self pesoMax]];
        for (int i = 0; i<self.numeroAttrezzi; i++) {
            descrizioneOggetto = [descrizioneOggetto stringByAppendingString:[self.attrezzi[i] description] ];
            descrizioneOggetto = [descrizioneOggetto stringByAppendingString:@" "];
        }
    }else descrizioneOggetto = @"Borsa Vuota";
    return descrizioneOggetto;
}

@end
