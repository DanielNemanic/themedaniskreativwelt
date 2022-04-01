{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-clearfix uk-section uk-section-xsmall featuredProducts">
  <h2 class="uk-text-uppercase">
    {l s='Popular Products' d='Shop.Theme.Catalog'}
  </h2>
  <div class="uk-child-width-1-2 uk-child-width-1-3@s uk-child-width-1-4@m uk-margin miniProductCard" uk-grid uk-height-match="target: > div > .uk-card">
    {foreach from=$products item="product"}
      <div>
        {include file="catalog/_partials/miniatures/product.tpl" product=$product}
      </div>
    {/foreach}
  </div>
  <a class="uk-button uk-button-text uk-float-right all-product-link" href="{$allProductsLink}">
    <h3 class="uk-text-uppercase">{l s='All products' d='Shop.Theme.Catalog'} <span uk-icon="icon: chevron-right;ratio:1.5"></span></h3>
  </a>
</div>
