<aura:application >
    <Ltng:require styles="/resource/bootstrap"/>
    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header navbar-brand">
                Lightning Contacts
            </div>      
        </div>    
    </div>
    <div class="container">
       <div class="row">
           <div class="col-sm-4">
               <c:SearchBar />
               <br></br>
               <c:ContactsList />
           </div> 
           <div class="col-sm-8">
               <c:ContactDetails />
           </div>
        </div>
    </div>
    
</aura:application>