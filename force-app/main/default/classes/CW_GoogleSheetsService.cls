public with sharing class CW_GoogleSheetsService {
    private static final String GOOGLE_SHEETS_API_URL = 'https://sheets.googleapis.com/v4/spreadsheets/';
    
    @AuraEnabled(cacheable=true)
    public static String createGoogleSheet(String sheetTitle) {
        try {
            // Setup the HTTP request
            String requestBody = JSON.serialize(new Map<String, Object>{
                'properties' => new Map<String, Object>{ 'title' => 'Test' }
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
                throw new CalloutException('Failed to create Google Sheet. Status code: ' + res.getStatusCode());
            }
        } catch (Exception e) {
            throw new AuraHandledException('Error occurred: ' + e.getMessage());
        }
    }
    
    // Method to get data from Google Sheets
    @AuraEnabled(cacheable=true)
    public static String getGoogleSheetData(String sheetId, String range, String accessToken) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Google_Sheets_API/v4/spreadsheets' + sheetId + '/values/' + range);
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + accessToken);
        
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        if (res.getStatusCode() == 200) {
            return res.getBody();
        } else {
            throw new CalloutException('Error calling Google Sheets API: ' + res.getStatusCode() + ' ' + res.getBody());
        }
    }
}