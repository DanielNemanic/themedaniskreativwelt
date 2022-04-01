{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="productDetails"
     data-product="{$product.embedded_attributes|json_encode}"
>
    <div class="uk-child-width-auto uk-margin" uk-grid>
        {block name='product_reference'}
            {if isset($product_manufacturer->id)}
                <div class="productManufacturer">
                    {if isset($manufacturer_image_url)}
                        <a href="{$product_brand_url}">
                            <img src="{$manufacturer_image_url}" class="img img-thumbnail manufacturer-logo" loading="lazy" alt="{$product_manufacturer->name}">
                        </a>
                    {else}
                        <label class="label">{l s='Brand' d='Shop.Theme.Catalog'}</label>
                        <span><a href="{$product_brand_url}">{$product_manufacturer->name}</a></span>
                    {/if}
                </div>
            {/if}
            {if isset($product.reference_to_display) && $product.reference_to_display neq ''}
                <div class="productReference">
                    <dt>{l s='Reference' d='Shop.Theme.Catalog'}</dt>
                    <dd>{$product.reference_to_display}</dd>
                </div>
            {/if}
        {/block}
        <div>
            {block name='product_quantities'}
                {if $product.show_quantities}
                    <div class="productQuantities">
                        <dt>{l s='In stock' d='Shop.Theme.Catalog'}</dt>
                        <dd>{$product.quantity} {$product.quantity_label}</dd>
                    </div>
                {/if}
            {/block}
            {block name='product_availability_date'}
                {if $product.availability_date}
                    <div class="productAvailabilityDate">
                        <dt>{l s='Availability date:' d='Shop.Theme.Catalog'}</dt>
                        <dd>{$product.availability_date}</dd>
                    </div>
                {/if}
            {/block}
            {block name='product_out_of_stock'}
                <div class="productOutOfStock">
                    {hook h='actionProductOutOfStock' product=$product}
                </div>
            {/block}
        </div>
    </div>

    <div class="uk-child-width-1-3 uk-margin" uk-grid>
        {block name='product_features'}
            {if $product.grouped_features}
                <div class="product-features">
                    <h4>{l s='Data sheet' d='Shop.Theme.Catalog'}</h4>
                    {foreach from=$product.grouped_features item=feature}
                        <dt class="name">{$feature.name}</dt>
                        <dd class="value">{$feature.value|escape:'htmlall'|nl2br nofilter}</dd>
                    {/foreach}
                </div>
            {/if}
        {/block}

        {block name='product_specific_references'}
            {if !empty($product.specific_references)}
                <div class="productFeatures">
                    <h4>{l s='Specific References' d='Shop.Theme.Catalog'}</h4>
                    {foreach from=$product.specific_references item=reference key=key}
                        <dt class="name">{$key}</dt>
                        <dd class="value">{$reference}</dd>
                    {/foreach}
            </div>
            {/if}
        {/block}

        {block name='product_condition'}
            {if $product.condition}
                <div class="productCondition">
                    <dt class="label">{l s='Condition' d='Shop.Theme.Catalog'} </dt>
                    <link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
                    <dd>{$product.condition.label}</dd>
                </div>
            {/if}
        {/block}
    </div>
</div>
