{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="block-contact">
  <h3>{$title}</h3>
  <div>
    {if $rss_links}
      <ul class="uk-list">
        {foreach from=$rss_links item='rss_link'}
          <li><a href="{$rss_link['link']}" title="{$rss_link['title']}" target="_blank">{$rss_link['title']}</a></li>
        {/foreach}
      </ul>
    {else}
      <p>{l s='No RSS feed added' d='Shop.Theme.Catalog'}</p>
    {/if}
  </div>
</div>
