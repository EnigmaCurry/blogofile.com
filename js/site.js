//Blogofile should use $j for jQuery, not jQuery as that might be used by sphinx (if loaded)
var $j = jQuery;
try{
  //If sphinx was loaded, it needs to reference 'jQuery'
  var jQuery = sphinxJQuery;
  var $ = sphinxJQuery;
} catch(err) {}

$j(document).ready(function(){
    $j("#blogofile_tweets").tweet({
        avatar_size: 32,
          count: 5,
          query: "blogofile",
          loading_text: "searching twitter..."
          });
  });
