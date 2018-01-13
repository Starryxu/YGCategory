//
//  NSDate+YGCategory.m
//  MacroTest
//
//  Created by xiaokang on 2017/5/13.
//  Copyright © 2017年 xiaokang. All rights reserved.
//

#import "NSDate+YGCategory.h"
#import "NSDateComponents+YGCategory.h"


@implementation NSDate (YGCategory)
- (NSInteger)yg_year {
    NSDateComponents *components = [NSDateComponents yg_dateComponentsFromDate:self];
    return components.year;
}

- (NSInteger)yg_month {
    NSDateComponents *components =  [NSDateComponents yg_dateComponentsFromDate:self];
    return components.month;
}

- (NSInteger)yg_day {
    NSDateComponents *components =  [NSDateComponents yg_dateComponentsFromDate:self];
    return components.day;
}

- (NSInteger)yg_hour {
    NSDateComponents *components =  [NSDateComponents yg_dateComponentsFromDate:self];
    return components.hour;
}

- (NSInteger)yg_minute {
    NSDateComponents *components = [NSDateComponents yg_dateComponentsFromDate:self];
    return components.minute;
}

- (NSInteger)yg_seconds {
    NSDateComponents *components =  [NSDateComponents yg_dateComponentsFromDate:self];
    return components.second;
}

- (NSInteger)yg_weekday {
    NSDateComponents *components =  [NSDateComponents yg_dateComponentsFromDate:self];
    return components.weekday;
}

- (NSString *)yg_weekdayString {
    NSString *weekStr = nil;
    switch (self.yg_weekday) {
        case 2:
            weekStr = @"星期一";
            break;
        case 3:
            weekStr = @"星期二";
            break;
        case 4:
            weekStr = @"星期三";
            break;
        case 5:
            weekStr = @"星期四";
            break;
        case 6:
            weekStr = @"星期五";
            break;
        case 7:
            weekStr = @"星期六";
            break;
        case 1:
            weekStr = @"星期天";
            break;
        default:
            break;
    }
    return weekStr;
}

- (NSDateComponents *)yg_components {
    return [NSDateComponents yg_dateComponentsFromDate:self];
}

- (NSString *)yg_timestampString {
    NSTimeInterval timeInterval = [self timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f",timeInterval];
    return [timeString copy];
}


+ (NSDate *)yg_dateWithDateString:(NSString *)dateString {
    NSDate *date = nil;
    date = [self yg_dateWithFormat_yyyy_MM_dd_HH_mm_ss_string:dateString];
    if(date) return date;
    date = [self yg_dateWithFormat_yyyy_MM_dd_HH_mm_string:dateString];
    if(date) return date;
    date = [self yg_dateWithFormat_yyyy_MM_dd_HH_string:dateString];
    if(date) return date;
    date = [self yg_dateWithFormat_yyyy_MM_dd_string:dateString];
    if(date) return date;
    date = [self yg_dateWithFormat_yyyy_MM_string:dateString];
    if(date) return date;
    return nil;
}

+ (NSDate *)yg_dateWithFormat_yyyy_MM_dd_HH_mm_ss_string:(NSString *)string {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

+ (NSDate *)yg_dateWithFormat_yyyy_MM_dd_HH_mm_string:(NSString *)string {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

+ (NSDate *)yg_dateWithFormat_yyyy_MM_dd_HH_string:(NSString *)string {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

+ (NSDate *)yg_dateWithFormat_yyyy_MM_dd_string:(NSString *)string {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}

+ (NSDate *)yg_dateWithFormat_yyyy_MM_string:(NSString *)string {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM"];
    NSDate *date =[dateFormat dateFromString:string];
    return date;
}








- (NSString *)yyyy_MM_dd_HH_mm_ss_string {
    return [self yg_stringWithFormatterString:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString *)yyyy_MM_dd_HH_mm_string {
    return [self yg_stringWithFormatterString:@"yyyy-MM-dd HH:mm"];
}

- (NSString *)yyyy_MM_dd_string {
    return [self yg_stringWithFormatterString:@"yyyy-MM-dd"];
}

- (NSString *)yyyy_MM_string {
    return [self yg_stringWithFormatterString:@"yyyy-MM"];
}

- (NSString *)MM_dd_HH_mm_ss_string {
    return [self yg_stringWithFormatterString:@"MM-dd HH:mm:ss"];
}

- (NSString *)MM_dd_HH_mm_string {
    return [self yg_stringWithFormatterString:@"MM-dd HH:mm"];
}

- (NSString *)MM_dd_string {
    return [self yg_stringWithFormatterString:@"MM-dd"];
}

- (NSString *)HH_mm_ss_string {
    return [self yg_stringWithFormatterString:@"HH:mm:ss"];
}

- (NSString *)HH_mm_string {
    return [self yg_stringWithFormatterString:@"HH:mm"];
}

- (NSString *)yg_stringWithFormatterString:(NSString *)formatterString {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:formatterString];
    return [dateFormat stringFromDate:self];
}



- (BOOL)isThisYear {
    return self.yg_components.year == [NSDate date].yg_components.year;
}

- (BOOL)isTomorrow {
    return [self differenceDays] == -1;
}

- (BOOL)isToday {
    return [self differenceDays] == 0;
}

- (BOOL)isYesToday {
    return [self differenceDays] == 1;
}

- (BOOL)isPastDay {
    return [self differenceDays] >= 1;
}

- (NSTimeInterval)yg_timestamp {
    return (NSInteger)[self timeIntervalSince1970];
}

- (NSInteger)differenceDays {
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [NSDate yg_dateWithFormat_yyyy_MM_dd_string:[NSDate date].yyyy_MM_dd_string];
    NSTimeInterval timeInterval = [today timeIntervalSinceDate:self];
    return timeInterval / secondsPerDay;
}

/**
 *  两个时间比较
 *
 *  @param unit     成分单元
 *  @param fromDate 起点时间
 *  @param toDate   终点时间
 *
 *  @return 时间成分对象
 */
+ (NSDateComponents *)yg_dateComponents:(NSCalendarUnit)unit fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate {
    //创建日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //直接计算
    NSDateComponents *components = [calendar components:unit fromDate:fromDate toDate:toDate options:0];
    return components;
}


- (NSDate *)yg_dateByAddingDays:(NSUInteger)days {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}





- (BOOL)isLeapYear {
    return [NSDate isLeapYear:self];
}

+ (BOOL)isLeapYear:(NSDate *)date {
    NSUInteger year = [date yg_year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSUInteger)daysInYear {
    return [NSDate daysInYear:self];
}

+ (NSUInteger)daysInYear:(NSDate *)date {
    return [self isLeapYear:date] ? 366 : 365;
}

- (NSUInteger)weekOfYear {
    return [NSDate weekOfYear:self];
}

+ (NSUInteger)weekOfYear:(NSDate *)date {
    NSUInteger i;
    NSUInteger year = [date yg_year];
    
    NSDate *lastdate = [date lastdayOfMonth];
    
    for (i = 1;[[lastdate dateAfterDay:-7 * i] yg_year] == year; i++) {
        
    }
    
    return i;
}


- (NSDate *)lastdayOfMonth {
    return [NSDate lastdayOfMonth:self];
}

+ (NSDate *)lastdayOfMonth:(NSDate *)date {
    NSDate *lastDate = [self begindayOfMonth:date];
    return [[lastDate dateAfterMonth:1] dateAfterDay:-1];
}

- (NSDate *)dateAfterDay:(NSUInteger)day {
    return [NSDate dateAfterDate:self day:day];
}

+ (NSDate *)dateAfterDate:(NSDate *)date day:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterDay;
}

- (NSDate *)dateAfterMonth:(NSUInteger)month {
    return [NSDate dateAfterDate:self month:month];
}

+ (NSDate *)dateAfterDate:(NSDate *)date month:(NSInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterMonth;
}

- (NSDate *)begindayOfMonth {
    return [NSDate begindayOfMonth:self];
}

+ (NSDate *)begindayOfMonth:(NSDate *)date {
    return [self dateAfterDate:date day:-[date yg_day] + 1];
}



- (NSDate *)offsetYears:(int)numYears {
    return [NSDate offsetYears:numYears fromDate:self];
}

+ (NSDate *)offsetYears:(int)numYears fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    // NSCalendarUnitDay
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)offsetMonths:(int)numMonths {
    return [NSDate offsetMonths:numMonths fromDate:self];
}

+ (NSDate *)offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    

    // NSCalendarUnitDay
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)offsetDays:(int)numDays {
    return [NSDate offsetDays:numDays fromDate:self];
}

+ (NSDate *)offsetDays:(int)numDays fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
    // NSCalendarUnitDay
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)offsetHours:(int)hours {
    return [NSDate offsetHours:hours fromDate:self];
}

+ (NSDate *)offsetHours:(int)numHours fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    

    // NSCalendarUnitDay
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:numHours];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}





- (NSUInteger)daysAgo {
    return [NSDate daysAgo:self];
}

+ (NSUInteger)daysAgo:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];

    
    return [components day];
}

- (NSUInteger)daysInMonth:(NSUInteger)month {
    return [NSDate daysInMonth:self month:month];
}

+ (NSUInteger)daysInMonth:(NSDate *)date month:(NSUInteger)month {
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date isLeapYear] ? 29 : 28;
    }
    return 30;
}


- (NSUInteger)daysInMonth {
    return [NSDate daysInMonth:self];
}

+ (NSUInteger)daysInMonth:(NSDate *)date {
    return [self daysInMonth:date month:date.yg_month];
}

- (NSString *)timeInfo {
    return [NSDate timeInfoWithDate:self];
}

+ (NSString *)timeInfoWithDate:(NSDate *)date {
    return [self timeInfoWithDateString:date.yyyy_MM_dd_HH_mm_ss_string];
}

+ (NSString *)timeInfoWithDateString:(NSString *)dateString {
    NSDate *date = [self yg_dateWithDateString:dateString];
    
    NSDate *curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];
    
    int month = (int)([curDate yg_month] - [date yg_month]);
    int year = (int)([curDate yg_year] - [date yg_year]);
    int day = (int)([curDate yg_day] - [date yg_day]);
    
    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1)
             || (abs(year) == 1 && curDate.yg_month == 1 && date.yg_month == 12)) {
        int retDay = 0;
        if (year == 0) { // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }
        
        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self daysInMonth:date month:date.yg_month];
            
            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)curDate.yg_day + (totalDays - (int)date.yg_day);
        }
        
        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }
            
            // 隔年
            int month = (int)curDate.yg_month;
            int preMonth = (int)date.yg_month;
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }
        
        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }
    
    return @"1小时前";
}


@end
