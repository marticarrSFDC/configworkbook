public virtual with sharing class CW_Sheet {
    public SheetProperties properties;
    public List<GridData> data;


    public String toJsonString() {
        return JSON.serialize(this);
    }

    public class SheetProperties {
        public String title;
    }

    public class GridData {
        public Integer startRow = 0;
        public Integer startColumn = 0;
        public List<RowData> rowData = new List<RowData>();
    }

    public class RowData {
        public List<CellData> values;

        public RowData() {
            this.values = new List<CellData>();
        }

        public void add(String s) {
            this.values.add(new CellData(s));
        }
    }

    public class CellData {
        public Map<String, Object> userEnteredValue;
        public CellFormat userEnteredFormat;

        public CellData() {
            this.userEnteredFormat = new CellFormat();
        }

        public CellData(String value) {
            this();
            this.userEnteredValue = new Map<String, Object> {
                'stringValue' => value
            };
        }
    }

    public class CellFormat {
        public String horizontalAlignment;
        public String wrapStrategy;
        public Map<String, Object> textFormat;

        public CellFormat() {
            this.horizontalAlignment = 'LEFT';
            this.wrapStrategy = 'CLIP';
            this.textFormat = new Map<String, Object> {
                'bold' => false
            };
        }
    }
}