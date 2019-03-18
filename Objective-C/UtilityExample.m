//
//  main.m
//  DoosanTimeExample
//
//  Created by Seoksoon Jang on 14/03/2019.
//  Copyright © 2019 JSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utility.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
//        시간 포맷
//        2019-03-13 17:57:59
//        1. 탑승시각 17:57
//        2. 현재시간 - 탑승시각 = 00:20
//        3. 2시간전. 24시간 이후는 18.08.23 같은 날짜로 표시
//        4. 30분 전에 신청하셨습니다. 현재시간 - 기준시간
//        5. 1시간 뒤 방문뒤를 예정입니다. 기준시간 - 현재시간
//        6. 방문 예정시간 2018-12-25 PM 05:30 반환
//        7. 서비스 요청일자 2018-12-11 오전 08:50 반환
        
        [Utility shared].inputTimeString = @"2019-03-14 20:20:00";
        NSString* inputTimeString = [Utility shared].inputTimeString;
        
        // 예외처리는 아직 안되어있음.
        
        // 1. 탑승시각 17:57
        NSString* output01 = [[Utility shared] transformToBoardingTimeString:inputTimeString];
        NSLog(@"output01 : %@", output01);
        
        // 2. 현재시간 - 탑승시각 = 00:20
        NSString* output02 = [[Utility shared] transformToOperatingTimeString:inputTimeString];
        NSLog(@"output02 : %@", output02);
        
        //3. 2시간전. 24시간 이후도 그냥 시간으로 표현
        NSString* output03 = [[Utility shared] transformToHowManyTimeHasPassedAsHoursSince:inputTimeString];
        NSLog(@"output03 : %@", output03);
        
        //4. 30분 전에 신청하셨습니다. 현재시간 - 기준시간
        NSString* output04 = [[Utility shared] transformToHowManyTimeHasPassedAsMinutesSince:inputTimeString];
        NSLog(@"output04 : %@", output04);

        // 5. 1시간 뒤 방문뒤를 예정입니다. 기준시간 - 현재시간
        NSString* output05 = [[Utility shared] transformToHowManyTimeLeftToFutureAsHoursSince:inputTimeString];
        NSLog(@"output05 : %@", output05);
        
        // 6. 방문 예정시간 2018-12-25 PM 05:30 반환=> 7. 서비스 요청일자 2018-12-11 오전 08:50 반환 공통
        NSString* output06 = [[Utility shared] transformToQRNTimeUIStandardFormatString:inputTimeString];
        NSLog(@"output06 : %@", output06);
        
    }
    return 0;
}
