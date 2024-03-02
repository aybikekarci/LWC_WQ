import { LightningElement } from 'lwc';

export default class A02DataBinding extends LightningElement {

   isim='rana';

   // bu bir objectir
   kisi = {
      ismi:'Hasan',
      yas: '50',
      oyunlar:['tavla','okey','satranc']
   }

   // cift yonlu data binding

   ad= 'adim buraya yazilacak'
   handleChange(event) {
}
}