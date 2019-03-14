//
//  Utility.m
//  SingleTonTimeDoosan
//
//  Created by Seoksoon Jang on 14/03/2019.
//  Copyright © 2019 JSS. All rights reserved.
//

#import "Utility.h"

@implementation Utility
@synthesize inputTimeString;
@synthesize doosanStandardTimeFormat;
#pragma mark - singleton method

+ (Utility*)shared {
    static dispatch_once_t predicate = 0;
    __strong static Utility* shared = nil;
    dispatch_once(&predicate, ^{
        shared = [[self alloc] init];
        
        shared.doosanStandardTimeFormat = @"yyyy-MM-dd HH:mm:ss";
    });
    return shared;
}

/// MARK: - PUBLIC APIs -
/**
 * 기준시간 문자열을 탑승시간 기준 문자열로 바꿔줍니다.
 * 예 : @"2019-03-13 17:57:59" => @"17:57"
 */
- (NSString*) transformToBoardingTimeString: (NSString*)inputTimeString {
    NSDateComponents* components = [self makeDateComponents:inputTimeString];
    
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];

    return [NSString stringWithFormat:@"%ld:%ld", hour, minute];
}

/**
 * 기준시간 문자열을 운행시간 기준 문자열로 바꿔줍니다.
 * 현재시간 - 탑승시각 = 00:20
 * 예 : @"2019-03-13 17:58:09"(현재시간) - @"2019-03-13 17:57:59" => @"00:10"
 */
- (NSString*) transformToOperatingTimeString: (NSString*)inputTimeString {
    NSDate* nowDate = [self makeCurrentTimeDate];
    NSDate* inputPastDate = [self makeTimeDateFrom:inputTimeString];    // it must be past otherwise it returns error.
    NSTimeInterval timeDiff = [nowDate timeIntervalSinceDate:inputPastDate];
    
    return [self makeDifferenceOperationTimeStringFromTimeInterval:timeDiff];;
}

/**
 * 기준시간부터 현재시간에서 얼마나 시간이 시로 흘렀는지 표현.
 * 요구사항: 2시간전. 24시간 이후는 (18.08.23 같은 날짜로 표시) => 두 시간간의 차이를 표현해야 하므로 24시간 넘어가도 무조건 시간 단위 차이로 표현했음.
 */
- (NSString*) transformToHowManyTimeHasPassedAsHoursSince: (NSString*)inputTimeString {
    NSString* theTimeDiffSecondsString = [self transformToOperatingTimeString:inputTimeString]; // ex : @"15:30";
    return [self calculateAsHoursFrom:theTimeDiffSecondsString];
}

/**
 * 현재시간에서 얼마나 시간이 분으로 흘렀는지 표현.
 * 요구사항: 30분 전에 신청하셨습니다. 현재시간 - 기준시간
 */
- (NSString*) transformToHowManyTimeHasPassedAsMinutesSince: (NSString*)inputTimeString {
    NSString* hourMinuteTimeString = [self transformToOperatingTimeString:inputTimeString]; // ex : @"15:30";
    NSArray* timeComponetns = [hourMinuteTimeString componentsSeparatedByString:@":"];
    if (timeComponetns.count >= 2) {
        NSString* hoursString = [timeComponetns objectAtIndex:0];
        
        NSUInteger additionalMinutesConvertedFromHour = [hoursString integerValue] * 60;
        
        NSString* minutesString = [timeComponetns objectAtIndex:1];
        NSUInteger minutesInteger = [minutesString integerValue] + additionalMinutesConvertedFromHour;
        if (minutesInteger > 1) {
            return [NSString stringWithFormat:@"%ld분 전", minutesInteger];
        } else if (minutesInteger == 0){
            return [NSString stringWithFormat:@"%@초 전", hourMinuteTimeString];
        } else {
            // 에러
            return @"";
        }
    } else {
        // 에러
        return @"";
    }
}

/**
 * 기준시간까지 현재시간부터 얼마나 시간이 남았는지 시로 표현.
 * 요구사항: 앞으로 1시간 뒤 방문할 예정입니다. 기준시간 - 현재시간
 */
- (NSString*) transformToHowManyTimeLeftToFutureAsHoursSince: (NSString*)inputTimeString {
    NSDate* nowDate = [self makeCurrentTimeDate];
    NSDate* inputDate = [self makeTimeDateFrom:inputTimeString];    // it must be past otherwise it returns error.
    NSTimeInterval timeDiff = [inputDate timeIntervalSinceDate:nowDate];
    NSString* hourMinuteTimeString = [self makeDifferenceOperationTimeStringFromTimeInterval:timeDiff]; // ex: @"15:30"
    
    return [self calculateAsHoursTo:hourMinuteTimeString];
}

/**
 * 서버 기준 문자열을 두산 UI 출력 표준시간으로 변환(예: 2018-12-25 PM 05:30)
 * 요구사항: 방문 예정시간 2018-12-25 PM 05:30 반환
 */
- (NSString*) transformToQRNTimeUIStandardFormatString: (NSString*)inputTimeString {
    NSDateComponents* components = [self makeDateComponents:inputTimeString];
    
    NSInteger year = [components year];
    NSInteger month = [components month];
    NSInteger day = [components day];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    // NSInteger second = [components second];
    
    if (hour > 12) {
        NSUInteger requiredHour = hour - 12;
        return [NSString stringWithFormat:@"%02ld-%02ld-%02ld PM %02ld:%02ld", year, month, day, requiredHour, minute];
    } else if (hour == 12){
        return [NSString stringWithFormat:@"%02ld-%02ld-%02ld PM %02ld:%02ld", year, month, day, hour, minute];
    } else {
        return [NSString stringWithFormat:@"%02ld-%02ld-%02ld AM %02ld:%02ld", year, month, day, hour, minute];
    }
}

/// MARK: - PRIVATE APIs -
- (NSDateComponents* ) makeDateComponents: (NSString*)inputTimeString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:self.doosanStandardTimeFormat];
    NSDate *date = [dateFormatter dateFromString:inputTimeString];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:(NSCalendarUnitYear |  NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:date];
}

- (NSString*) makeCurrentTimeString {
    NSDate * now = [NSDate date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:self.doosanStandardTimeFormat];
    
    return [outputFormatter stringFromDate:now];
}

- (NSDate*) makeCurrentTimeDate {
    return [NSDate date];
}

- (NSDate*) makeTimeDateFrom: (NSString*)inputTimeString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:self.doosanStandardTimeFormat];
    return [dateFormatter dateFromString:inputTimeString];
}

- (NSString *)makeDifferenceOperationTimeStringFromTimeInterval:(NSTimeInterval)timeDiff {
    NSInteger ti = (NSInteger)timeDiff;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    
    // timeDiff가 잘못되었을때. MVP이므로 API 정리하지 말고 일단 빈 문자열 리턴
    if (hours < 0 || minutes < 0) {
        return @"";
    }
    
    return [NSString stringWithFormat:@"%02ld:%02ld", (long)hours, (long)minutes];
}

- (NSString*) calculateAsHoursTo: (NSString*)hourMinutesTimeString {
    NSArray* timeComponetns = [hourMinutesTimeString componentsSeparatedByString:@":"];
    if (timeComponetns.count >= 1) {
        NSString* hourString = [timeComponetns objectAtIndex:0];
        NSUInteger hourInteger = [hourString integerValue];
        if (hourInteger > 24) {
            //            NSDate* nowDate = [self makeCurrentTimeDate];
            //            NSDate* inputPastDate = [self makeTimeDateFrom:inputTimeString];    // it must be past otherwise it returns error.
            //            NSTimeInterval timeDiff = [nowDate timeIntervalSinceDate:inputPastDate];
            //
            //            NSInteger seconds = (NSInteger)timeDiff;
            //            int hours = (seconds % 86400) / 3600;
            //            int days = (seconds % (86400 * 30)) / 86400;
            //
            //             [NSString stringWithFormat:@"%02ld일 %02ld시간 전", (long)days, (long)hours];
            return [NSString stringWithFormat:@"%ld시간 뒤", hourInteger];
            
        } else if (hourInteger <= 24 && hourInteger >= 1) {
            return [NSString stringWithFormat:@"%ld시간 뒤", hourInteger];
        } else if (hourInteger == 0) {
            NSDate* nowDate = [self makeCurrentTimeDate];
            NSDate* inputPastDate = [self makeTimeDateFrom:inputTimeString];    // it must be past otherwise it returns error.
            NSTimeInterval timeDiff = [nowDate timeIntervalSinceDate:inputPastDate];
            
            NSInteger seconds = (NSInteger)timeDiff;
            int minutes = (seconds % 3600) / 60;
            
            return [NSString stringWithFormat:@"%02ld분 뒤", (long)minutes];
        } else {
            // hourInteger < 0
            // 에러
            return @"";
        }
    } else {
        // 에러
        return @"";
    }
}

- (NSString*) calculateAsHoursFrom: (NSString*)hourMinutesTimeString {
    NSArray* timeComponetns = [hourMinutesTimeString componentsSeparatedByString:@":"];
    if (timeComponetns.count >= 1) {
        NSString* hourString = [timeComponetns objectAtIndex:0];
        NSUInteger hourInteger = [hourString integerValue];
        if (hourInteger > 24) {
            //            NSDate* nowDate = [self makeCurrentTimeDate];
            //            NSDate* inputPastDate = [self makeTimeDateFrom:inputTimeString];    // it must be past otherwise it returns error.
            //            NSTimeInterval timeDiff = [nowDate timeIntervalSinceDate:inputPastDate];
            //
            //            NSInteger seconds = (NSInteger)timeDiff;
            //            int hours = (seconds % 86400) / 3600;
            //            int days = (seconds % (86400 * 30)) / 86400;
            //
            //             [NSString stringWithFormat:@"%02ld일 %02ld시간 전", (long)days, (long)hours];
            return [NSString stringWithFormat:@"%ld시간 전", hourInteger];
            
        } else if (hourInteger <= 24 && hourInteger >= 1) {
            return [NSString stringWithFormat:@"%ld시간 전", hourInteger];
        } else if (hourInteger == 0) {
            NSDate* nowDate = [self makeCurrentTimeDate];
            NSDate* inputPastDate = [self makeTimeDateFrom:inputTimeString];    // it must be past otherwise it returns error.
            NSTimeInterval timeDiff = [nowDate timeIntervalSinceDate:inputPastDate];
            
            NSInteger seconds = (NSInteger)timeDiff;
            int minutes = (seconds % 3600) / 60;
            
            return [NSString stringWithFormat:@"%02ld분 전", (long)minutes];
        } else {
            // hourInteger < 0
            // 에러
            return @"";
        }
    } else {
        // 에러
        return @"";
    }
}

@end

