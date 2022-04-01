{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div id="order-summary-content" class="uk-margin">
  <div class="uk-width-1-1">
      <h4>{l s='Please check your order before payment' d='Shop.Theme.Checkout'}</h4>
  </div>

  <div class="uk-width-1-1">
      <h4>
        {l s='Addresses' d='Shop.Theme.Checkout'}
        <span class="uk-float-right">
          <a href="#checkout-addresses-step" class="editStep uk-text-small " uk-scroll uk-icon="icon:pencil"> {l s='edit' d='Shop.Theme.Actions'}</a>
        </span>
      </h4>
  </div>

  <div class="uk-width-1-1 uk-child-width-1-2@s" uk-grid>
    <div>
      <h5>{l s='Your Delivery Address' d='Shop.Theme.Checkout'}</h5>
      {$customer.addresses[$cart.id_address_delivery]['formatted'] nofilter}
    </div>
    <div>
      <h5>{l s='Your Invoice Address' d='Shop.Theme.Checkout'}</h5>
      {$customer.addresses[$cart.id_address_invoice]['formatted'] nofilter}
    </div>
  </div>

  <hr>

  <div class="uk-width-1-1">
    <h4>
      {l s='Shipping Method' d='Shop.Theme.Checkout'}
      <span class="uk-float-right">
        <a href="#checkout-delivery-step" class="editStep uk-text-small " uk-scroll uk-icon="icon:pencil"> {l s='edit' d='Shop.Theme.Actions'}</a>
      </span>
    </h4>

    <div class="uk-width-1-1 summarySelectedCarrier">
      <div>
          {if $selected_delivery_option.logo}
            <img loading="lazy" src="{$selected_delivery_option.logo}" alt="{$selected_delivery_option.name}">
          {else}
          {/if}
        {$selected_delivery_option.name}
      </div>
      <div>
        {$selected_delivery_option.delay}
      </div>
      <div>
        {$selected_delivery_option.price}
      </div>
    </div>
  </div>

  <hr>

  <div class="uk-width-1-1">
    {block name='order_confirmation_table'}
      {include file='checkout/_partials/order-final-summary-table.tpl'
         products=$cart.products
         products_count=$cart.products_count
         subtotals=$cart.subtotals
         totals=$cart.totals
         labels=$cart.labels
         add_product_link=true
       }
    {/block}
  </div>
</div>
