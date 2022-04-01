{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}

  {hook h='displayPersonalInformationTop' customer=$customer}

  {if $customer.is_logged && !$customer.is_guest}
    <div class="uk-margin">

      <p class="identity">
        {* [1][/1] is for a HTML tag. *}
        {l s='Connected as [1]%firstname% %lastname%[/1].'
          d='Shop.Theme.Customeraccount'
          sprintf=[
            '[1]' => "<a href='{$urls.pages.identity}' class='uk-button uk-button-text '>",
            '[/1]' => "</a>",
            '%firstname%' => $customer.firstname,
            '%lastname%' => $customer.lastname
          ]
        }
      </p>
      <p>
        {* [1][/1] is for a HTML tag. *}
        {l
          s='Not you? [1]Log out[/1]'
          d='Shop.Theme.Customeraccount'
          sprintf=[
          '[1]' => "<a href='{$urls.actions.logout}' class='uk-button uk-button-text '>",
          '[/1]' => "</a>"
          ]
        }
      </p>
      {if !isset($empty_cart_on_logout) || $empty_cart_on_logout}
        <p><small>{l s='If you sign out now, your cart will be emptied.' d='Shop.Theme.Checkout'}</small></p>
      {/if}

      <div class="clearfix">
        <form method="GET" action="{$urls.pages.order}">
          <button
            class="continue uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt"
            name="controller"
            type="submit"
            value="order"
          >
            {l s='Continue' d='Shop.Theme.Actions'}
          </button>
        </form>

      </div>
    </div>
  {else}
    <div class="uk-margin">
      <ul uk-tab>
        <li><a href="#" class="{if !$show_login_form}uk-active{/if}">
            {if $guest_allowed}
              {l s='Order as a guest' d='Shop.Theme.Checkout'}
            {else}
              {l s='Create an account' d='Shop.Theme.Customeraccount'}
            {/if}
          </a></li>
        <li><a href="#" class="{if $show_login_form}uk-active{/if}">{l s='Sign in' d='Shop.Theme.Actions'}</a></li>
      </ul>

      <div class="uk-switcher uk-margin">
        <div class="{if !$show_login_form}uk-active{/if}" id="checkout-guest-form" role="tabpanel" {if $show_login_form}aria-hidden="true"{/if}>
          {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
        </div>
        <div class="{if $show_login_form}uk-active{/if}" id="checkout-login-form" role="tabpanel" {if !$show_login_form}aria-hidden="true"{/if}>
          {render file='checkout/_partials/login-form.tpl' ui=$login_form}
        </div>
      </div>
    </div>
  {/if}
{/block}
