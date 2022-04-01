{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='cart_summary_product_line'}
<div class="uk-child-width-1-2" uk-grid>
    <div>
        <img class="productImage" loading="lazy" data-src="{$product.cover.small.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" uk-img>
    </div>
    <div>
        <div><a href="{$product.url}" title="{$product.name}">{$product.name}</a></div>
        <div>{$product.quantity} x
        <span class="hasdiscount uk-text-lead">{$product.price}</span></div>
        {hook h='displayProductPriceBlock' product=$product type="unit_price"}
        {foreach from=$product.attributes key="attribute" item="value"}
            <div>
                <span class="uk-text-bolder">{$attribute}:</span> {$value}
            </div>
        {/foreach}
    </div>
</div>
{/block}
