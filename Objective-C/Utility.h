//
//  Utility.h
//  SingleTonTimeDoosan
//
//  Created by Seoksoon Jang on 14/03/2019.
//  Copyright © 2019 JSS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utility : NSObject
@property (atomic, strong) NSString* inputTimeString;
@property (nonatomic, strong) NSString* doosanStandardTimeFormat;   // @"yyyy-MM-dd HH:mm:ss"
+ (Utility*)shared;

/*
 * 기준문자열 예: 2019-03-13 17:57:59
 */

/**
 * 기준시간 문자열을 탑승시간 기준 문자열로 바꿔줍니다.
 * 예 : @"2019-03-13 17:57:59" => @"17:57"
 */
- (NSString*) transformToBoardingTimeString: (NSString*)inputTimeString;

/**
 * 기준시간 문자열을 운행시간 기준 문자열로 바꿔줍니다.
 * 현재시간 - 탑승시각 = 00:20
 * 예 : @"2019-03-13 17:58:09"(현재시간) - @"2019-03-13 17:57:59" => @"00:10"
 */
- (NSString*) transformToOperatingTimeString: (NSString*)inputTimeString;

/**
 * 기준시간부터 현재시간에서 얼마나 시간이 시로 흘렀는지 표현.
 * 요구사항: 2시간전. 24시간 이후는 (18.08.23 같은 날짜로 표시) => 두 시간간의 차이를 표현해야 하므로 24시간 넘어가도 무조건 시간 단위 차이로 표현했음.
 */
- (NSString*) transformToHowManyTimeHasPassedAsHoursSince: (NSString*)inputTimeString;

/**
 * 기준시간부터  현재시간에서 얼마나 시간이 분으로 흘렀는지 표현.
 * 요구사항: 30분 전에 신청하셨습니다. 현재시간 - 기준시간
 */
- (NSString*) transformToHowManyTimeHasPassedAsMinutesSince: (NSString*)inputTimeString;

/**
 * 기준시간까지 현재시간부터 얼마나 시간이 남았는지 시로 표현.
 * 요구사항: 앞으로 1시간 뒤 방문할 예정입니다. 기준시간 - 현재시간
 */
- (NSString*) transformToHowManyTimeLeftToFutureAsHoursSince: (NSString*)inputTimeString;

/**
 * 서버 기준 문자열을 두산 UI 출력 표준시간으로 변환(예: 2018-12-25 PM 05:30)
 * 요구사항: 방문 예정시간 2018-12-25 PM 05:30 반환
 */
- (NSString*) transformToQRNTimeUIStandardFormatString: (NSString*)inputTimeString;

@end

NS_ASSUME_NONNULL_END
