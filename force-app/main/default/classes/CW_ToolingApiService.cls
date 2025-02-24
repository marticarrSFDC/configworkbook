public with sharing class CW_ToolingApiService {
    @AuraEnabled(cacheable=false)
    public static String getMetadataCallout() {
        ToolingApi tooling = new ToolingApi();
        return JSON.serialize(tooling.describeGlobal());
    }
}