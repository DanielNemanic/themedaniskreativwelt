{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {if $ordersReturn && count($ordersReturn)}
    <h6>{l s='Here is a list of pending merchandise returns' d='Shop.Theme.Customeraccount'}</h6>

    <div class="uk-width-1-1 order-follow order-returns">
      <ul class="uk-list">
        {foreach from=$ordersReturn item=return}
          <li>
            <strong>{l s='Order' d='Shop.Theme.Customeraccount'}</strong>
            <a href="{$return.details_url}">{$return.reference}</a>
          </li>
          <li>
            <strong>{l s='Return' d='Shop.Theme.Customeraccount'}</strong>
            <a href="{$return.return_url}">{$return.return_number}</a>
          </li>
          <li>
            <strong>{l s='Package status' d='Shop.Theme.Customeraccount'}</strong>
            {$return.state_name}
          </li>
          <li>
            <strong>{l s='Date issued' d='Shop.Theme.Customeraccount'}</strong>
            {$return.return_date}
          </li>
          {if $return.print_url}
            <li>
              <strong>{l s='Returns form' d='Shop.Theme.Customeraccount'}</strong>
              <a href="{$return.print_url}">{l s='Print out' d='Shop.Theme.Actions'}</a>
            </li>
          {/if}
        {/foreach}
      </ul>
    </div>
  {/if}
{/block}
