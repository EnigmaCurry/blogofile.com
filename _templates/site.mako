<%inherit file="base.mako" />
<%def name="filter(chain)">
  ${bf.filter.run_chain(chain, capture(caller.body))}
</%def>
<%def name="head()">
  <%include file="head.mako" />
</%def>
<%def name="header()">
  <%include file="header.mako" />
</%def>
<%def name="footer()">
  <%include file="footer.mako" />
</%def>
<%def name="sidebar()">
  <div class="right_sidebar">
    <%include file="sidebar.mako"  args="posts=posts" />
  </div>
</%def>
