trigger AccountTrigger on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete ) {
/*
 While creating an Account 
 if the industry field is null assign ‘Banking’ to Industry field
         AND 
While updating an Account assign ‘Education’ to Industry field

  */ 
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  { 
            for( account acc: trigger.new){
                
                acc.Rating= 'Hot';
                acc.BillingState ='ARKANSAS';
              
                //While creating an Account 
             // if the industry field is null assign ‘Banking’ to Industry field      
                 if(acc.Industry == null   ){ // String.isBlank(acc.Industry)
                     acc.Industry='Banking';
                   }  

            }
   
            
            
            
           
        }
        WHEN BEFORE_UPDATE  {
            // Eger accountun type kismi update ediliyor ise
            // ve accountun industry si bos ise 
            // o zaman indusrty kismi education olsun
         /*  //   OLABILDIGINCE IC ICE LOOPLADAN UZAK DURMAK GEREKIR  ZIRA COK KAYNAK KULLANIRLAR
            for( account accOld : trigger.old){
                for( account accNew : trigger.new){
                    if( (accOld.Type != accNew.Type) && accNew.Industry == null   ){
                        
                        accNew.Industry= 'Education';
                    }
                    
                }
                
            }
      */
           AccountTriggerHandler.industryKontrol( trigger.new , trigger.oldMap );
           
            
            /* 
            for(account acc : trigger.new){
               if(acc.Industry == null   ){ // String.isBlank(acc.Industry)
                     acc.Industry='Education';
                }   
            }*/
            
        }
        WHEN BEFORE_DELETE  {   }
        WHEN AFTER_INSERT   { 
        /* list<contact> cntList= new List<contact>();
            for( account acc2: trigger.new){
                contact cnt = new Contact();
                cnt.LastName = 'cnt of '+ acc2.Name;
                cnt.AccountId= acc2.id;
               cntList.add(cnt);
            } 
            insert cntList;
            
*/          
            
            AccountTriggerHandler.accRecursionExample(trigger.new  );
            
        }
        WHEN AFTER_UPDATE   {  }
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { 
        
      list<id> accIdleri = new List<Id>();
         // yontem 1  
            for( account acc: trigger.new){
                
              accIdleri.add(acc.Id);          		 		
                
            } 
      // yontem 2
     SET<id> accIdleri2 = trigger.newMap.keySet();       
   
            // kodun ana kismi
            list<contact> cntList = [SELECT id,Description FROM contact WHERE accountId IN: accIdleri2  ];	           
            
            for(contact cnt : cntList ){
                
                cnt.Description = ' senin account copten cikti';
                
            }
            
     update cntList;            
        
        // calisan ama hatali sayilan kod    
            for(account acc: trigger.new){
                list<contact> cntList1 =[SELECT id ,Description FROM contact WHERE accountId =: acc.id ];
                for(contact cnt : cntList1 ){
                   cnt.Description = ' senin account copten cikti' + '\n' + 
                       'bak ikinci satir 222';
  
                }
                update cntList1;
            }                       
        }
    }    
}