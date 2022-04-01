{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $facets|count}
    <div id="search_filters">
    {block name='facets_title'}
      <h4 class="uk-text-uppercase">{l s='Filter By' d='Shop.Theme.Actions'}</h4>
    {/block}

    {block name='facets_clearall_button'}
      {if $activeFilters|count}
        <div id="_desktop_search_filters_clear_all" class="clear-all-wrapper">
          <button href="{$clear_all_link}" class="uk-button js-search-filters-clear-all">
            <i class="material-icons">&#xE14C;</i>
            {l s='Clear all' d='Shop.Theme.Actions'}
          </button>
        </div>
      {/if}
    {/block}

    {foreach from=$facets item="facet"}
      {if !$facet.displayed}
        {continue}
      {/if}

      <div class="uk-section uk-section-xsmall facet uk-clearfix facets">
          <h5>{$facet.label}</h5>
        {assign var=_expand_id value=10|mt_rand:100000}
        {assign var=_collapse value=true}
        {foreach from=$facet.filters item="filter"}
          {if $filter.active}{assign var=_collapse value=false}{/if}
        {/foreach}

        {if $facet.widgetType !== 'dropdown'}
          {block name='facet_item_other'}
            <ul id="facet_{$_expand_id}" class="uk-list">
              {foreach from=$facet.filters key=filter_key item="filter"}
                {if !$filter.displayed}
                  {continue}
                {/if}

                <li href="{$filter.nextEncodedFacetsURL}">
                  <label class="uk-inline facet-label{if $filter.active} active {/if}" for="facet_input_{$_expand_id}_{$filter_key}">
                    {if $facet.multipleSelectionAllowed}
                        <input
                          id="facet_input_{$_expand_id}_{$filter_key}"
                          href="{$filter.nextEncodedFacetsURL}"
                          type="checkbox"
                          class="uk-checkbox"
                          {if $filter.active }checked{/if}
                        >
                    {else}
                        <input
                          id="facet_input_{$_expand_id}_{$filter_key}"
                          href="{$filter.nextEncodedFacetsURL}"
                          type="radio"
                          name="filter {$facet.label}"
                          class="uk-radio"
                          {if $filter.active }checked{/if}
                        >
                    {/if}
                      {$filter.label}
                      {if $filter.magnitude}
                          <span class="uk-badge uk-position-right">{$filter.magnitude}</span>
                      {/if}
                  </label>
                </li>
              {/foreach}
            </ul>
          {/block}

        {else}

          {block name='facet_item_dropdown'}
            <ul id="facet_{$_expand_id}" class="collapse{if !$_collapse} in{/if}">
              <li>
                <div class="col-sm-12 col-xs-12 col-md-12 facet-dropdown dropdown">
                  <a class="select-title" rel="nofollow" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {$active_found = false}
                    <span>
                      {foreach from=$facet.filters item="filter"}
                        {if $filter.active}
                          {$filter.label}
                          {if $filter.magnitude}
                            ({$filter.magnitude})
                          {/if}
                          {$active_found = true}
                        {/if}
                      {/foreach}
                      {if !$active_found}
                        {l s='(no filter)' d='Shop.Theme.Global'}
                      {/if}
                    </span>
                    <i class="material-icons float-xs-right">&#xE5C5;</i>
                  </a>
                  <div class="dropdown-menu">
                    {foreach from=$facet.filters item="filter"}
                      {if !$filter.active}
                        <a
                          rel="nofollow"
                          href="{$filter.nextEncodedFacetsURL}"
                          class="select-list"
                        >
                          {$filter.label}
                          {if $filter.magnitude}
                            ({$filter.magnitude})
                          {/if}
                        </a>
                      {/if}
                    {/foreach}
                  </div>
                </div>
              </li>
            </ul>
          {/block}
        {/if}
      </div>
    {/foreach}
  </div>
{/if}
