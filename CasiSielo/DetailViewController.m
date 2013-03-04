//
//  DetailViewController.m
//  CasiSielo
//
//  Created by Jay Versluis on 19/02/2013.
//  Copyright (c) 2013 Jay Versluis. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        
        // let's format the date slightly nicer
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        
        NSDate *myDate = [self.detailItem valueForKey:@"timeStamp"];
        
        self.detailDescriptionLabel.text = [formatter stringFromDate:myDate];
        
        // and display the date to our datePicker
        self.datePicker.date = myDate;
        
        // self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    // rename the back button
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:nil action:nil];
//    self.navigationItem.backBarButtonItem = backButton;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDatePicker:nil];
    [self setSaveButton:nil];
    [super viewDidUnload];
}
- (IBAction)changeDate:(id)sender {
    
    // let's format the date slightly nicer
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateStyle:NSDateFormatterMediumStyle];

    self.detailDescriptionLabel.text = [formatter stringFromDate:self.datePicker.date];
    
    // enable the save button
    self.saveButton.enabled = YES;
    
}

- (IBAction)saveChanges:(id)sender {
    
    [self.detailItem setValue:self.datePicker.date forKey:@"timeStamp"];
    [self.delegate detailViewDidSave];
}
@end
