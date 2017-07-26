<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
animatedcollapse.addDiv('pos', 'fade=1,speed=200')
animatedcollapse.addDiv('standaardond', 'fade=1,speed=200 ,hide=1')
animatedcollapse.addDiv('dimensie', 'fade=1,speed=200 ,hide=1')

animatedcollapse.ontoggle=function($, divobj, state){ //fires each time a DIV is expanded/contracted 
	//$: Access to jQuery 
	//divobj: DOM reference to DIV being expanded/ collapsed. Use "divobj.id" to get its ID 
	//state: "block" or "none", depending on state 
} 

function add_fields() {
    document.getElementById('wrapper').innerHTML += '<span>Lassen: <input type="text"></span>\r\n<br><br>';
}

</script>
</head>
<body>
<!-- 	<div id=pos>
								<br>Positie
								<input type=text name=pos style="width:30px;" maxlength=10 value='A'>
						</div> 
<button>Toggle between hiding and showing the paragraphs</button>

<p>This is a paragraph with little content.</p>
<p>This is another small paragraph.</p> -->

				<select name=bewerking Bewerkaan(); style="width:175px";>
			 			    <option value="0">--maak keuze--</option>
			  				<option value="1">lassen</option>
			  				<option value="2">UM-las</option>
			  				<option value="3">kottereen</option>
			  				<option value="4">dr/frezen</option>
							</select>
<input type="button" id="more_fields" onclick="add_fields();" value="Add More" />
<div id="room_fileds">
  
    <div class="content" id="wrapper"> 
        
         
    </div>
</div>
</body>
</html>
