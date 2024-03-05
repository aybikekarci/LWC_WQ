import { LightningElement } from 'lwc';

export default class A03ConditionalRenderingA extends LightningElement {

   sart1 = true
   sart2 = false

   // TEZHARUAT

   flag = true
   handleClick(){
      this.flag = !this.flag
   }

   // parola sorgulama

   flag2 = false
   inputParola=''
   gercekParola = 'Elma'
   handleChange(event){

 // inputtan aldigim deger eger GERCEK parola ole AYNI ise Parola TRUE olsun

   this.inputParola = event.target.value

   if ( this.parola == this.inputParola)  {
       this.flag2 = true; 
   }else{
      this.flag2 = false;
   }
}

// Conditional Rendering Yeni

durum1 = true
durum2 = false
durum3 = false
}