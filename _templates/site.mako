<%inherit file="base.mako" />
<%def name="head()">
  <%include file="head.mako" />
</%def>
<%def name="header()">
  <%include file="header.mako" />
</%def>
<%def name="footer()">
  <%include file="footer.mako" />
</%def>
<%def name="sidebar()" args="posts=posts">
  <div class="right_sidebar">
    <%include file="sidebar.mako" />
  </div>
</%def>

