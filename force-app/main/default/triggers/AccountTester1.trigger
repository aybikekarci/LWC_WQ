trigger AccountTester1 on Account (before insert , before update , before delete , after insert , after update, after delete, after undelete) {
  SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  {   
        // account record olustugunda acc ismine INSERTED ekleyiniz
        
            for( account acc: trigger.new){
                acc.name = acc.Name + ' INSERTED';
            }
            
        }
        WHEN BEFORE_UPDATE  {
            // account record update edildiginde acc ismine UPDATED ekleyiniz
       for( account acc: trigger.new){
                acc.name = acc.Name + ' UPDATED';
            }
            
        }
        WHEN BEFORE_DELETE  { }
        WHEN AFTER_INSERT   { }
        WHEN AFTER_UPDATE   { }
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }
    } 
}