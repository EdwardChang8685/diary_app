//
//  ViewController.m
//  Diary
//
//  Created by Ed Chang on 2022/2/8.
//

#import "DiaryListController.h"
#import "DiaryModel.h"
#import "Mantle.h"
#import "DiaryDetailViewController.h"
#import "DiaryCell.h"

#define userDefaultDiaries @"userDefaultDiaries"

@interface DiaryListController ()

@end

@implementation DiaryListController

    UITableView *tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cofigureTableview];
    [self registerCellWithNib];
    [self configureNavigation: @"Note"];
    [self loadDiariesFromUserDefault];
    [self addObserver];
}

- (void)addObserver {
    NSKeyValueObservingOptions option = NSKeyValueObservingOptionNew;
    [self addObserver: self
           forKeyPath: @"diaries"
              options: option
              context: NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    NSLog(@"Diaries did edited");
    
    [self.tableView reloadData];
    [self saveDiariesToUserDefault];
}

- (void) registerCellWithNib {
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:@"TableViewCell"];
}


- (void) configureNavigation:(NSString*) title

{
    self.title = title;
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem: UIBarButtonSystemItemCompose
                                   target: self
                                   action: @selector(createNewDiary:)];
    
    self.navigationItem.rightBarButtonItem = editButton;
}


- (void)createNewDiary:(id)sender
{
    DiaryDetailViewController *newDiaryController = [[DiaryDetailViewController alloc] init];
    UINavigationController *navConrtroller = [[UINavigationController alloc] initWithRootViewController: newDiaryController];
    newDiaryController.delegate = self;
    
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

- (void)loadJsonData
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
    
    if ([jsonObject isKindOfClass: [NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)jsonObject;
        self.dict = dict;
        [self packageJsonToDataModel];
    } else {
        NSLog(@"Error while Deserializing the JSON data.");
    }
}

- (void) packageJsonToDataModel {
    NSError *error;
    Diary *model = [MTLJSONAdapter modelOfClass: Diary.class
                             fromJSONDictionary: self.dict
                                          error: &error];
    
    self.diaries = model.diaries;
}

- (void)loadDiariesFromUserDefault {
    
    NSData *diariesData = [[NSUserDefaults standardUserDefaults] objectForKey: userDefaultDiaries];
    
    if (diariesData) {
        NSError *unarchivedError = nil;
        NSSet *set = [NSSet setWithArray:@[NSMutableArray.class, [DiaryInfo class]]];
        NSMutableArray<DiaryInfo*> *unarchiveArray = [NSKeyedUnarchiver unarchivedObjectOfClasses: set
                                                                                         fromData: diariesData
                                                                                            error: &unarchivedError];
        self.diaries = unarchiveArray;
        NSLog(@"Load data From UserDefault");
        NSLog(@"unarchive error: %@",unarchivedError);
        
    } else {
        [self loadJsonData];
        [self saveDiariesToUserDefault];
        NSLog(@"Load data From Json Data");
    }
}

- (void) saveDiariesToUserDefault {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSError *archivedError = nil;
    NSData *archiveData = [NSKeyedArchiver archivedDataWithRootObject: self.diaries
                                                requiringSecureCoding: NO
                                                                error: &archivedError];
    [defaults setObject: archiveData forKey: userDefaultDiaries];
    [defaults synchronize];
    NSLog(@"archive error: %@",archivedError);
}

# pragma mark - DiaryDetailVCDelegate

- (void)editDiaryInfo:(DiaryInfo *)diary andAtRow:(NSIndexPath *)indexpath {
    [[self mutableArrayValueForKey:@"diaries"] replaceObjectAtIndex:indexpath.row withObject:diary];
    self.diaries[indexpath.row] = diary;
}

- (void) AddDiaryInfo:(DiaryInfo*) diary {
    [[self mutableArrayValueForKey:@"diaries"] addObject:diary];
}


# pragma mark - TableView Delegate

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DiaryDetailViewController *newDiaryController = [[DiaryDetailViewController alloc] init];
    UINavigationController *navConrtroller = [[UINavigationController alloc] initWithRootViewController:newDiaryController];
    
    newDiaryController.diary = self.diaries[indexPath.row];
    newDiaryController.indexpath = indexPath;
    newDiaryController.delegate = self;
    
    
    [self presentViewController: navConrtroller
                       animated: YES
                     completion: nil];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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
        [[self mutableArrayValueForKey:@"diaries"] removeObjectAtIndex: indexPath.row];
    }
}

@end

