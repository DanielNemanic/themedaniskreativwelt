{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div id="js-product-list-top" class="products-selection uk-child-width-1-1 uk-child-width-1-2@s"  uk-grid>
  <div>
    {if $listing.pagination.total_items > 1}
      <p>{l s='There are %product_count% products.' d='Shop.Theme.Catalog' sprintf=['%product_count%' => $listing.pagination.total_items]}</p>
    {elseif $listing.pagination.total_items > 0}
      <p>{l s='There is 1 product.' d='Shop.Theme.Catalog'}</p>
    {/if}
      <div uk-grid>
          <div class="uk-width-auto">
              <button class="uk-button uk-button-default " type="button"><span uk-icon="icon: grid"></span> {l s='Filter' d='Shop.Theme.Actions'}</button>
              <div class="uk-width-medium" uk-dropdown="mode: click">
                  <div class="uk-dropdown-grid uk-child-width-1-1" uk-grid>
                      <div>{$listing.rendered_facets nofilter}</div>
                  </div>
              </div>
          </div>
          <div class="uk-width-auto">
              {if $activeFilters|count}
              <button class="uk-button uk-button-default" type="button"><span uk-icon="icon: thumbnails"></span> {l s='Active filters' d='Shop.Theme.Global'}</button>
              <div class="uk-width-medium" uk-dropdown="mode: click">
                  <div class="uk-dropdown-grid uk-child-width-1-1" uk-grid>
                      <div>{$listing.rendered_active_filters nofilter}</div>
                  </div>
              </div>
              {/if}
          </div>
      </div>
  </div>
  <div>
      {block name='sort_by'}
        {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
      {/block}

  </div>
  <div class="uk-child-width-1-1 uk-hidden@s text-sm-center showing" uk-grid>
      <div>
          {l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=[
          '%from%' => $listing.pagination.items_shown_from ,
          '%to%' => $listing.pagination.items_shown_to,
          '%total%' => $listing.pagination.total_items
          ]}
      </div>
  </div>
</div>
