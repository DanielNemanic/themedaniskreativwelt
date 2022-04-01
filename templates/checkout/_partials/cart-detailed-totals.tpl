{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='cart_detailed_totals'}
<div class="cartDetailedTotals">

  <div class="uk-child-width-1-2 uk-grid-small" uk-grid>
    {foreach from=$cart.subtotals item="subtotal"}
      {if $subtotal.value && $subtotal.type !== 'tax'}
          <div>
              {if 'products' == $subtotal.type}
                  {$cart.summary_string}
              {else}
                  {$subtotal.label}
              {/if}
          </div>
          <div class="uk-text-right">
              {if 'discount' == $subtotal.type}-&nbsp;{/if}{$subtotal.value}
          </div>
          {if $subtotal.type === 'shipping'}
              <div class="uk-width-1-1"><small class="value">{hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}</small></div>
          {/if}
      {/if}
    {/foreach}
  </div>

  {block name='cart_summary_totals'}
    {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
  {/block}

  {block name='cart_voucher'}
    {include file='checkout/_partials/cart-voucher.tpl'}
  {/block}
</div>
{/block}
