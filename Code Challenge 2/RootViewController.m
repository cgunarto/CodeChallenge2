//
//  ViewController.m
//  Code Challenge 2
//
//  Created by CHRISTINA GUNARTO on 10/30/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import "RootViewController.h"
#import "CityDetailViewController.h"
#import "City.h"


@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *cityArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end

@implementation RootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    City *surabaya = [[City alloc] initWithName:@"Surabaya"
                                      withState:@"Java"
                                      withImage:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.eternitydental.com/wp-content/uploads/2012/11/surabaya.jpg"]]
                                        withURL:[NSURL URLWithString:@"http://en.wikipedia.org/wiki/Surabaya"]];

    City *singapore = [[City alloc] initWithName:@"Singapore"
                                      withState:@"Singapore"
                                       withImage:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://media-cdn.tripadvisor.com/media/photo-o/03/9b/2e/11/singapore.jpg"]]
                                         withURL:[NSURL URLWithString:@"http://en.wikipedia.org/wiki/Singapore"]];

    City *belmont = [[City alloc] initWithName:@"Belmont"
                                     withState:@"California"
                                     withImage:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.menupix.com/town_img/BelmontCAHP.jpg"]]
                                       withURL:[NSURL URLWithString:@"http://en.wikipedia.org/wiki/Belmont"]];

    City *berkeley = [[City alloc] initWithName:@"Berkeley"
                                      withState:@"California"
                                      withImage:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://upload.wikimedia.org/wikipedia/commons/7/7f/UCBerkeleyCampus.jpg"]]
                                        withURL:[NSURL URLWithString:@"http://en.wikipedia.org/wiki/Berkeley"]];

    self.cityArray = [@[surabaya, singapore, belmont, berkeley]mutableCopy];

}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    City *city = self.cityArray[indexPath.row];
    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.state;
    cell.imageView.image = [[UIImage alloc] initWithData:city.image];

    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cityArray.count;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {

        UIAlertController *deleteOrCancelAlert = [UIAlertController alertControllerWithTitle:@"Confirm Delete" message:@"Are you sure you want to delete this city?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *delete = [UIAlertAction actionWithTitle:@"DELETE" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                 {
                                     [self.cityArray removeObjectAtIndex:indexPath.row];
                                     [self.tableView reloadData];

                                 }];
        [deleteOrCancelAlert addAction:delete];

        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:nil];

        [deleteOrCancelAlert addAction:cancel];

        [self presentViewController:deleteOrCancelAlert animated:YES completion:nil];
        
    }
}



- (IBAction)onEditButtonPressed:(UIBarButtonItem *) editButtonX
{

    self.tableView.editing = !self.tableView.editing;

    if (self.tableView.editing)
    {
        [editButtonX setTitle:@"Done"];
    }

    else
    {
        [editButtonX setTitle:@"Edit"];
        //Change through data model, not the view.
        self.tableView.editing = NO;
    }

}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CityDetailViewController *cityDetailVC = segue.destinationViewController;
    NSInteger rowNumber = [self.tableView indexPathForSelectedRow].row;
    City *cityChosen = [self.cityArray objectAtIndex:rowNumber];
    cityDetailVC.city = cityChosen;
}
 



@end
