#import "ViewController.h"
#import <limits.h>
@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Initialize table data
	NSString *tempString;
    self.tableData = [[NSMutableArray alloc] init];
    
    BOOL flag = YES;
    unsigned long long int fir=1,sec=1,next;
    tempString = [NSString stringWithFormat: @"%llu", fir];
    [self.tableData addObject:tempString];
    tempString = [NSString stringWithFormat: @"%llu", sec];
    [self.tableData addObject:tempString];
    
    while(flag){
        if(ULLONG_MAX-fir<sec){
            break;
        } else{
            next=fir+sec;
        }
        tempString = [NSString stringWithFormat: @"%llu", next];
        [self.tableData addObject:tempString];
        fir=sec;
        sec=next;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    return cell;
}
@end
