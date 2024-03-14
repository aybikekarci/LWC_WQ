import { LightningElement } from 'lwc';

export default class Grandparent extends LightningElement {
 
   arabaModeli=''

   handleArabaModeli(eve){
       this.arabaModeli =eve.target.value
   
         console.log(this.arabaModeli) // system.debug
   }
   
}