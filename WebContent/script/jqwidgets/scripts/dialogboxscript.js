        function dlgClose(){
            var whitebg = document.getElementById("white-background");
            var dlg = document.getElementById("dlgbox");
            whitebg.style.display = "none";
            dlg.style.display = "none";
        }
        
        function showDialog(autoClose){
            var whitebg = document.getElementById("white-background");
            var dlg = document.getElementById("dlgbox");
            whitebg.style.display = "block";
            dlg.style.display = "block";
            
            var winWidth = window.innerWidth;
            var winHeight = window.innerHeight;
            
            dlg.style.left = (winWidth/2) - 480/2 + "px";
            dlg.style.top = "150px";
            if(autoClose) setTimeout(function() { dlgClose(); }, 3000);
        }
        
        //function als niet gelukt 
        function showDialogNotOK(){
            var redbg = document.getElementById("red-background");
            var dlgb = document.getElementById("dlgbbox");
            redbg.style.display = "block";
            dlgb.style.display = "block";
            
            var winWidth = window.innerWidth;
            var winHeight = window.innerHeight;
            
            dlgb.style.left = (winWidth/2) - 480/2 + "px";
            dlgb.style.top = "150px";
            //setTimeout(function() { dlgCloseNotOk(); }, 3000);
        }
        
        function dlgCloseNotOk(){
            var redbg = document.getElementById("red-background");
            var dlgb = document.getElementById("dlgbbox");
            redbg.style.display = "none";
            dlgb.style.display = "none";
        }