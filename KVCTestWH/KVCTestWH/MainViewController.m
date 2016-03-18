//
//  MainViewController.m
//  KVCTestWH
//
//  Created by Nikolay Berlioz on 17.03.16.
//  Copyright © 2016 Nikolay Berlioz. All rights reserved.
//

#import "MainViewController.h"
#import "Student.h"

@interface MainViewController ()

@property (strong, nonatomic) Student *student;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.student = [[Student alloc] init];
    
}



#pragma mark - Observing

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"observeValueForKeyPath: %@\nofObject: %@\nchange: %@",keyPath, object, change);
}

#pragma mark - Actions

- (IBAction)actionClear:(UIButton *)sender
{
    //create observer
    [self createObserver];
    
    self.student = [self.student resetProperties:self.student];

    [self printClearFields];
    
    //remove observer
    [self removeAllObservers];
}

- (IBAction)actionRandom:(UIButton *)sender
{
    //create observer
    [self createObserver];
    
    //change properties of student
    self.student = [self.student randomStudentProperties:self.student];
    
    //print
    [self printStudent];
    
    //remove observer
    [self removeAllObservers];
    
    [self.tableView reloadData];
}

#pragma mark - Private Methods

- (void) printClearFields
{
    self.firstNameField.text = @"";
    self.lastNameField.text = @"";
    self.genderControl.selectedSegmentIndex = 1;
    self.averageGradeField.text = @"";
    self.dateOfBirthField.text = @"";
}

- (void) printStudent
{
    self.firstNameField.text = self.student.firstName;
    self.lastNameField.text = self.student.lastName;
    self.genderControl.selectedSegmentIndex = self.student.gender ? GenderMale : GenderFemale;
    self.averageGradeField.text = [NSString stringWithFormat:@"%.2f", self.student.averageGrade];
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"dd.MM.yyyy"];
    self.dateOfBirthField.text = [dateformatter stringFromDate:self.student.dateOfBirth];
}

- (void) createObserver
{
    [self.student addObserver:self forKeyPath:@"firstName"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:NULL];
    [self.student addObserver:self forKeyPath:@"lastName"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:NULL];
    [self.student addObserver:self forKeyPath:@"gender"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:NULL];
    [self.student addObserver:self forKeyPath:@"averageGrade"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:NULL];
    [self.student addObserver:self forKeyPath:@"dateOfBirth"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:NULL];
}

- (void) removeAllObservers
{
    [self.student removeObserver:self forKeyPath:@"firstName"];
    [self.student removeObserver:self forKeyPath:@"lastName"];
    [self.student removeObserver:self forKeyPath:@"gender"];
    [self.student removeObserver:self forKeyPath:@"averageGrade"];
    [self.student removeObserver:self forKeyPath:@"dateOfBirth"];
}



@end





