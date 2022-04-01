{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file=$layout}

{block name='content'}
  <div class="uk-width-1-1 uk-margin">
    <h1 class="h1">{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>
    <hr>

    <div class="cartCheckout" uk-grid>
      <div class="uk-width-1-1 uk-width-2-3@s">
        {block name='cart_overview'}
          {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
        {/block}

        {block name='hook_shopping_cart_footer'}
          {hook h='displayShoppingCartFooter'}
        {/block}
      </div>
      <div class="uk-width-1-1 uk-width-1-3@s">
          <div class="uk-card uk-card-body cartSummaryDetail" >
            {block name='cart_summary'}
                {block name='hook_shopping_cart'}
                  {hook h='displayShoppingCart'}
                {/block}

                {block name='cart_totals'}
                  {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
                {/block}

                {block name='cart_actions'}
                  {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
                {/block}
            {/block}

            {block name='hook_reassurance'}
              {hook h='displayReassurance'}
            {/block}
          </div>
      </div>
    </div>

    <div class="uk-width-1-1" uk-grid>
      {block name='continue_shopping'}
        <a class="uk-button uk-button-text" href="{$urls.pages.index}">
            <span uk-icon="icon: chevron-left; ratio:1.2"></span> {l s='Continue shopping' d='Shop.Theme.Actions'}
        </a>
      {/block}
    </div>
  </div>
{/block}
