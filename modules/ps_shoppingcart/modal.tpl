{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div id="offcanvasCart" uk-offcanvas="flip: true; overlay: true;">
  <div class="uk-offcanvas-bar uk-width-1-1 uk-width-1-2@s uk-width-1-3@m">

    <button class="uk-offcanvas-close uk-close-large" type="button" uk-close></button>

    <h3>{$product.name}</h3>

    <div class="uk-alert-success" uk-alert>
      <span uk-icon="check"></span> {l s='Product successfully added to your shopping cart' d='Shop.Theme.Checkout'}
    </div>

    <div class="uk-child-width-1-2" uk-grid>
      <div>
        <img class="productImage" loading="lazy" src="{$product.cover.medium.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" itemprop="image">
      </div>
      <div>
        <div class="hasdiscount uk-text-lead uk-margin">{$product.price}</div>

        {hook h='displayProductPriceBlock' product=$product type="unit_price"}

        {foreach from=$product.attributes item="property_value" key="property"}
          <dt>{l s='%label%:' sprintf=['%label%' => $property] d='Shop.Theme.Global'}</dt><dd>{$property_value}</dd>
        {/foreach}

        <dt>{l s='Quantity:' d='Shop.Theme.Checkout'}</dt><dd>{$product.cart_quantity}</dd>
      </div>
    </div>

    <div class="uk-margin">
      {if $cart.products_count > 1}
        <h4>{l s='There are %products_count% items in your cart.' sprintf=['%products_count%' => $cart.products_count] d='Shop.Theme.Checkout'}</h4>
      {else}
        <h4>{l s='There is %product_count% item in your cart.' sprintf=['%product_count%' =>$cart.products_count] d='Shop.Theme.Checkout'}</h4>
      {/if}
      <p><dt>{l s='Subtotal:' d='Shop.Theme.Checkout'}</dt><dd>{$cart.subtotals.products.value}</dd></p>
      <p><dt>{l s='Shipping:' d='Shop.Theme.Checkout'}</dt><dd>{$cart.subtotals.shipping.value} {hook h='displayCheckoutSubtotalDetails' subtotal=$cart.subtotals.shipping}</dd></p>

      {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
        <p><dt>{$cart.totals.total.label} {$cart.labels.tax_short}</dt><dd>{$cart.totals.total.value}</dd></p>
        <p class="product-total"><dt>{$cart.totals.total_including_tax.label}</dt><dd>{$cart.totals.total_including_tax.value}</dd></p>
      {else}
        <p class="product-total"><dt>{$cart.totals.total.label} {if $configuration.taxes_enabled}{$cart.labels.tax_short}{/if}</dt><dd>{$cart.totals.total.value}</dd></p>
      {/if}

      {if $cart.subtotals.tax}
        <p class="product-tax"><dt>{l s='%label%:' sprintf=['%label%' => $cart.subtotals.tax.label] d='Shop.Theme.Global'}</dt><dd>{$cart.subtotals.tax.value}</dd></p>
      {/if}

      <a href="{$cart_url}" class="uk-button uk-button-daniskreativwelt uk-width-1-1"><span uk-icon="icon: cart"></span> {l s='Proceed to checkout' d='Shop.Theme.Actions'}</a>
    </div>

  </div>
</div>
