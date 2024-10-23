import { LightningElement, wire } from 'lwc';
import { CurrentPageReference, NavigationMixin } from 'lightning/navigation';

import createGoogleSheet from '@salesforce/apex/CW_GoogleSheetsService.createGoogleSheet';

export default class Cw_main extends NavigationMixin(LightningElement) {
    handleClick(event) {
        createGoogleSheet()
        .then(result => {
            console.log(result);
            const workbook = JSON.parse(result);
            this[NavigationMixin.Navigate]({
                type: 'standard__webPage',
                attributes: {
                    url: workbook.spreadsheetUrl
                }
            });
        })
        .catch(error => {
            console.log(error);
            this.error = error;
        });
    }
}