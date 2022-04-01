{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='page.tpl'}

{block name='page_content_container' prepend}
    <div id="content-hook_order_confirmation" class="uk-width-1-1 uk-margin-top">
      {block name='order_confirmation_header'}
        <h3>
          <span uk-icon="icon:check"></span> {l s='Your order is confirmed' d='Shop.Theme.Checkout'}
        </h3>
      {/block}

      <p>
        {l s='An email has been sent to your mail address %email%.' d='Shop.Theme.Checkout' sprintf=['%email%' => $customer.email]}
        {if $order.details.invoice_url}
          {* [1][/1] is for a HTML tag. *}
          {l
            s='You can also [1]download your invoice[/1]'
            d='Shop.Theme.Checkout'
            sprintf=[
              '[1]' => "<a href='{$order.details.invoice_url}'>",
              '[/1]' => "</a>"
            ]
          }
        {/if}
      </p>

      {block name='hook_order_confirmation'}
        {$HOOK_ORDER_CONFIRMATION nofilter}
      {/block}
    </div>
{/block}

{block name='page_content_container'}
  <div id="content" class="uk-width-1-1">
    {block name='order_confirmation_table'}
      {include
        file='checkout/_partials/order-confirmation-table.tpl'
        products=$order.products
        subtotals=$order.subtotals
        totals=$order.totals
        labels=$order.labels
        add_product_link=false
      }
    {/block}

    <hr>

    {block name='order_details'}
      <div id="order-details" class="uk-margin uk-width-1-1">
        <h3>{l s='Order details' d='Shop.Theme.Checkout'}:</h3>
        <ul class="uk-list">
          <li>{l s='Order reference: %reference%' d='Shop.Theme.Checkout' sprintf=['%reference%' => $order.details.reference]}</li>
          <li>{l s='Payment method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.details.payment]}</li>
          {if !$order.details.is_virtual}
            <li>
              {l s='Shipping method: %method%' d='Shop.Theme.Checkout' sprintf=['%method%' => $order.carrier.name]}<br>
              <em>{$order.carrier.delay}</em>
            </li>
          {/if}
        </ul>
      </div>
    {/block}

    <hr>
  </div>

  {block name='hook_payment_return'}
    {if ! empty($HOOK_PAYMENT_RETURN)}
    <div id="content-hook_payment_return" class="uk-width-1-1">
      {$HOOK_PAYMENT_RETURN nofilter}
    </div>
    {/if}
  {/block}

  {block name='customer_registration_form'}
    {if $customer.is_guest}
      <div id="registration-form" class="uk-width-1-1">
        <h4>{l s='Save time on your next order, sign up now' d='Shop.Theme.Checkout'}</h4>
        {render file='customer/_partials/customer-form.tpl' ui=$register_form}
      </div>
    {/if}
  {/block}

  {block name='hook_order_confirmation_1'}
    {hook h='displayOrderConfirmation1'}
  {/block}

  {block name='hook_order_confirmation_2'}
    <div id="content-hook-order-confirmation-footer" class="uk-width-1-1">
      {hook h='displayOrderConfirmation2'}
    </div>
  {/block}
{/block}
