{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<ul class="uk-list">
  {foreach from=$suppliers item=supplier name=supplier_list}
    {if $smarty.foreach.supplier_list.iteration <= $text_list_nb}
      <li>
        <a href="{$supplier['link']}" title="{$supplier['name']}">
          {$supplier['name']}
        </a>
      </li>
    {/if}
  {/foreach}
</ul>
