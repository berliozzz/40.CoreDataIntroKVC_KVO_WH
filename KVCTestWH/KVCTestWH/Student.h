//
//  Student.h
//  KVCTestWH
//
//  Created by Nikolay Berlioz on 17.03.16.
//  Copyright © 2016 Nikolay Berlioz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef enum
{
    GenderMale,
    GenderFemale
}Gender;

@interface Student : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSDate *dateOfBirth;
@property (assign, nonatomic) Gender gender;
@property (assign, nonatomic) CGFloat averageGrade;

@property (weak, nonatomic) Student *friend;

- (Student*) randomStudentProperties:(Student*)student;
- (Student*) resetProperties:(Student*)student;

@end
