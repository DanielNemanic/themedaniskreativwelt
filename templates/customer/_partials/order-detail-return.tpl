{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='order_products_table'}
  <form id="orderReturnForm" action="{$urls.pages.order_follow}" method="post" >
    <h3>{l s='Product' d='Shop.Theme.Catalog'}:</h3>
    {foreach from=$order.products item=product name=products}
      <div class="uk-grid-small uk-grid" uk-grid>
        <div class="uk-width-1-1">
          <div class="uk-child-widht-1-2" uk-grid>
            <div>
              {if !$product.customizations}
                <span id="_desktop_product_line_{$product.id_order_detail}">
                <input type="checkbox"
                       id="cb_{$product.id_order_detail}"
                       name="ids_order_detail[{$product.id_order_detail}]"
                       value="{$product.id_order_detail}"
                       class="uk-checkbox" >
              </span>
              {else}
                {foreach $product.customizations  as $customization}
                  <span id="_desktop_product_customization_line_{$product.id_order_detail}_{$customization.id_customization}">
                  <input type="checkbox"
                         id="cb_{$product.id_order_detail}"
                         name="customization_ids[{$product.id_order_detail}][]"
                         value="{$customization.id_customization}"
                         class="uk-checkbox" >
                </span>
                {/foreach}
              {/if}
              <img loading="lazy" data-src="{$product.cover.small.url}" uk-img/>
            </div>
            <div>
              <div>{$product.name}</div>
              <div>
                {if $product.reference}
                  <b>{l s='Reference' d='Shop.Theme.Catalog'}:</b> {$product.reference}
                {/if}
              </div>
              <div>
                {if $product.customizations}
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
            </div>
          </div>
          <div class="uk-width-1-1 uk-child-width-1-4" uk-grid>
            <div>
              <b>{l s='Quantity' d='Shop.Theme.Catalog'}</b>
              {if !$product.customizations}
                {$product.quantity}
                {if $product.quantity > $product.qty_returned}
                  <span class="select" id="_desktop_return_qty_{$product.id_order_detail}">
                    <select name="order_qte_input[{$product.id_order_detail}]" class="uk-select">
                      {section name=quantity start=1 loop=$product.quantity+1-$product.qty_returned}
                        <option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
                      {/section}
                    </select>
                  </span>
                {/if}
              {else}
                {foreach $product.customizations as $customization}
                  {$customization.quantity}
                  <span class="select" id="_desktop_return_qty_{$product.id_order_detail}_{$customization.id_customization}">
                    <select
                            name="customization_qty_input[{$customization.id_customization}]"
                            class="uk-select"
                    >
                      {section name=quantity start=1 loop=$customization.quantity+1}
                        <option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
                      {/section}
                    </select>
                  </span>
                {/foreach}
              {/if}
              </td>
            </div>
            <div>
              <b>{l s='Returned' d='Shop.Theme.Customeraccount'}</b> {$product.qty_returned}
            </div>
            <div>
              <b>{l s='Unit price' d='Shop.Theme.Catalog'}</b> {$product.price}
            </div>
            <div>
              <b>{l s='Total price' d='Shop.Theme.Catalog'}</b> {$product.total}
            </div>
          </div>
        </div>
      </div>
    {/foreach}

    <hr>
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

    <hr>

    <div class="uk-child-width-1-1" uk-grid>
      <div class="uk-margin">
        <h3>{l s='Merchandise return' d='Shop.Theme.Customeraccount'}</h3>
        <p>{l s='If you wish to return one or more products, please mark the corresponding boxes and provide an explanation for the return. When complete, click the button below.' d='Shop.Theme.Customeraccount'}</p>
      </div>
      <div class="uk-margin">
        <div class="uk-form-controls">
          <textarea cols="67" rows="5" name="returnText" class="uk-textarea"></textarea>
        </div>
      </div>
      <div class="uk-margin">
        <input type="hidden" name="id_order" value="{$order.details.id}">
        <div class="uk-form-controls">
          <button class="uk-button uk-width-1-1 uk-width-1-2@s uk-button-daniskreativwelt" type="submit" name="submitReturnMerchandise">
            {l s='Request a return' d='Shop.Theme.Customeraccount'}
          </button>
        </div>
      </div>
    </div>

  </form>
{/block}
