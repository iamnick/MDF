//
//  DatabaseEntries.m
//  MDF2
//
//  Created by Nick Stelzer on 5/16/13.
//  Copyright (c) 2013 Nick Stelzer. All rights reserved.
//

#import "DatabaseEntries.h"

@implementation DatabaseEntries

static DatabaseEntries *_instance = nil;

+(void)CreateInstance
{
	if (_instance == nil) {
    	[[self alloc] init];
    }
}

+(DatabaseEntries*)GetInstance
{
	return _instance;
}

+(id)alloc
{
	_instance = [super alloc];
    return _instance;
}

-(id)init
{
	if (self = [super init]){
    	//custom init
        [self setTitles:@[@"The Evolution of Web Development for Mobile Devices", @"Why You Should Always Pay for Apps", @"Going native (or not): Five questions to ask mobile application developers", @"Could mobile telephony be harnessed for development in Papua New Guinea?", @"The potential use of mobile technology: enhancing accessibility and communication in a blended learning course.", @"Playing for Keeps", @"Right place, right time", @"Get out of the groove", @"Mobile Application Development: Web vs. Native", @"The potential use of mobile technology: enhancing accessibility and communication in a blended learning course", @"Frameworks of Process Improvement for Mobile Applications", @"Google Kills Android Menu Button, Replaces It with Action Bar"]];
        
        [self setAuthors:@[@"Zakas, Nicholas C.", @"Sega, Sascha", @"White, James", @"Watson, Amanda H. A.", @"Mayisela, Tabisa", @"Dockterman, Eliana", @"Hodson, Hal", @"de Lange, Catherine", @"Charland, Andre and LeRoux, Brian", @"Mayisela, Tabisa", @"Haeng-Kon Kim", @"Hachman, Mark"]];
        
    	[self setDocTypes:@[@"Academic Journal", @"Periodical", @"Academic Journal", @"Academic Journal", @"Academic Journal", @"Periodical", @"Periodical", @"Periodical", @"Academic Journal", @"Academic Journal", @"Academic Journal", @"Periodical"]];
        
        [self setSources:@[@"Communications of the ACM. Apr2013, Vol. 56 Issue 4, p42-48. 7p.", @"PC Magazine. Mar2013, p24-27, 4p.", @"Australasian Medical Journal. 2013, Vol. 6 Issue 1, p7-14. 8p.", @"Contemporary PNG Studies. Nov2012, Vol. 17, p46-52. 7p.", @"South African Journal of Education. Feb2013, Vol. 33 Issue 1, p1-18. 18p.", @"Time. 11/12/2012, Vol. 180 Issue 20, p24-24. 1p.", @"New Scientist. 3/30/2013, Vol. 216 Issue 2910, p17-17. 1/2p.", @"New Scientist. 8/25/2012, Vol. 215 Issue 2879, p46-49. 4p.", @"Communications of the ACM. May2011, Vol. 54 Issue 5, p49-53. 5p.", @"South African Journal of Education. Feb2013, Vol. 33 Issue 1, p1-18. 18p.", @"Engineering Letters. 2008, Vol. 16 Issue 4, p550-555. 6p.", @"PC Magazine. Jan2012, p1-1. 1p."]];
        
        [self setLinks:@[@"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/pdfviewer/pdfviewer?vid=6&sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&hid=28", @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/pdfviewer/pdfviewer?sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&vid=7&hid=28", @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/pdfviewer/pdfviewer?sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&vid=9&hid=28", @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/pdfviewer/pdfviewer?sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&vid=9&hid=28", @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/detail?vid=8&sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&hid=28&bdata=JnNpdGU9ZWhvc3QtbGl2ZQ%3d%3d#db=a9h&AN=85935755", @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/detail?sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&vid=11&hid=28&bdata=JnNpdGU9ZWhvc3QtbGl2ZQ%3d%3d#db=a9h&AN=83182835", @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/detail?sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&vid=11&hid=28&bdata=JnNpdGU9ZWhvc3QtbGl2ZQ%3d%3d#db=a9h&AN=86555701", @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/detail?sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&vid=11&hid=28&bdata=JnNpdGU9ZWhvc3QtbGl2ZQ%3d%3d#db=a9h&AN=79338645", @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/pdfviewer/pdfviewer?sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&vid=13&hid=28", @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/detail?vid=12&sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&hid=28&bdata=JnNpdGU9ZWhvc3QtbGl2ZQ%3d%3d#db=a9h&AN=85935755", @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/pdfviewer/pdfviewer?sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&vid=13&hid=28", @"http://web.ebscohost.com.oclc.fullsail.edu:81/ehost/detail?sid=34ce7747-f6e4-4ca1-af49-4a97d705c534%40sessionmgr12&vid=11&hid=28&bdata=JnNpdGU9ZWhvc3QtbGl2ZQ%3d%3d#db=a9h&AN=82054807"]];
    }
    return self;
}

// This function loops through all of the data entries, returning the index values of entries that match the document type we want
-(NSMutableArray*)GetValidEntries:(NSString*)ofDocType
{
	NSMutableArray *validEntries = [[NSMutableArray alloc] init];
	for (int i = 0; i < [_docTypes count]; i++) {
    	if ([_docTypes objectAtIndex:i] == ofDocType) {
        	NSNumber *validEntry = [NSNumber numberWithInteger:i];
    		[validEntries addObject:validEntry];
        }
    }
    return validEntries;
}

// This function gets all of the entry information at a specific index and returns an array containing all of it
// 0 = Title, 1 = Author, 2 = Source, 3 = EBSCO Link
-(NSArray*)GetSpecificEntry:(int)index
{
	NSArray *entry = @[[self.titles objectAtIndex:index], [self.authors objectAtIndex:index], [self.sources objectAtIndex:index], [self.links objectAtIndex:index]];
    return entry;
}
@end
