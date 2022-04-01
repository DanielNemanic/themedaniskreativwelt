{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='sitemap_item'}
  <ul{if !isset($is_nested)} class="uk-list"{/if}>
    {foreach $links as $link}
      <li>
        <a id="{$link.id}" href="{$link.url}" title="{$link.label}">
          {$link.label}
        </a>
        {if isset($link.children) && $link.children|@count > 0}
          {include file='cms/_partials/sitemap-nested-list.tpl' links=$link.children is_nested=true}
        {/if}
      </li>
    {/foreach}
  </ul>
{/block}
