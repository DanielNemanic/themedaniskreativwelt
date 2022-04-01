{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<!doctype html>
<html lang="">
  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>
  <body>

    <div id="layout-error">
      {block name='content'}
        <p>Hello world! This is HTML5 Boilerplate.</p>
      {/block}
    </div>

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}
  </body>
</html>
