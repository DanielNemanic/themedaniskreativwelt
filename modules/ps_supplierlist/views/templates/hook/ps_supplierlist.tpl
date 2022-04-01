{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div id="search_filters_suppliers">
  <div class="facet">
    <h6 class="uk-text-uppercase facet-label">
      {if $display_link_supplier}<a href="{$page_link}" title="{l s='Suppliers' d='Shop.Theme.Catalog'}">{/if}
        {l s='Suppliers' d='Shop.Theme.Catalog'}
      {if $display_link_supplier}</a>{/if}
    </h6>
    <div>
      {if $suppliers}
        {include file="module:ps_supplierlist/views/templates/_partials/$supplier_display_type.tpl" suppliers=$suppliers}
      {else}
        <p>{l s='No supplier' d='Shop.Theme.Catalog'}</p>
      {/if}
    </div>
  </div>
</div>
