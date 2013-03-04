//
//  DetailViewController.h
//  CasiSielo
//
//  Created by Jay Versluis on 19/02/2013.
//  Copyright (c) 2013 Jay Versluis. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailViewDelegate;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) id <DetailViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

- (IBAction)changeDate:(id)sender;
- (IBAction)saveChanges:(id)sender;


@end

@protocol DetailViewDelegate

- (void)detailViewDidSave;

@end