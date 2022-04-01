{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Sitemap' d='Shop.Theme.Global'}
{/block}

{block name='page_content_container'}
  <div class="uk-width-1-1 sitemap uk-child-width-1-1 uk-child-width-1-4@s" uk-grid>
        <div>
          <h3>{$our_offers}</h3>
          {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.offers}
        </div>
        <div>
          <h3>{$categories}</h3>
          {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.categories}
        </div>
        <div>
          <h3>{$your_account}</h3>
          {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.user_account}
        </div>
        <div>
          <h3>{$pages}</h3>
          {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.pages}
        </div>
  </div>
{/block}
