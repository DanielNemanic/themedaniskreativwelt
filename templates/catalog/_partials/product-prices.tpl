{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $product.show_price}
	<div class="productPrices">
		<div class="uk-child-width-auto" uk-grid>
	    {block name='product_pack_price'}
        {if $displayPackPrice}
					<div class="regular-price">
							{l s='Instead of %price%' d='Shop.Theme.Catalog' sprintf=['%price%' => $noPackPrice]}
					</div>
        {/if}
	    {/block}

      {block name='product_discount'}
        {if $product.has_discount}
					<div class="regular-price">
              {hook h='displayProductPriceBlock' product=$product type="old_price"}
              {$product.regular_price}
					</div>
        {/if}
      {/block}

			{block name='product_price'}
				<div class="hasdiscount uk-text-lead">
					<link itemprop="availability" href="{$product.seo_availability}"/>
					<meta itemprop="priceCurrency" content="{$currency.iso_code}">

		      {$product.price}

		      {if $product.has_discount}
						<span class="discount discount-amount">
              {if $product.discount_type === 'percentage'}
                  {l s='Save %percentage%' d='Shop.Theme.Catalog' sprintf=['%percentage%' => $product.discount_percentage_absolute]}
              {else}
		              {l s='Save %amount%' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.discount_to_display]}
              {/if}
            </span>
		      {/if}

		      {block name='product_unit_price'}
	          {if $displayUnitPrice}
							<p class="product-unit-price sub">{l s='(%unit_price%)' d='Shop.Theme.Catalog' sprintf=['%unit_price%' => $product.unit_price_full]}</p>
	          {/if}
		      {/block}
				</div>
			{/block}

      {block name='product_without_taxes'}
	      {if $priceDisplay == 2}
					<div class="product-without-taxes uk-text-lead">
	            {l s='%price% tax excl.' d='Shop.Theme.Catalog' sprintf=['%price%' => $product.price_tax_exc]}
					</div>
	      {/if}
      {/block}

      {block name='product_ecotax'}
        {if $product.ecotax.amount > 0}
					<div class="price-ecotax">
						<p>{l s='Including %amount% for ecotax' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.ecotax.value]}
              {if $product.has_discount}
                  {l s='(not tax-shipping-delivery-label by the discount)' d='Shop.Theme.Catalog'}
              {/if}
						</p>
					</div>
        {/if}
      {/block}
		</div>

		<div class="displayProductPriceBlock">
        {hook h='displayProductPriceBlock' product=$product type="weight" hook_origin='product_sheet'}
		</div>

		<div class="tax-shipping-delivery-label uk-article-meta">
      {if !$configuration.taxes_enabled}
          {l s='No tax' d='Shop.Theme.Catalog'}
      {elseif $configuration.display_taxes_label}
          {$product.labels.tax_long}
      {/if}
      {hook h='displayProductPriceBlock' product=$product type="price"}
      {hook h='displayProductPriceBlock' product=$product type="after_price"}
      {if $product.additional_delivery_times == 1}
          {if $product.delivery_information}
						<span class="delivery-information">{$product.delivery_information}</span>
          {/if}
      {elseif $product.additional_delivery_times == 2}
          {if $product.quantity > 0}
						<span class="delivery-information">{$product.delivery_in_stock}</span>
              {* Out of stock message should not be displayed if customer can't order the product. *}
          {elseif $product.quantity <= 0 && $product.add_to_cart_url}
						<span class="delivery-information">{$product.delivery_out_stock}</span>
          {/if}
      {/if}
			<div>
        <span>
            Aufgrund des Kleinunternehmerstatus gem. § 19 UStG erheben wir keine Umsatzsteuer und weisen diese daher auch nicht aus.
        </span>
			</div>
		</div>
	</div>
{/if}
