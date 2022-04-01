{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div>
  <div>
    <ul class="uk-nav uk-nav-primary" >
      <li class="uk-parent">
        <a href="#">{l s='Your account' d='Shop.Theme.Customeraccount'}</a>
        <ul class="uk-nav-sub">
          {foreach from=$my_account_urls item=my_account_url}
            <li>
              <a href="{$my_account_url.url}" title="{$my_account_url.title}" rel="nofollow">
                {$my_account_url.title}
              </a>
            </li>
          {/foreach}
        </ul>
      </li>
    </ul>
  </div>
</div>
