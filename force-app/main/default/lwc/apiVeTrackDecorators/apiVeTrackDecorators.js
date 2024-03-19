import { LightningElement, api, track } from 'lwc';

export default class ApiVeTrackDecorators extends LightningElement {

// @api decorator
@api recordId;

yeniad='xxxx'

handleAd(event){

this.yeniad=event.target.value
console.log('SAYFA RENDER EDILDI')
}

// @track decorator
@track
birey ={
    isim: 'Ali',
    yas:30
}
handleIsim(event){
this.birey.isim = event.target.value

console.log('BIREYIN ISMI >>> '+ this.birey.isim)

}

// liste icin @track decorator

@track
cicekListesi = [

    {
    id:1,
    name:'Gul',
    familya:'DikenliGuller',
    
    } ,
    {
    id:2,
     name:'Lale',
     familya:'Lalegiller',
    
    }
  ]


  cicekIsmi

  handleCicekName(event){
this.cicekIsmi =event.target.value

  }

cicekFamilyasi
handleFamilya(event){
this.cicekFamilyasi = event.target.value

}
cicekId=3

handleCicekEkle(){
let yeniCicek =  {
    id:this.cicekId,
    name:this.cicekIsmi,
    familya: this.cicekFamilyasi,
    
    } 
    // listeyi console da gormek icin gereken kod
    console.log(JSON.stringify(this.cicekListesi))


this.cicekListesi.push(yeniCicek) // push methodu ile listeye ekleme
this.cicekId++

}
}