//
//  CityDetailViewController.m
//  Code Challenge 2
//
//  Created by CHRISTINA GUNARTO on 10/30/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import "CityDetailViewController.h"
#import "WikipediaViewController.h"


@interface CityDetailViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *cityImage;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *cityNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *stateNameLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;


@end

@implementation CityDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.city.name;
    self.cityImage.image = [UIImage imageWithData:self.city.image];
    self.cityNameLabel.text = self.city.name;
    self.stateNameLabel.text = self.city.state;

    self.stateNameTextField.hidden = YES;
    self.cityNameTextField.hidden = YES;

}

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender
{
    if ([sender.title isEqualToString:@"Edit"])
    {
        self.stateNameTextField.hidden = NO;
        self.cityNameTextField.hidden = NO;
        self.editButton.title = @"Done";
    }

    else
    {
        self.city.name = self.cityNameTextField.text;
        self.city.state = self.cityNameTextField.text;

        self.stateNameTextField.hidden = NO;
        self.cityNameTextField.hidden = NO;
        self.stateNameTextField.text = @"";
        self.cityNameTextField.text = @"";

        self.editButton.title = @"Edit";

    }
}

- (IBAction)onWikiTapped:(UITapGestureRecognizer *)sender
{
    [self performSegueWithIdentifier: @"segue2" sender: self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segue2"])
    {
        WikipediaViewController *wikiVC = segue.destinationViewController;
        wikiVC.city = self.city;
    }
}




@end
