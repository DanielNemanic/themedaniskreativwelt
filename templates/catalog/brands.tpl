{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file=$layout}

{block name='content'}
  <div id="main" class="uk-width-1-1">
    {block name='brand_header'}
      <h1>{l s='Brands' d='Shop.Theme.Catalog'}</h1>
    {/block}

    {block name='brand_miniature'}
        {foreach from=$brands item=brand}
          {include file='catalog/_partials/miniatures/brand.tpl' brand=$brand}
        {/foreach}
    {/block}
  </div>
{/block}
