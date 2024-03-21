import { LightningElement, wire } from 'lwc';
import accountListesiniGetir from '@salesforce/apex/AccountController.accountGetir'
import accountFiltrele from '@salesforce/apex/AccountController.accountFiltrele';

export default class WireFiltre extends LightningElement {

  accListesi
accHata
@wire(accountFiltrele, {accName: '$accFiltre'})
accountListesi({data,error}){

    if(data){
    this.accListesi = data
    this.accHata = undefined
    }else if( error){
   this.accHata = error
   this.accListesi = undefined
    }


}

accFiltre='Edge'

   handleAccountIsim(event){
      this.accFiltre = event.target.value
   }
}