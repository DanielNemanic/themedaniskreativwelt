{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='customer/page.tpl'}

{block name='page_title'}
    {l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <div class="uk-child-width-1-1 uk-child-width-1-3@s uk-child-width-1-4@m uk-grid-small uk-grid-match customerAccountItems uk-text-center uk-text-break" uk-grid>

    <div>
        <div class="uk-card uk-card-hover uk-card-body" >
            <div class="uk-margin-bottom"><span uk-icon="icon: user; ratio:2"></span></div>
            {l s='Information' d='Shop.Theme.Customeraccount'}
            <a href="{$urls.pages.identity}" class="uk-hidden"></a>
        </div>
    </div>

    <div>
        <div class="uk-card uk-card-hover uk-card-body">
            {if $customer.addresses|count}
                <div class="uk-margin-bottom"><span uk-icon="icon: location; ratio:2"></span></div>
                {l s='Addresses' d='Shop.Theme.Customeraccount'}
                <a href="{$urls.pages.addresses}" class="uk-hidden"></a>
            {else}
                <div><span uk-icon="icon: location; ratio:2"></span></div>
                {l s='Add first address' d='Shop.Theme.Customeraccount'}
                <a href="{$urls.pages.addresses}" class="uk-hidden"></a>
            {/if}
        </div>
    </div>

    {if !$configuration.is_catalog}
        <div>
            <div class="uk-card uk-card-hover uk-card-body">
                <div class="uk-margin-bottom"><span uk-icon="icon: calendar; ratio:2"></span></div>
                {l s='Order history and details' d='Shop.Theme.Customeraccount'}
                <a href="{$urls.pages.history}" class="uk-hidden"></a>
            </div>
        </div>
    {/if}

    {if !$configuration.is_catalog}
        <div>
            <div class="uk-card uk-card-hover uk-card-body">
                <div class="uk-margin-bottom"><span uk-icon="icon: history; ratio:2"></span></div>
                {l s='Credit slips' d='Shop.Theme.Customeraccount'}
                <a href="{$urls.pages.order_slip}" class="uk-hidden"></a>
            </div>
        </div>
    {/if}


    {if $configuration.voucher_enabled && !$configuration.is_catalog}
        <div>
            <div class="uk-card uk-card-hover uk-card-body">
                <div class="uk-margin-bottom"><span uk-icon="icon: tag; ratio:2"></span></div>
                {l s='Vouchers' d='Shop.Theme.Customeraccount'}
                <a href="{$urls.pages.discount}" class="uk-hidden"></a>
            </div>
        </div>
    {/if}


    {if $configuration.return_enabled && !$configuration.is_catalog}
      <div>
          <div class="uk-card uk-card-hover uk-card-body">s
              <div class="uk-margin-bottom"><span uk-icon="icon: history; ratio:2"></span></div>
              {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
              <a href="{$urls.pages.order_follow}" class="uk-hidden"></a>
          </div>
      </div>
    {/if}


    {block name='display_customer_account'}
        {hook h='displayCustomerAccount'}
    {/block}

  </div>
{/block}


{block name='page_footer'}
  {block name='my_account_links'}
    <div class="text-sm-center">
      <a href="{$logout_url}" >
        {l s='Sign out' d='Shop.Theme.Actions'}
      </a>
    </div>
  {/block}
{/block}
