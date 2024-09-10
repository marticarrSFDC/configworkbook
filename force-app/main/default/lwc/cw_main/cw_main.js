import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

import authorize from '@salesforce/apex/CW_GoogleSheetsService.authorize';

export default class Cw_main extends NavigationMixin(LightningElement) {
    handleClick(event) {
        authorize()
        .then(result => {
            this[NavigationMixin.Navigate](
                {
                    type: "standard__webPage",
                    attributes: {
                        url: result
                }
            }, true);
        })
        .catch(error => {
            console.log(error);
            this.error = error;
        });
    }
}