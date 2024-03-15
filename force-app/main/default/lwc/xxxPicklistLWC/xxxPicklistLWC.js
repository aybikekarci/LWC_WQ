import { track ,LightningElement } from 'lwc';

export default class XxxPicklistLWC extends LightningElement {
chosen='';
optionsArray= [ {label : 'TURKIYE' , value:'Ankara'},
                {label : 'FRANSA' , value:'Paris'},
                {label : 'CANADA' , value:'Ottawa'}
               ]

get cityOptions(){

    return this.optionsArray
} 

handlePicklist(event){

    this.chosen = event.detail.value;
}

}