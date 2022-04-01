{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-child-width-1-1 uk-child-width-1-3@s uk-margin miniProductCard" uk-grid uk-height-match="target: > div > .uk-card">
  {foreach from=$listing.products item="product"}
    {block name='product_miniature'}
      <div>
        {include file='catalog/_partials/miniatures/product.tpl' product=$product}
      </div>
    {/block}
  {/foreach}
</div>

{block name='pagination'}
  {include file='_partials/pagination.tpl' pagination=$listing.pagination}
{/block}
