//
//  main.m
//  diadia
//
//  Created by Davide Orlando on 02/05/15.
//  Copyright (c) 2015 Davide Orlando. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Diadia.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Diadia *gioco = [[Diadia alloc]init];
        [gioco gioca];
    }
    
    return 0;
}