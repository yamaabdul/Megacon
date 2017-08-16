<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("p").click(function(){
        $("p1").slideToggle();
    });
});

function add_fields() {
    document.getElementById('wrapper').innerHTML += '<tr><td>Lassen:&nbsp;</td><input type="text"></tr><br>';
}
</script>
</head>
<body>


<tr><td>Toggle slideUp() and slideDown()</td>
    					 
<td>This is a paragraph.</td>
</tr>

<div class="content" id="wrapper"> 
    						</div>

							
    						<tr><td>Voeg een bewerking toe:</td> 
							<td>
							<select name=bewerking onchange="add_fields();"style="width:175px";>
			 			    <option value="0">--maak keuze--</option>
			  				<option value="1">lassen</option>
			  				<option value="2">UM-las</option>
			  				<option value="3">kottereen</option>
			  				<option value="4">dr/frezen</option>
							</select>
							</td></tr> 

</body>
</html>
