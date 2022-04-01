{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='cart_summary_items_subtotal'}
  <div class="uk-card uk-card-default uk-card-body cart-summary-line cart-summary-items-subtotal" id="items-subtotal">
    <dt>{$cart.summary_string}</dt>
    <dd>{$cart.subtotals.products.amount}</dd>
  </div>
{/block}
