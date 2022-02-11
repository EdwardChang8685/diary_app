//
//  ViewController.m
//  Diary
//
//  Created by Ed Chang on 2022/2/8.
//

#import "ViewController.h"
#import "DiaryModel.h"
#import "Mantle.h"
#import "DiaryDetailViewController.h"
#import "DiaryCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cofigureTableview];
    [self configureNavigation: @"Note"];
    [self loadJSONData];
    
}

- (void)configureNavigation:(NSString*) title

{
    self.title = title;
    
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem: UIBarButtonSystemItemAdd
                                   target: self
                                   action: @selector(createNewDiary:)];
    
    self.navigationItem.rightBarButtonItem = editButton;
    
}

- (void)createNewDiary:(id)sender
{
    DiaryDetailViewController *newDiaryController = [[DiaryDetailViewController alloc] init];
    UINavigationController *navConrtroller = [[UINavigationController alloc] initWithRootViewController:newDiaryController];
    [self presentViewController: navConrtroller
                       animated: YES
                     completion: nil];
}

- (void)cofigureTableview
{
    self.tableView = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview: self.tableView];
}

- (void)loadJSONData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource: @"Diary_json" ofType: @"json"];
    // Retrieve local JSON file called example.json
    
    NSError *error = nil;
    
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    // Load the file into an NSData object called JSONData
    
    id jsonObject = [NSJSONSerialization
                     JSONObjectWithData: jsonData
                     options: NSJSONReadingAllowFragments
                     error: &error];
    
    if ([jsonObject isKindOfClass: [NSDictionary class]])
    {
        NSDictionary *dict = (NSDictionary *)jsonObject;
        self.dict = dict;
        [self mantleModel];
    }
    else
    {
        NSLog(@"Error while Deserializing the JSON data.");
    }
    
}

- (void) mantleModel
{
    NSError *error;
    Diary *model = [MTLJSONAdapter modelOfClass: Diary.class
                             fromJSONDictionary: self.dict
                                          error: &error];
    
    self.diaries = model.diaries;
}

# pragma mark - TableView Delegate

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

# pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.diaries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    DiaryCell *cell = (DiaryCell *) [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    
    if (cell == nil) {
        cell = [[DiaryCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: CellIdentifier];
    }
    
    [cell configureCell: self.diaries[indexPath.row]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.diaries removeObjectAtIndex: indexPath.row];
        [tableView reloadData];
    }
}

@end

