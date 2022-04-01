{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<a rel="nofollow" href="{$cart_url}" data-refresh-url="{$refresh_url}" class="cartShortcut">
    <span uk-icon="icon:cart" ></span>
    <span class="uk-visible@s noOffCanvasHide">{l s='Cart' d='Shop.Theme.Checkout'}</span>
    <span class="uk-badge productsInCart">{$cart.products_count}</span>
</a>