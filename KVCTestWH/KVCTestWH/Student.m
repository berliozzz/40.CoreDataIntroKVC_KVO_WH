//
//  Student.m
//  KVCTestWH
//
//  Created by Nikolay Berlioz on 17.03.16.
//  Copyright © 2016 Nikolay Berlioz. All rights reserved.
//

#import "Student.h"

@implementation Student

static NSString* firstNames[] = {
    @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice",
    @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
    @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
    @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
    @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
    @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
    @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
    @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
    @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie"
};

static NSString* lastNames[] = {
    
    @"Farrah", @"Laviolette", @"Heal", @"Sechrest", @"Roots",
    @"Homan", @"Starns", @"Oldham", @"Yocum", @"Mancia",
    @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock",
    @"Vanderlinden", @"Simms", @"Gilroy", @"Brann", @"Bodden",
    @"Lenz", @"Gildersleeve", @"Wimbish", @"Bello", @"Beachy",
    @"Jurado", @"William", @"Beaupre", @"Dyal", @"Doiron",
    @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby",
    @"Waltman", @"Michaud", @"Kobayashi", @"Sherrick", @"Woolfolk",
    @"Holladay", @"Hornback", @"Moler", @"Bowles", @"Libbey",
    @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook"
};

static int namesCount = 50;

static int oneYears = (24 * 60 * 60 * 365); // interval one year (31536000 seconds)

static NSTimeInterval intervalSeconds;

static NSCalendar *calendar = nil;

NSInteger month = 0;

- (Student*) randomStudentProperties:(Student*)student
{
    student.firstName = firstNames[arc4random() % namesCount];
    student.lastName = lastNames[arc4random() % namesCount];
    
    intervalSeconds = (double)(arc4random() % (oneYears * 6) + (oneYears * 10));
    student.dateOfBirth = [NSDate dateWithTimeIntervalSince1970:intervalSeconds];
    
    student.gender = arc4random() % 2 ? GenderMale : GenderFemale;
   
    student.averageGrade = ((float)(arc4random() % 301) + 200) / 100;
    
    return student;
}

- (Student*) resetProperties:(Student*)student
{
    [self willChangeValueForKey:@"firstName"];
    [self willChangeValueForKey:@"lastName"];
    [self willChangeValueForKey:@"dateOfBirth"];
    [self willChangeValueForKey:@"gender"];
    [self willChangeValueForKey:@"averageGrade"];
    
    _firstName = @"";
    _lastName = @"";
    _dateOfBirth = [NSDate dateWithTimeIntervalSinceReferenceDate:0];
    _gender = 0;
    _averageGrade = 0;
    
    [self didChangeValueForKey:@"firstName"];
    [self didChangeValueForKey:@"lastName"];
    [self didChangeValueForKey:@"dateOfBirth"];
    [self didChangeValueForKey:@"gender"];
    [self didChangeValueForKey:@"averageGrade"];
    
    return student;
}

@end






