public with sharing class CW_GoogleSheetsService {
    private static final String GOOGLE_SHEETS_API_URL = 'https://sheets.googleapis.com/v4/spreadsheets/';

    private static CW_GoogleOAuthService authenticator;
    private static String auth_code {get; set;}

    @AuraEnabled(cacheable=true)
    public static String authorize() {
        CW_GoogleOAuthService authenticator = CW_GoogleOAuthService.getInstance();
        return authenticator.getLoginUrl();
    }

    @AuraEnabled(cacheable=true)
    public static void authenticate() {
        // pull auth code
        // request auth token
    }
    
    @AuraEnabled(cacheable=true)
    public static String createGoogleSheet(String sheetId, String range, String accessToken) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(GOOGLE_SHEETS_API_URL + sheetId + '/values/' + range);
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
    
    // Method to get data from Google Sheets
    @AuraEnabled(cacheable=true)
    public static String getGoogleSheetData(String sheetId, String range, String accessToken) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(GOOGLE_SHEETS_API_URL + sheetId + '/values/' + range);
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