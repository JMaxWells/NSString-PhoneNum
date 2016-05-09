# NSString-PhoneNum
电话号码正则表达式

## 代码

``` swift
/**
 *  手机号有效性
 */
- (BOOL)isPhoneNumber;

/**
 *  是否属于中国移动
 */
- (BOOL)isChinaMobile;

/**
 *  是否属于中国联通
 */
- (BOOL)isChinaUnicom;

/**
 *  是否属于中国电信
 */
- (BOOL)isChinaTelecom;

/**
 *  是否是固话、小灵通
 */
- (BOOL)isSpecialPlane;

/**
 *  获取运营商
 */
- (NSString *)getPhoneNumType;
```
