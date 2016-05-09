//
//  NSString+PhoneNum.m
//  BigFan
//
//  Created by MaxWellPro on 16/5/9.
//  Copyright © 2016年 QuanYan. All rights reserved.
//

#import "NSString+PhoneNum.h"

@implementation NSString (PhoneNum)

/**
 * 中国移动：China Mobile
 * 134,135,136,137,138,139,147,150,151,152,157,158,159,1705,178,182,183,184,187,188
 */
static NSString *kChinaMobile = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
/**
 * 中国联通：China Unicom
 * 130,131,132,145,155,156,1709,176,185,186
 */
static NSString *kChinaUnicom = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
/**
 * 中国电信：China Telecom
 * 133,1349`,153,1700,177,180,181,189
 */
static NSString *kChinaTelecom = @"(^1(33|349|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
/**
 * 大陆地区固话及小灵通
 * 区号：010,020,021,022,023,024,025,027,028,029
 * 号码：七位或八位
 */
static NSString *kPHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";

- (BOOL)isValidateByRegex:(NSString *)regex{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

- (BOOL)isPhoneNumber {
    if (self.length != 11) {
        return NO;
    }
    
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,147,150,151,152,157,158,159,1705,178,182,183,184,187,188
     * 联通号段: 130,131,132,145,155,156,1709,176,185,186
     * 电信号段: 133,1349`,153,1700,177,180,181,189
     */
    if ([self isValidateByRegex:kChinaMobile] || [self isValidateByRegex:kChinaUnicom] || [self isValidateByRegex:kChinaTelecom])
        return YES;
    else
        return NO;
}

- (BOOL)isChinaMobile {
    return [self isValidateByRegex:kChinaMobile];
}

- (BOOL)isChinaUnicom {
    return [self isValidateByRegex:kChinaUnicom];
}

- (BOOL)isChinaTelecom {
    return [self isValidateByRegex:kChinaTelecom];
}

- (BOOL)isSpecialPlane {
    return [self isValidateByRegex:kPHS];
}

- (NSString *)getPhoneNumType {
    return [self isChinaMobile]? @"中国移动": ([self isChinaUnicom]? @"中国联通":([self isChinaTelecom]? @"中国电信": @"未知"));
}

@end
