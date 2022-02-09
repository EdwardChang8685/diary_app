//
//  ViewController.m
//  Diary
//
//  Created by Ed Chang on 2022/2/8.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cofigureTableview];
    self.content = @[@"1", @"2"];
    [self loadJsonData];
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
    
    if ([jsonObject isKindOfClass: [NSDictionary class]])
    {
        NSDictionary *dict = (NSDictionary *)jsonObject;
        NSLog(@"JSON Dictionary = %@", dict);
    }
    else
    {
        NSLog(@"Error while Deserializing the JSON data.");
    }
}

# pragma mark - TableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _content.count;
}

# pragma mark - TableView DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: CellIdentifier];
    }
    cell.textLabel.text =  [_content objectAtIndex: indexPath.row];
    return cell;
}

@end

