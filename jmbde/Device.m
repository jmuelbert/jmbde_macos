//
//  Device.m
//  jmbde
//
//  Created by Jürgen Mülbert on 24.03.14.
//  Copyright (c) 2014 Jürgen Mülbert. All rights reserved.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the European Union Public License (EUPL),
// version 1.1.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// European Union Public License for more details.
//
// You should have received a copy of the European Union Public Licence
// along with this program. If not, see
// http://www.osor.eu/eupl/european-union-public-licence-eupl-v.1.1
//

#import "Device.h"


@implementation Device

@dynamic active;
@dynamic creationTime;
@dynamic name;
@dynamic replace;
@dynamic serialnumber;
@dynamic updateTime;

- (void)awakeFromInsert {
    [super awakeFromInsert];
    NSDate *theDate = [NSDate date];
    
    [self setPrimitiveValue:theDate forKey:@"creationTime"];
    [self setPrimitiveValue:theDate forKey:@"updateTime"];
}

- (void)willSave {
    [super willSave];
    
    if (!self.isDeleted) {
        NSDate *theDate = [NSDate date];
        [self setPrimitiveValue:theDate forKey:@"updateTime"];
    }
}

@end
