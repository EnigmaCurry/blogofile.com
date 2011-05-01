<%inherit file="_templates/site.mako" />
<%def name="head()">
  <%include file="head.mako" />
  <style type="text/css">
    ul.docs > li {
      margin-top: 0.5em;
      font-size: 1.2em;
    }
  </style>
</%def>

<div class="blog_post">
  <span class="post_prose">
    <h1>Documentation</h1>

    <p>Rather than having a single large book, Blogofile documentation is
    broken up into several smaller topical guides that ideally should
    be more easy to digest than a large self-referential tome.</p>

    <p>The documents below are listed in a suggested order of reading,
    however, each guide approaches their topic in a stand-alone
    fashion and they will repeat concepts from the other documents so
    as to reinforce the material discussed.</p>
    <ul class="docs">
      <li><a href="quickstart/">Quickstart Guide</a></li>
      <ul>
        <li>Covers Installation and creating a simple blog.</li>
      </ul>
      <li><a href="components/">Architecture Guide</a></li>
      <ul>
        <li>Introduces Controllers, Filters, and Templates.</li>
      </ul>
      <li><a href="command-line">Themes and Site Design</a></li>
      <li><a href="command-line">Command line features</a></li>
      <li><a href="plugin-development/">Plugin Development</a></li>
      <li><a href="contributors/">Contributors Guide</a></li>
    </ul>
    <h2>Old documents</h2>
    <ul class="docs">
      <li><a href="0.7.1/">Blogofile 0.7.1 documentation</a></li>
    </ul>
  </span>
</div>

