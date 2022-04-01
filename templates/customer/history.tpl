{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Order history' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <h3>{l s='Here are the orders you\'ve placed since your account was created.' d='Shop.Theme.Customeraccount'}</h3>

  {if $orders}
    {foreach from=$orders item=order}
      <div class="uk-card uk-card-default uk-card-hover uk-card-body uk-width-1-1 uk-margin historyOrder">
        <div class="uk-text-center">
          <h4 class="uk-card-title uk-margin-remove-bottom">
            {l s='Order reference' d='Shop.Theme.Checkout'}:
            <small>{$order.details.reference}</small>
          </h4>
        </div>

        <div class="uk-child-width-1-1 uk-child-width-1-2@s uk-child-width-1-4@m uk-margin-top" uk-grid>
          <div>
            <dt>{l s='Date' d='Shop.Theme.Checkout'}</dt>
            <dd>{$order.details.order_date}</dd>
          </div>
          <div>
            <dt>{l s='Total price' d='Shop.Theme.Checkout'}</dt>
            <dd>{$order.totals.total.value}</dd>
          </div>
          <div>
            <dt>{l s='Payment' d='Shop.Theme.Checkout'}</dt>
            <dd>{$order.details.payment}</dd>
          </div>
          <div>
            <dt>{l s='Invoice' d='Shop.Theme.Checkout'}</dt>
            <dd>
              {if $order.details.invoice_url}
                <a href="{$order.details.invoice_url}" target="_blank" uk-icon="icon: file-pdf"></a>
              {else}
                -
              {/if}
            </dd>
          </div>
        </div>
        <div class="uk-child-width-1-1 uk-child-width-1-2@s" uk-grid>
          <div>
            <dt>{l s='Status' d='Shop.Theme.Checkout'}</dt>
            <dd class="{$order.history.current.contrast}" style="background-color:{$order.history.current.color}">
              {$order.history.current.ostate_name}
            </dd>
          </div>
          <div class="uk-text-right">
            <a href="{$order.details.details_url}" class="uk-button uk-button-text" data-link-action="view-order-details">
              <span uk-icon="icon: search"></span> {l s='Details' d='Shop.Theme.Customeraccount'}
            </a>
            {if $order.details.reorder_url}
              <a href="{$order.details.reorder_url}" class="uk-button uk-button-text">
                <span uk-icon="icon: cart"></span> {l s='Reorder' d='Shop.Theme.Actions'}
              </a>
            {/if}
          </div>
        </div>
      </div>
    {/foreach}
  {/if}
{/block}
