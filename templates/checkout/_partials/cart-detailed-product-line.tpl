{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-child-width-1-2 uk-child-width-1-4@s" uk-grid>
  <div>
    <img data-src="{$product.cover.bySize.cart_default.url}" loading="lazy" alt="{$product.name|escape:'quotes'}" uk-img>
  </div>
  <div class="uk-margin-remove uk-padding-remove" uk-grid>
      <div class="uk-width-1-1 uk-margin-remove uk-padding-remove">
          <a class="label" href="{$product.url}" data-id_customization="{$product.id_customization|intval}">{$product.name}</a>
      </div>
      {if $product.has_discount}
          <div class="uk-width-1-1 uk-margin-remove uk-padding-remove">
              <span class="regular-price">{$product.regular_price}</span>
              {if $product.discount_type === 'percentage'}
                  <span class="discount-amount">
                -{$product.discount_percentage_absolute}
              </span>
              {else}
                  <span class="discount-amount">
                -{$product.discount_to_display}
              </span>
              {/if}
          </div>
      {/if}
      <div class="uk-width-1-1 uk-margin-remove uk-padding-remove">
          <span class="hasdiscount">{$product.price}</span>
          {if $product.unit_price_full}
              <div class="unit-price-cart">{$product.unit_price_full}</div>
          {/if}
      </div>

      {foreach from=$product.attributes key="attribute" item="value"}
          <div class="uk-width-1-1 uk-margin-remove uk-padding-remove">
              <b>{$attribute}:</b> {$value}
          </div>
      {/foreach}

      <div class="uk-width-1-1 uk-margin-remove uk-padding-remove">
          {if is_array($product.customizations) && $product.customizations|count}
              {block name='cart_detailed_product_line_customization'}
                  {foreach from=$product.customizations item="customization"}

                      <button class="uk-button uk-button-text" type="button">{l s='Product customization' d='Shop.Theme.Catalog'}</button>
                      <div class="uk-width-large" uk-dropdown>
                          <div class="uk-dropdown-grid uk-child-width-1-1" uk-grid>
                            <h4>{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
                          </div>
                          {foreach from=$customization.fields item="field"}
                              <div class="uk-dropdown-grid uk-child-width-1-2@s" uk-grid>
                                  <div>
                                      {$field.label}
                                  </div>
                                  <div>
                                      {if $field.type == 'text'}
                                          {if (int)$field.id_module}
                                              {$field.text nofilter}
                                          {else}
                                              {$field.text}
                                          {/if}
                                      {elseif $field.type == 'image'}
                                          <img loading="lazy" data-src="{$field.image.small.url}" uk-img>
                                      {/if}
                                  </div>
                              </div>
                          {/foreach}
                      </div>
                  {/foreach}
              {/block}
          {/if}
      </div>
  </div>
  <div>
    <div class="uk-child-width-1-1" uk-grid>
        <div>
            {if isset($product.is_gift) && $product.is_gift}
                <span class="gift-quantity">{$product.quantity}</span>
            {else}
                <div class="uk-inline">
                    <a href="#" class="uk-form-icon uk-form-icon-flip refCheckoutCart" uk-icon="icon: refresh"></a>
                    <input
                        class="uk-input uk-width-1-1 cartCheckoutQty"
                        data-down-url="{$product.down_quantity_url}"
                        data-up-url="{$product.up_quantity_url}"
                        data-update-url="{$product.update_quantity_url}"
                        data-product-id="{$product.id_product}"
                        type="number"
                        value="{$product.quantity}"
                        name="product-quantity-spin"
                        min="{$product.minimal_quantity}"
                        max="{$product.stock_quantity}"
                        act="{$product.quantity}"
                    />
                </div>

            {/if}
        </div>
        <div class="uk-text-bold">
            {if isset($product.is_gift) && $product.is_gift}
                <span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
            {else}
                {$product.total}
            {/if}
        </div>
    </div>
  </div>
  <div class="uk-text-center">
    <a
        class                       = "remove-from-cart"
        rel                         = "nofollow"
        href                        = "{$product.remove_from_cart_url}"
        data-link-action            = "delete-from-cart"
        data-id-product             = "{$product.id_product|escape:'javascript'}"
        data-id-product-attribute   = "{$product.id_product_attribute|escape:'javascript'}"
        data-id-customization   	  = "{$product.id_customization|escape:'javascript'}"
    >
        {if !isset($product.is_gift) || !$product.is_gift}
            <span uk-icon="icon: trash;ratio: 1.2" ></span>
        {/if}
    </a>

    {block name='hook_cart_extra_product_actions'}
        {hook h='displayCartExtraProductActions' product=$product}
    {/block}
  </div>
</div>
<hr>