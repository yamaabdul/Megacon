<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery demo</title>
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
 
<p>one</p>
<div><p>two</p></div>
<p>three</p>

<script>
var response = '';
$.ajax({ type: "GET",   
         url: "http://www.google.de",   
         async: false,
         success : function(text)
         {
             response = text;
         }
         
alert(response);
});
</script>
 
</body>
</html>