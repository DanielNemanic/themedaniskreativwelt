{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="categoryProducts">
  <h2>
    {if $products|@count == 1}
      {l s='%s other product in the same category:' sprintf=[$products|@count] d='Shop.Theme.Catalog'}
    {else}
      {l s='%s other products in the same category:' sprintf=[$products|@count] d='Shop.Theme.Catalog'}
    {/if}
  </h2>

  {include file="catalog/_partials/product-slider.tpl" product=$product}
</div>
