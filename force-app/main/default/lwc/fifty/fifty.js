import { LightningElement, wire } from 'lwc';
import callToCS from '@salesforce/apex/FiftyPriceFromCustomSettings.callToCS';
import image from '@salesforce/resourceUrl/FiftyCentFiles';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Fifty extends LightningElement {
    pic_url = image + '/50-cent.jpg';
    priceToShow;
    oldPrice;
    arrow_pic_url;
    word;
    @wire(callToCS) price({error, data}){
        if (data) {
            console.log(data);
            this.priceToShow = Math.round(data[0]);
            this.chooseWord();
            this.oldPrice = Math.round(data[1]);
            this.renderDifference(data);
        } else {
            console.log(error);
            this.showNotification(error);
        }
    }

    showNotification(error) {
        const evt = new ShowToastEvent({
            title: 'Something went wrong!',
            message: error,
            variant: 'red',
        });
        this.dispatchEvent(evt);
    }

    renderDifference(arrayOfPrices) {
        if (arrayOfPrices[0] == arrayOfPrices[1]) {
            this.howMuchIsDifferent = 'Fifty is stable!💪'
        } else if (arrayOfPrices[0] > arrayOfPrices[1]) {
            this.howMuchIsDifferent = `+ ${arrayOfPrices[0] - arrayOfPrices[1]}`;
            this.arrow_pic_url = image + '/up.png'
        } else if (arrayOfPrices[0] < arrayOfPrices[1]) {
            this.howMuchIsDifferent = `- ${arrayOfPrices[1] - arrayOfPrices[0]}`
            this.arrow_pic_url = image + '/down.png'
        }
    }

    chooseWord() {
        let num = this.priceToShow.toString().split('');
        
        switch (num[num.length - 1]){
            case '1':
                this.priceToShow += ' рубль';
                break;
            case '0':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                this.priceToShow += ' рублей';
                break;
            case '2':
            case '3':
            case '4':
                this.priceToShow += ' рубля';
                break;
        }
    }

    }