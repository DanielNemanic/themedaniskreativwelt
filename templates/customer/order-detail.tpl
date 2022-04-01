{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Order details' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {block name='order_infos'}
    <div class="uk-child-width-1-1" uk-grid>
      <div id="orderInfos">
        <div uk-grid>
          <div class="uk-width-expand@s">
            <strong>
              {l
              s='Order Reference %reference% - placed on %date%'
              d='Shop.Theme.Customeraccount'
              sprintf=['%reference%' => $order.details.reference, '%date%' => $order.details.order_date]
              }
            </strong>
          </div>
          <div class="uk-width-auto@s">
            {if $order.details.reorder_url}
              <a href="{$order.details.reorder_url}" class="uk-button uk-button-text">
                <span uk-icon="icon: cart"></span> {l s='Reorder' d='Shop.Theme.Actions'}
              </a>
            {/if}
          </div>
        </div>
      </div>
    </div>
    <hr>
    <div class="uk-child-width-1-1" uk-grid>
      <div>
        <div class="uk-child-width-1-2" uk-grid>
          <div>
            <dt>{l s='Carrier' d='Shop.Theme.Checkout'}</dt>
            <dd>{$order.carrier.name}</dd>
            <dt>{l s='Payment method' d='Shop.Theme.Checkout'}</dt> <dd>{$order.details.payment}</dd>
          </div>
          <div>
              {if $order.details.invoice_url}
                <div>
                  <a href="{$order.details.invoice_url}">
                    <span uk-icon="icon:file-pdf"></span> {l s='Download your invoice as a PDF file.' d='Shop.Theme.Customeraccount'}
                  </a>
                </div>
              {/if}

              {if $order.details.recyclable}
                <div>
                  {l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.Customeraccount'}
                </div>
              {/if}
          </div>
        </div>
      </div>
    </div>
    <div class="uk-child-width-1-1 uk-margin-top" uk-grid>
      <div>
        {if $order.details.gift_message}
          <dt>{l s='You have requested gift wrapping for this order.' d='Shop.Theme.Customeraccount'}</dt>
          <dd><b>{l s='Message' d='Shop.Theme.Customeraccount'}:</b> {$order.details.gift_message nofilter}</dd>
        {/if}
      </div>
    </div>
  {/block}

  <hr>

  {block name='order_history'}
    <div class="uk-child-width-1-1" uk-grid>
      <div id="orderHistory">
        <h3>{l s='Follow your order\'s status step-by-step' d='Shop.Theme.Customeraccount'}</h3>

        <table class="uk-table uk-table-divider">
          <thead>
          <tr>
            <th>{l s='Date' d='Shop.Theme.Global'}</th>
            <th>{l s='Status' d='Shop.Theme.Global'}</th>
          </tr>
          </thead>
          <tbody>
          {foreach from=$order.history item=state}
            <tr>
              <td>{$state.history_date}</td>
              <td>
                <span class="label label-pill {$state.contrast}" style="background-color:{$state.color}">
                  {$state.ostate_name}
                </span>
              </td>
            </tr>
          {/foreach}
          </tbody>
        </table>
      </div>
    </div>
  {/block}

  <hr>

  {if $order.follow_up}
    <div class="uk-child-width-1-1" uk-grid>
      <div class="box">
        <dt>{l s='Click the following link to track the delivery of your order' d='Shop.Theme.Customeraccount'}</dt>
        <dd><a href="{$order.follow_up}" >{$order.follow_up}</a></dd>
      </div>
    </div>

    <hr>
  {/if}

  {block name='addresses'}
    <div class="uk-child-width-1-1 uk-child-width-1-2@s" uk-grid>
      <div>
          <h4>{l s='Invoice address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.invoice.alias]}</h4>
          <address>{$order.addresses.invoice.formatted nofilter}</address>
      </div>
      <div>
        {if $order.addresses.delivery}
          <h4>{l s='Delivery address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.delivery.alias]}</h4>
          <address>{$order.addresses.delivery.formatted nofilter}</address>
        {/if}
      </div>
    </div>
  {/block}

  <hr>

  {$HOOK_DISPLAYORDERDETAIL nofilter}

  {block name='order_detail'}
    <div class="uk-child-width-1-1" uk-grid>
      <div>
        {if $order.details.is_returnable}
          {include file='customer/_partials/order-detail-return.tpl'}
        {else}
          {include file='customer/_partials/order-detail-no-return.tpl'}
        {/if}
      </div>
    </div>
  {/block}

  <hr>

  {block name='order_carriers'}
    <div class="uk-margin">
      {if $order.shipping}
        {foreach from=$order.shipping item=line}
          <div class="uk-child-width-1-1 uk-child-width-1-2@s" uk-grid>
            <div>
              <b>{l s='Carrier' d='Shop.Theme.Checkout'}:</b> {$line.carrier_name}
            </div>
            <div>
              <b>{l s='Tracking number' d='Shop.Theme.Checkout'}:</b> {$line.tracking nofilter}
            </div>
          </div>
          <div class="uk-child-width-1-1 uk-child-width-1-3@s uk-margin-remove" uk-grid>
            <div>
              <b>{l s='Date' d='Shop.Theme.Global'}:</b> {$line.shipping_date}
            </div>
            <div>
              <b>{l s='Weight' d='Shop.Theme.Checkout'}:</b> {$line.shipping_weight}
            </div>
            <div>
              <b>{l s='Shipping cost' d='Shop.Theme.Checkout'}:</b> {$line.shipping_cost}
            </div>
          </div>
        {/foreach}
      {/if}
    </div>
  {/block}

  <hr>

  {block name='order_messages'}
    {include file='customer/_partials/order-messages.tpl'}
  {/block}
{/block}
