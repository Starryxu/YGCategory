//
//  NSDateComponents+YGCategory.m
//  MacroTest
//
//  Created by xiaokang on 2017/5/13.
//  Copyright © 2017年 xiaokang. All rights reserved.
//

#import "NSDateComponents+YGCategory.h"

@implementation NSDateComponents (YGCategory)
+ (NSDateComponents *)yg_dateComponentsFromDate:(NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal fromDate:date];
    return components;
}
@end
