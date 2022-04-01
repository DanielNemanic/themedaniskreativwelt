{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file=$layout}

{block name='content'}

<div class="uk-width-1-1 uk-margin cartCheckout">
    <div class="uk-child-width-1-1" uk-grid>
        <div class="uk-width-2-3@s">
            {block name='cart_summary'}
                {render file='checkout/checkout-process.tpl' ui=$checkout_process}
            {/block}
        </div>

        <div class="uk-width-1-3@s">
            {block name='cart_summary'}
                {include file='checkout/_partials/cart-summary.tpl' cart = $cart}
            {/block}

            <hr>

            {hook h='displayReassurance'}
        </div>
    </div>
</div>
{/block}

