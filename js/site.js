//Blogofile should use $j for jQuery, not jQuery as that might be used by sphinx (if loaded)
var $j = jQuery;
try{
  //If sphinx was loaded, it needs to reference 'jQuery'
  var jQuery = sphinxJQuery;
  var $ = sphinxJQuery;
} catch(err) {}


function paragraphPermalinks(){
  $("span.post_prose").children("p[id]").each(
      function(i) {
        p = $(this);
        a = $("<a/>");
        a.attr('href',"#p"+(i+1));
        a.attr('class','paragraph_permalink');
        a.text(" #");
        a.attr("title","Link to this paragraph");
        p.append(a);
      }
      )
}

function twitterSidebar(){
  $j("#blogofile_tweets").tweet({
      avatar_size: 32,
        count: 5,
        query: "blogofile",
        loading_text: "searching twitter..."
        });
}

$j(document).ready(function(){
    twitterSidebar();
    paragraphPermalinks();
  });
