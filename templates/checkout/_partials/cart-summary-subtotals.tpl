{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-card uk-card-default uk-card-body cart-summary-subtotals-container">
  {foreach from=$cart.subtotals item="subtotal"}
    {if $subtotal.value && $subtotal.type !== 'tax'}
      <div class="cart-summary-line cart-summary-subtotals" id="cart-subtotal-{$subtotal.type}">
        <dt>{$subtotal.label}</dt>
        <dd>{$subtotal.value}</dd>
      </div>
    {/if}
  {/foreach}
</div>

