{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="cartSummaryDetails">
    {block name='hook_checkout_summary_top'}
        {hook h='displayCheckoutSummaryTop'}
    {/block}

    {block name='cart_summary_products'}
        <div uk-accordion>
            <div>
                <a href="#" class="uk-accordion-title" >{$cart.summary_string} {l s='show details' d='Shop.Theme.Actions'} </a>
                <div class="uk-width-1-1 uk-accordion-content" uk-grid>
                    {block name='cart_summary_product_list'}
                        {foreach from=$cart.products item=product}
                            <div>{include file='checkout/_partials/cart-summary-product-line.tpl' product=$product}</div>
                        {/foreach}
                    {/block}
                </div>
            </div>
        </div>
        <hr>
    {/block}

    {block name='cart_summary_totals'}
        {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
    {/block}

    {block name='cart_summary_voucher'}
        {include file='checkout/_partials/cart-voucher.tpl'}
    {/block}
</div>

