<%inherit file="_templates/site.mako" />

This is just a stupid photo gallery as a demonstration controller in the <a href="/documentation/controllers.html#a-simple-controller">Blogofile documentation.</a>

<table>
% for photo in photos:
  <tr><td><a href="${photo}.html"><img src="${photo}" height="175"></a></td><td>${photo}</td></tr>
% endfor
</table>
