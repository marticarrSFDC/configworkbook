public with sharing class CW_GoogleSheetsService {
    private static final Integer METADATA_API_VERSION = 
		Integer.valueOf(new MetadataService.MetadataPort().endpoint_x.substringAfterLast('/'));

        public List<SelectOption> MetaDataTypes {get; set;}
        public String MetaDataType {get; set;}		
        public List<SelectOption> MetaDataItems {get; set;}
        public String MetaDataFolder {get; set;} 
        public String MetaDataItem {get; set;}	
        public String MetadataFileName {get; set;}
        public String MetadataFileData {get; set;}
        public MetadataService.AsyncResult AsyncResult {get; private set;}
        public String MetaDataRetrieveZip { get; private set; }	
    
    @AuraEnabled(cacheable=true)
    public static String createGoogleSheet(String sheetTitle) {
        String metadataResponse;
        String googleResponse;
        // try {
            metadataResponse = getMetadataCallout();
            googleResponse = createSheetCallout();
            return metadataResponse;
        // } catch (Exception e) {
        //     throw new AuraHandledException('Error occurred: ' + e.getMessage());
        // }
    }
    
    private static String createSheetCallout() {
        String requestBody = JSON.serialize(new Map<String, Object>{
            'properties' => new Map<String, Object>{ 
                'title' => 'Test' 
            }
        });

        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Google_Sheets_API/v4/spreadsheets');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(requestBody);

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            return res.getBody();
        } else {
            throw new CalloutException('Failed to create Google Sheet. Response: ' + res.getBody());
        }
    }

    private static String getMetadataCallout() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Salesforce_Metadata_API/services/data/v58.0/tooling/query?q=select+id,developername+from+customobject+order+by+developername');
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
        req.setTimeout(120000);

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            return res.getBody();
        } else {
            throw new CalloutException('Failed to list metadata types. Status code: ' + res.getBody());
        }
    }
}