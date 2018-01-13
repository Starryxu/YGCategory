//
//  NSDate+YGCategory.h
//  MacroTest
//
//  Created by xiaokang on 2017/5/13.
//  Copyright © 2017年 xiaokang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YGCategory)


@property (nonatomic, assign, readonly) NSInteger yg_year;     // 年
@property (nonatomic, assign, readonly) NSInteger yg_month;    // 月
@property (nonatomic, assign, readonly) NSInteger yg_weekday;  // 周(默认周日是1,...以此类推周六是7,可修改[NSCalendar setFirstWeekday:2])
@property (nonatomic, copy,   readonly) NSString  *yg_weekdayString;// 周
@property (nonatomic, assign, readonly) NSInteger yg_day;      // 日
@property (nonatomic, assign, readonly) NSInteger yg_hour;     // 时
@property (nonatomic, assign, readonly) NSInteger yg_minute;   // 分
@property (nonatomic, assign, readonly) NSInteger yg_seconds;  // 秒
@property (nonatomic, strong, readonly) NSDateComponents *yg_components;      // 时间成分
@property (nonatomic, copy,   readonly) NSString         *yg_timestampString; // 时间戳字符串
@property (nonatomic, assign, readonly) BOOL isThisYear;    // 是否是今年
@property (nonatomic, assign, readonly) BOOL isTomorrow;    // 是否是明天
@property (nonatomic, assign, readonly) BOOL isToday;       // 是否是今天
@property (nonatomic, assign, readonly) BOOL isYesToday;    // 是否是昨天
@property (nonatomic, assign, readonly) BOOL isPastDay;     // 是否是昨天


@property (nonatomic, assign, readonly) NSTimeInterval yg_timestamp; /**< 当前时间戳 */

// 时间字符串转换为时间
+ (NSDate *)yg_dateWithDateString:(NSString *)dateString;
+ (NSDate *)yg_dateWithFormat_yyyy_MM_dd_HH_mm_ss_string:(NSString *)string;
+ (NSDate *)yg_dateWithFormat_yyyy_MM_dd_HH_mm_string:(NSString *)string;
+ (NSDate *)yg_dateWithFormat_yyyy_MM_dd_HH_string:(NSString *)string;
+ (NSDate *)yg_dateWithFormat_yyyy_MM_dd_string:(NSString *)string;
+ (NSDate *)yg_dateWithFormat_yyyy_MM_string:(NSString *)string;


@property (nonatomic, copy, readonly) NSString *yyyy_MM_dd_HH_mm_ss_string;   // 2017-05-14 12:57:32
@property (nonatomic, copy, readonly) NSString *yyyy_MM_dd_HH_mm_string;      // 2017-05-14 12:57
@property (nonatomic, copy, readonly) NSString *yyyy_MM_dd_string;            // 2017-05-14
@property (nonatomic, copy, readonly) NSString *yyyy_MM_string;               // 2017-05
@property (nonatomic, copy, readonly) NSString *MM_dd_HH_mm_ss_string;        //      05-14 12:57:32
@property (nonatomic, copy, readonly) NSString *MM_dd_HH_mm_string;           //      05-14 12:57
@property (nonatomic, copy, readonly) NSString *MM_dd_string;                 //      05-14
@property (nonatomic, copy, readonly) NSString *HH_mm_ss_string;              //            12:57:32
@property (nonatomic, copy, readonly) NSString *HH_mm_string;                 //            12:57
// 将时间转化为字符串
- (NSString *)yg_stringWithFormatterString:(NSString *)formatterString;








/**
 *  两个时间比较
 *
 *  @param unit     成分单元(年/月/日/时/分/秒)
 *  @param fromDate 起点时间
 *  @param toDate   终点时间
 *
 *  @return 时间成分对象
 */
+ (NSDateComponents *)yg_dateComponents:(NSCalendarUnit)unit fromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;



/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *  @return Return self by adding the gived days number
 */
- (NSDate *)yg_dateByAddingDays:(NSUInteger)days;



/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)isLeapYear;
+ (BOOL)isLeapYear:(NSDate *)date;

/**
 * 获取一年中的总天数
 */
- (NSUInteger)daysInYear;
+ (NSUInteger)daysInYear:(NSDate *)date;


/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)weekOfYear;
+ (NSUInteger)weekOfYear:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)lastdayOfMonth;
+ (NSDate *)lastdayOfMonth:(NSDate *)date;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)dateAfterDay:(NSUInteger)day;
+ (NSDate *)dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)dateAfterMonth:(NSUInteger)month;
+ (NSDate *)dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)offsetYears:(int)numYears;
+ (NSDate *)offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)offsetMonths:(int)numMonths;
+ (NSDate *)offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)offsetDays:(int)numDays;
+ (NSDate *)offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)offsetHours:(int)hours;
+ (NSDate *)offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/**
 * 距离该日期前几天
 */
- (NSUInteger)daysAgo;
+ (NSUInteger)daysAgo:(NSDate *)date;

/**
 * 获取指定月份的天数
 */
- (NSUInteger)daysInMonth:(NSUInteger)month;
+ (NSUInteger)daysInMonth:(NSDate *)date month:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)daysInMonth;
+ (NSUInteger)daysInMonth:(NSDate *)date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)timeInfo;
+ (NSString *)timeInfoWithDate:(NSDate *)date;
+ (NSString *)timeInfoWithDateString:(NSString *)dateString;

@end
