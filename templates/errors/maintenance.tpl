{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='layouts/layout-error.tpl'}

{block name='content'}

  <div id="uk-width-1-1">
    {block name='page_header_container'}
      <div>
        {block name='page_header_logo'}
            <div class="logo"><img loading="lazy" src="{$shop.logo}" alt="logo"></div>
        {/block}

        {block name='hook_maintenance'}
          {$HOOK_MAINTENANCE nofilter}
        {/block}

        {block name='page_header'}
          <h1>{block name='page_title'}{l s='We\'ll be back soon.' d='Shop.Theme.Global'}{/block}</h1>
        {/block}
      </div>
    {/block}

    {block name='page_content_container'}
      <div id="content" class="uk-width-1-1">
        {block name='page_content'}
          {$maintenance_text nofilter}
        {/block}
      </div>
    {/block}

    {block name='page_footer_container'}{/block}
  </div>

{/block}
