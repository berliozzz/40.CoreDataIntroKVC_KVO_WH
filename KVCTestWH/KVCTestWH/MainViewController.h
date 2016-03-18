//
//  MainViewController.h
//  KVCTestWH
//
//  Created by Nikolay Berlioz on 17.03.16.
//  Copyright © 2016 Nikolay Berlioz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITableViewController

//buttons
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UIButton *randomButton;
- (IBAction)actionClear:(UIButton *)sender;
- (IBAction)actionRandom:(UIButton *)sender;

//Output student info
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *dateOfBirthField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (weak, nonatomic) IBOutlet UITextField *averageGradeField;


@end
