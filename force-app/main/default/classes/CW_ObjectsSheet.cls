public with sharing class CW_ObjectsSheet extends CW_Sheet {
    public CW_ObjectsSheet(String objectMetadataString) {
        this.properties = new SheetProperties();
        this.properties.title = 'All Objects';
        this.data = new List<GridData>();
        
        Map<String, Object> objectMetadata = (Map<String, Object>)JSON.deserializeUntyped(objectMetadataString);
        List<Object> objects = (List<Object>)objectMetadata.get('sobjects');

        GridData data = new GridData();
        for(Object o : objects) {
            Map<String, Object> obj = (Map<String, Object>)o;
            RowData row = new RowData();
            row.add((String)obj.get('label'));
            row.add((String)obj.get('name'));
            Boolean isCustom = (Boolean)obj.get('custom');
            row.add(isCustom ? 'Custom' : 'Standard');
            row.add((String)obj.get('keyPrefix'));
            row.add((String)obj.get('inUse'));
            row.add((String)obj.get('internalSharing'));
            row.add((String)obj.get('externalSharing'));
            row.add((String)obj.get('description'));
            row.add((String)obj.get('developerNotes'));
            data.rowData.add(row);
        }
        this.data.add(data);
    }
}