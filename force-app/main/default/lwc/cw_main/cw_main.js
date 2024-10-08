import { LightningElement, wire } from 'lwc';
import { CurrentPageReference, NavigationMixin } from 'lightning/navigation';

import createGoogleSheet from '@salesforce/apex/CW_GoogleSheetsService.createGoogleSheet';

export default class Cw_main extends NavigationMixin(LightningElement) {
    currentPageReference = null; 
    urlStateParameters = null;
    code = null;

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
        console.log(JSON.stringify(currentPageReference));
        if (currentPageReference) {
            this.urlStateParameters = currentPageReference.state;
            this.setParametersBasedOnUrl();
        }
    }

    setParametersBasedOnUrl() {
        this.code = this.urlStateParameters.code || null;
        console.log(JSON.stringify(this.urlStateParameters));
        console.log(this.code);
    }

    handleClick(event) {
        createGoogleSheet()
        .then(result => {
            console.log(result);
        })
        .catch(error => {
            console.log(error);
            this.error = error;
        });
    }
}