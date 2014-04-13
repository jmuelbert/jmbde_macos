//
//  AppDelegate+Phone.m
//  jmbde
//
//  Created by Jürgen Mülbert on 30.03.14.
//  Copyright (c) 2014 Jürgen Mülbert. All rights reserved.
//
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

#import "AppDelegate+Phone.h"

/**
 Privte Interface for Appdelegate
 */
@interface AppDelegate (PhoneAppDelegatePrivate)

@end

@implementation AppDelegate (PhoneAppDelegate)

- (NSArray *)phoneSortDescriptors
{
    return [NSArray arrayWithObject:
            [[NSSortDescriptor alloc] initWithKey:@"number" ascending:YES]];
}

@end
