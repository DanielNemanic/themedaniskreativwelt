{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='my_account_links'}
  <a href="{$urls.pages.my_account}" class="accountLink uk-button uk-button-text">
    <span uk-icon="icon: chevron-left"></span>
    {l s='Back to your account' d='Shop.Theme.Customeraccount'}
  </a>
  <a href="{$urls.pages.index}" class="accountLink uk-button uk-button-text">
    <span uk-icon="icon: home"></span>
    {l s='Home' d='Shop.Theme.Global'}
  </a>
{/block}
