<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    ${self.head()}
  </head>
  <body>
    <div id="content">
      ${self.header()}
      <div id="main_block">
        <div id="prose_block">
          ${self.body()}
        </div><!-- End Prose Block -->
        ${self.sidebar()}
      </div><!-- End Main Block -->
      <div id="footer">
        ${self.footer()}
      </div> <!-- End Footer -->
    </div> <!-- End Content -->
  </body>
</html>

<%def name="head()">
  <title>Your blog name here</title>
</%def>
<%def name="header()">
  Your custom header
</%def>
<%def name="footer()">
  Your custom footer
</%def>
<%def name="sidebar()">
</%def>

