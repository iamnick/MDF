//
//  FirstViewController.m
//  MDF4
//
//  Created by Nick Stelzer on 5/30/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "FirstViewController.h"
#import "Stream.h"
#import "DetailsView.h"
#import "DataHolder.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"LoL Streams", @"LoL Streams");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
	streamArray = [[NSMutableArray alloc] init];
    [DataHolder CreateInstance];
    
	// Access XML Data from Justin.tv API
	url = [[NSURL alloc] initWithString:@"http://api.justin.tv/api/stream/list.xml?meta_game=League%20of%20Legends&limit=10"];
    request = [[NSURLRequest alloc] initWithURL:url];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    requestData = [NSMutableData data];
    
    // Parse the XML into an array of Stream objects
    NSData *xmlData = [self GetFileDataFromFile:@"streamData.xml"];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
    if (parser) {
    	[parser setDelegate:self];
        [parser parse];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	if (data) {
    	[requestData appendData:data];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	// Get path to Documents to save the XML
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fullPath = [[NSString alloc] initWithFormat:@"%@/%@", documentsDirectory, @"streamData.xml"];
    [requestData writeToFile:fullPath atomically:true];
}

-(NSData*)GetFileDataFromFile:(NSString*)filename
{
	NSString *filePath = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    filePath = [documentsDirectory stringByAppendingPathComponent:filename];
    if ([fileManager fileExistsAtPath:filePath]) {
    	return [NSData dataWithContentsOfFile:filePath];
    }
    return nil;
}

// XML Parsing

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	currentElement = [elementName copy];
    currentElementValue = [[NSMutableString alloc] init];
    if ([elementName isEqualToString:@"stream"]) {
    	// allocate and initialize Stream object
        currentStream = [[Stream alloc] init];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	[currentElementValue appendString:string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if ([elementName isEqualToString:@"stream"]) {
    	// add Stream object to array if a <stream> tag has ended
        [streamArray addObject:currentStream];
    } else if ([elementName isEqualToString:@"title"]) {
        // Only takes the first <title> tag value, the second one is incorrect
        if (![currentStream title]) {
        	[currentStream setTitle:currentElementValue];
        }
    } else if ([elementName isEqualToString:@"name"]) {
    	// Remove the "live_user_" prefix
        [currentElementValue setString:[currentElementValue substringFromIndex:10]];
    	[currentStream setUsername:currentElementValue];
    } else if ([elementName isEqualToString:@"stream_count"]) {
    	[currentStream setViewers:currentElementValue];
    } else if ([elementName isEqualToString:@"channel_view_count"]) {
    	[currentStream setTotalViews:currentElementValue];
    } else if ([elementName isEqualToString:@"channel_url"]) {
        [currentStream setStreamLink:currentElementValue];
    } 
}

// Table View Configuration

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [streamArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView2 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
    cell.textLabel.text = [[streamArray objectAtIndex:indexPath.row] title];
    
    UIFont *cellFont = [ UIFont fontWithName: @"Arial" size: 16.0 ];
	cell.textLabel.font  = cellFont;

	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[[DataHolder GetInstance] setStream:[streamArray objectAtIndex:indexPath.row]];
	DetailsView *detailsView = [[DetailsView alloc] initWithNibName:@"DetailsView" bundle:nil];
    if (detailsView) {
        [self.navigationController pushViewController:detailsView animated:true];
    }
}


@end
