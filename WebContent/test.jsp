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
</script>
</head>
<body>

<p>Toggle slideUp() and slideDown()</p>
<p1>This is a paragraph.</p1>


</body>
</html>
