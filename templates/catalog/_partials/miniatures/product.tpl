{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='product_miniature_item'}
	<div class="uk-card uk-card-default uk-card-hover uk-inline">
		<div class="uk-card-media-top uk-inline uk-dark productOverlay productImageView">
			<a href="{$product.url}">
          {include file="catalog/_partials/product-flags.tpl" flags=$product.flags}

				<img data-src="{$product.cover.bySize.medium_default.url}" loading="lazy" alt="" uk-img>

				<div class="uk-overlay-default uk-position-cover uk-hidden">
					<div class="uk-position-center">
						<span uk-icon="icon: search;ratio: 2"></span>
					</div>
				</div>
			</a>
		</div>
		<div class="uk-card-body uk-text-break uk-margin-bottom" itemprop="offers" itemscope itemtype="https://schema.org/Offer">
			<h3 class="uk-card-title">{$product.name}</h3>
			<p class="uk-text-center">
          {* {hook h='displayProductPriceBlock' product=$product type="old_price"} *}
          {if $product.price != $product.regular_price}
						<s>{$product.regular_price}</s>
          {/if}
				<span class="uk-text-bolder">{$product.price}</span>
          {* {hook h='displayProductPriceBlock' product=$product type="before_price"}*}
          {hook h='displayProductPriceBlock' product=$product type='unit_price'}
          {hook h='displayProductPriceBlock' product=$product type='weight'}
			<div class="uk-text-small">
          {if !$configuration.taxes_enabled}
              {l s='No tax' d='Shop.Theme.Catalog'}
          {elseif $configuration.display_taxes_label}
              {$product.labels.tax_long}
          {/if}
          {hook h='displayProductPriceBlock' product=$product type="price"}<sup><a href="#footer" uk-scroll>1</a></sup>
			</div>
			</p>
      {block name='product_variants'}
          {if $product.main_variants}
              {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
          {/if}
      {/block}
      {block name='product_reviews'}
          {hook h='displayProductListReviews' product=$product}
      {/block}


			<div class="uk-clearfix uk-position-bottom">
				<a
					href="{$product.url}"
					class="uk-button uk-button-default uk-width-1-1 {if $product.add_to_cart_url && !( $configuration.is_catalog )}uk-width-1-2{/if} uk-float-left"
					uk-icon="icon: search"
				></a>
          {if $product.add_to_cart_url && !( $configuration.is_catalog )}
						<form action="{$urls.pages.cart}" method="post" class="uk-form-stacked productActions">
							<input type="hidden" name="token" value="{$static_token}">
							<input type="hidden" name="id_product" value="{$product.id}">
							<input type="hidden" name="id_customization" value="{$product.id_customization}">

							<input
								type="hidden"
								name="qty"
								value="1"
								class="uk-input quantityWanted"
								min="{$product.minimal_quantity}"
								max="{$product.quantity}"
								aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
							>
							<button
								class="uk-button uk-button-daniskreativwelt uk-width-1-2 addToBasket"
								type="submit"
								uk-icon="icon: cart"
							></button>
                {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                {block name='product_refresh'}{/block}
						</form>
          {/if}
			</div>
		</div>
	</div>
{/block}