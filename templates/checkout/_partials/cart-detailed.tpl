{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='cart_detailed_product'}
<div class="cartOverview" data-refresh-url="{url entity='cart' params=['ajax' => true, 'action' => 'refresh']}">
    {if $cart.products}
        {foreach from=$cart.products item=product}
            {block name='cart_detailed_product_line'}
                {include file='checkout/_partials/cart-detailed-product-line.tpl' product=$product}
            {/block}
            {if is_array($product.customizations) && $product.customizations|count >1}<hr>{/if}
        {/foreach}
    {else}
        {l s='There are no more items in your cart' d='Shop.Theme.Checkout'}
    {/if}
</div>
{/block}
