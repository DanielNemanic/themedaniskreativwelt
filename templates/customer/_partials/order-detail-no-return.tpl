{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='order_products_table'}
  <div class="orderProductsTable">
    <h3>{l s='Product' d='Shop.Theme.Catalog'}:</h3>
    {foreach from=$order.products item=product}
      <div class="uk-grid-small uk-grid" uk-grid>
        <div class="uk-width-1-1">
          <div class="uk-child-widht-1-2" uk-grid>
            <div>
              <img loading="lazy" data-src="{$product.cover.small.url}" uk-img/>
            </div>
            <div>
              <div class="uk-panel uk-panel-box">
                {if isset($product.download_link)}<a href="{$product.url}" class="uk-button uk-button-text" target="_blank">{/if}
                  {$product.name}
                  {if isset($product.download_link)}</a>{/if}
              </div>
              <div>
              {if $product.reference}
                <b>{l s='Reference' d='Shop.Theme.Catalog'}:</b> {$product.reference}
              {/if}
              </div>
              <div>
                {if is_array($product.customizations) && $product.customizations|count}
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
                {/if}
              </div>
              {hook h='displayProductPriceBlock' product=$product type="unit_price"}
            </div>
          </div>
        </div>
        <div class="uk-width-1-1 uk-child-width-1-3" uk-grid>
          <div>
            <b>{l s='Quantity' d='Shop.Theme.Catalog'}:</b>
            {if $product.customizations}
              {foreach $product.customizations as $customization}
                {$customization.quantity}
              {/foreach}
            {else}
              {$product.quantity}
            {/if}
          </div>

          <div>
            <b>{l s='Unit price' d='Shop.Theme.Catalog'}</b> {$product.price}
          </div>
          <div>
            <b>{l s='Total price' d='Shop.Theme.Catalog'}</b> {$product.total}
          </div>
        </div>
      </div>
      <hr>
    {/foreach}
  </div>

  <div class="uk-grid-small uk-child-width-1-2 uk-grid" uk-grid>
    {foreach $order.subtotals as $line}
      {if $line.value}
        <div>{$line.label}</div>
        <div>{$line.value}</div>
      {/if}
    {/foreach}
    <div class="uk-text-uppercase">{$order.totals.total.label}</div>
    <div class="uk-text-bold">{$order.totals.total.value}</div>
  </div>
{/block}
