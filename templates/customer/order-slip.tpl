{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Credit slips' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <h6>{l s='Credit slips you have received after canceled orders.' d='Shop.Theme.Customeraccount'}</h6>
  {if $credit_slips}
    {foreach from=$credit_slips item=slip}
      <div class="uk-card uk-card-default uk-card-hover uk-card-body uk-width-1-1 uk-margin historyOrder">
        <div class="uk-text-center">
          <h4 class="uk-card-title uk-margin-remove-bottom">
            {l s='Order' d='Shop.Theme.Customeraccount'}:
            <small>{$slip.order_reference}</small>
          </h4>
        </div>
        <div class="uk-child-width-1-1 uk-child-width-1-3@s uk-margin-top" uk-grid>
          <div>
            <dt>{l s='Date issued' d='Shop.Theme.Customeraccount'}</dt>
            <dd>{$slip.credit_slip_date}</dd>
          </div>
          <div>
            <dt>{l s='Credit slip' d='Shop.Theme.Customeraccount'}</dt>
            <dd>{$slip.credit_slip_number}</dd>
          </div>
          <div class="uk-text-right">
            <a href="{$slip.order_url_details}" class="uk-button uk-button-text" data-link-action="view-order-details">
              <span uk-icon="icon: search"></span> {l s='Details' d='Shop.Theme.Customeraccount'}
            </a>
          </div>
        </div>
      </div>
    {/foreach}
  {/if}
{/block}
