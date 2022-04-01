{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div id="js-active-search-filters" class="{if $activeFilters|count}active_filters{else}uk-hidden{/if}" uk-alert>
    {block name='active_filters_title'}
        <h5>{l s='Active filters' d='Shop.Theme.Global'}</h5>
    {/block}

    {if $activeFilters|count}
        {foreach from=$activeFilters item="filter"}
            {block name='active_filters_item'}
                <button class="uk-button uk-button-link js-search-filters-clear-all" href="{$filter.nextEncodedFacetsURL}">
                    {l s='%1$s: ' d='Shop.Theme.Catalog' sprintf=[$filter.facetLabel]}
                    {$filter.label}
                    <span uk-icon="icon: close"></span>
                </button>
            {/block}
        {/foreach}
    {/if}
</div>
