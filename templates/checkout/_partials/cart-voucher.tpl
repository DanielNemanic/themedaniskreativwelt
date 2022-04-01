{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $cart.vouchers.allowed}
<div class="cartVoucher uk-margin-top">
    {block name='cart_voucher'}
        <div>
            {if $cart.vouchers.added}
                {block name='cart_voucher_list'}
                    <div class="uk-child-width-1-2 uk-grid-small" uk-grid>
                        {foreach from=$cart.vouchers.added item=voucher}
                            <div>{$voucher.name}</div>
                            <div class="uk-text-right">
                                {$voucher.reduction_formatted}
                                <a href="{$voucher.delete_url}" id="jsModalConfirm" data-location="cart" title="{l s='Delete' d='Shop.Theme.Actions'} ?"><span uk-icon="icon: trash"></span></a>
                            </div>
                        {/foreach}
                    </div>
                {/block}
            {/if}
        </div>
        <ul uk-accordion>
            <li>
                <a class="uk-accordion-title" href="#">{l s='Have a promo code?' d='Shop.Theme.Checkout'}</a>
                <div class="uk-accordion-content">
                    {block name='cart_voucher_form'}
                        <form action="{$urls.pages.cart}" class="addVoucher" method="post">
                            <input type="hidden" name="token" value="{$static_token}">
                            <input type="hidden" name="addDiscount" value="1">
                            <div class="uk-child-width-1-2" uk-grid>
                                <div>
                                    <input class="uk-input uk-width-1-1 voucherCode" type="text" name="discount_name" placeholder="{l s='Promo code' d='Shop.Theme.Checkout'}">
                                </div>
                                <div>
                                    <button type="submit" class="uk-button uk-button-daniskreativwelt uk-width-1-1 "><span uk-icon="icon: plus"></span></button>
                                </div>
                            </div>
                        </form>
                    {/block}

                    {block name='cart_voucher_notifications'}
                        <div class="uk-alert-danger voucherError uk-hidden" uk-alert>
                            <span uk-icon="icon: warning"></span> <span class="voucherErrorText"></span>
                        </div>
                    {/block}

                    {if $cart.discounts|count > 0}
                        <p class="block-promo promo-highlighted">
                            {l s='Take advantage of our exclusive offers:' d='Shop.Theme.Actions'}
                        </p>
                        {foreach from=$cart.discounts item=discount}
                            <dt>{$discount.name}</dt><dd class="code">{$discount.code}</dd>
                        {/foreach}
                    {/if}
                </div>
            </li>
        </ul>
    {/block}
</div>
{/if}
