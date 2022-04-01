{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='checkout/_partials/order-confirmation-table.tpl'}

{block name='order-items-table-head'}
<div id="order-items" class="uk-width-1-1">
  <h3>
    {if $products_count == 1}
       {l s='%product_count% item in your cart' sprintf=['%product_count%' => $products_count] d='Shop.Theme.Checkout'}
    {else}
       {l s='%products_count% items in your cart' sprintf=['%products_count%' => $products_count] d='Shop.Theme.Checkout'}
    {/if}
  	<a href="{url entity=cart params=['action' => 'show']}"><span class="step-edit"><i class="material-icons edit">mode_edit</i> {l s='edit' d='Shop.Theme.Actions'}</span></a>
  </h3>
</div>
{/block}
