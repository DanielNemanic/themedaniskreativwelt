{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="productAddToCart uk-margin">
  {if !$configuration.is_catalog}
    <label class="uk-form-label">{l s='Quantity' d='Shop.Theme.Catalog'}</label>
    {block name='product_quantity'}
      <div class="uk-form-controls uk-grid-small" uk-grid>
        <div class="uk-width-1-2@s">
          <input
            type="number"
            name="qty"
            value="{$product.quantity_wanted}"
            class="uk-input quantityWanted"
            min="{$product.minimal_quantity}"
            max="{$product.quantity}"
            aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
          >
        </div>
        <div class="uk-width-1-2@s">
          <button
              class="uk-button uk-button-daniskreativwelt uk-width-1-1 addToBasket"
              type="submit"
              {if !$product.add_to_cart_url}
                disabled
              {/if}
          >
          <span uk-icon="icon: cart"></span>
          {l s='Add to cart' d='Shop.Theme.Actions'}
          </button>
        </div>
        {hook h='displayProductActions' product=$product}
      </div>
    {/block}
    <div class="uk-child-width-1-2 uk-margin-small" uk-grid>
      <div>
        <dt>{l s='In stock' d='Shop.Theme.Catalog'}</dt>
        <dd><span class="stockQuantitiy">{$product.quantity}</span> {$product.quantity_label}</dd>
      </div>
      <div>
        {block name='product_availability'}
          {if $product.show_availability && $product.availability_message}
            {if $product.availability == 'available'}
              <span uk-icon="icon: check"  style="color:green;"></span>&nbsp;
            {elseif $product.availability == 'last_remaining_items'}
              <span uk-icon="icon: warning" style="color:orange;"></span>&nbsp;
            {else}
              <span uk-icon="icon: ban" style="color:red;"></span>&nbsp;
            {/if}
            {$product.availability_message}
          {/if}
        {/block}

        {block name='product_minimal_quantity'}
          {if $product.minimal_quantity > 1}
            <p class="productMinimalQuantity">
              {l
              s='The minimum purchase order quantity for the product is %quantity%.'
              d='Shop.Theme.Checkout'
              sprintf=['%quantity%' => $product.minimal_quantity]
              }
            </p>
          {/if}
        {/block}
      </div>
    </div>

    <div class="uk-width-1-1 uk-margin-small productAvailability">

    </div>
  {/if}
</div>