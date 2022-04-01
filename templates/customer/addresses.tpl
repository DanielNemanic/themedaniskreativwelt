{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Your addresses' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
    <div class="uk-child-width-1-1 uk-child-width-1-2@s uk-grid-small uk-grid-match" uk-grid>
      {foreach $customer.addresses as $address}
          <div>
            {block name='customer_address'}
              {include file='customer/_partials/block-address.tpl' address=$address}
            {/block}
          </div>
      {/foreach}
    </div>
    <div class="uk-width-1-1 uk-margin">
        <a href="{$urls.pages.address}" class="uk-button uk-button-text" data-link-action="add-address">
          <span uk-icon="icon: plus"></span>
          {l s='Create new address' d='Shop.Theme.Actions'}
        </a>
    </div>
{/block}
