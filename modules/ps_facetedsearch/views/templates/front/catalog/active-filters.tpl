{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div id="js-active-search-filters" class="{if $activeFilters|count}active_filters{else}uk-hidden{/if}">
  {if $activeFilters|count}
      <ul class="uk-list uk-list-striped">
          {foreach from=$activeFilters item="filter"}
            {block name='active_filters_item'}
                <li>
                    <div class="uk-inline uk-width-1-1">
                    {l s='%1$s: ' d='Shop.Theme.Catalog' sprintf=[$filter.facetLabel]}
                    {$filter.label}
                    <a class="js-search-filters-clear-all uk-position-right" href="{$filter.nextEncodedFacetsURL}" uk-icon="icon: trash"></a>
                    </div>
                </li>
            {/block}
          {/foreach}
      </ul>
  {/if}
</div>
