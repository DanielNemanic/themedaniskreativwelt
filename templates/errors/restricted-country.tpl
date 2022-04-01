{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='layouts/layout-error.tpl'}

{block name='content'}
  <div id="uk-width-1-1">

    {block name='page_header_container'}
      <div class="page-header">
        <div class="logo"><img loading="lazy" data-src="{$shop.logo}" alt="logo" uk-img></div>
        {block name='page_header'}
          <h1>{block name='page_title'}{$shop.name}{/block}</h1>
        {/block}
      </div>
    {/block}

    {block name='page_content_container'}
      <div id="content" class="uk-width-1-1">
        {block name='page_content'}
          <h2>{l s='403 Forbidden' d='Shop.Theme.Global'}</h2>
          <p>{l s='You cannot access this store from your country. We apologize for the inconvenience.' d='Shop.Theme.Global'}</p>
        {/block}
      </div>
    {/block}

    {block name='page_footer_container'}{/block}
  </div>
{/block}
