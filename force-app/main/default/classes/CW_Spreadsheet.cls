public with sharing class CW_Spreadsheet {
    public SpreadsheetProperties properties;
    public List<CW_Sheet> sheets;

    public CW_Spreadsheet() {
        this.properties = new SpreadsheetProperties();
        this.sheets = new List<CW_Sheet>();
    }

    public void generate(String title, String sheetMetadata) {
        this.properties.title = title;
        this.sheets.add(new CW_ObjectsSheet(sheetMetadata));
    }

    public String toJsonString() {
        return JSON.serialize(this);
    }

    public class SpreadsheetProperties {
        public String title;
    }
}