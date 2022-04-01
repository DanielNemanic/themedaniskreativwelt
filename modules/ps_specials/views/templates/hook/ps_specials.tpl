{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="specials uk-clearfix">
  <h2 class="h2 products-section-title text-uppercase">
    {l s='On sale' d='Shop.Theme.Catalog'}
  </h2>
  {include file="catalog/_partials/product-slider.tpl" product=$product}
  <a class="uk-button uk-button-text uk-float-right all-product-link" href="{$allSpecialProductsLink}">
    <h3 class="uk-text-uppercase" >{l s='All sale products' d='Shop.Theme.Catalog'} <span uk-icon="icon:chevron-right;ratio:1.5"></span></h3>
  </a>
</div>
