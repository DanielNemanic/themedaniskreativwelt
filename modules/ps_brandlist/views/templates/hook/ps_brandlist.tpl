{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div id="search_filters_brands brandlist">
  <div class="facet">
    <h6 class="uk-text-uppercase">
      {if $display_link_brand}<a href="{$page_link}" title="{l s='Brands' d='Shop.Theme.Catalog'}">{/if}
        {l s='Brands' d='Shop.Theme.Catalog'}
      {if $display_link_brand}</a>{/if}
    </h6>
    <div>
      {if $brands}
        {include file="module:ps_brandlist/views/templates/_partials/$brand_display_type.tpl" brands=$brands}
      {else}
        <p>{l s='No brand' d='Shop.Theme.Catalog'}</p>
      {/if}
    </div>
  </div>
</div>
