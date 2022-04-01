{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<ul class="uk-list brandText">
  {foreach from=$brands item=brand name=brand_list}
    {if $smarty.foreach.brand_list.iteration <= $text_list_nb}
      <li class="facet-label">
        <a href="{$brand['link']}" title="{$brand['name']}">
          {$brand['name']}
        </a>
      </li>
    {/if}
  {/foreach}
</ul>
