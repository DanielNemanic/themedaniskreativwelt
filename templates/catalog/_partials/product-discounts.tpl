{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $product.quantity_discounts}
  <div class="productDiscounts">
    <h6>{l s='Volume discounts' d='Shop.Theme.Catalog'}</h6>
    {block name='product_discount_table'}
      <table class="uk-table uk-table-divider">
        <thead>
          <tr>
            <th>{l s='Quantity' d='Shop.Theme.Catalog'}</th>
            <th>{$configuration.quantity_discount.label}</th>
            <th>{l s='You Save' d='Shop.Theme.Catalog'}</th>
          </tr>
        </thead>
        <tbody>
        {foreach from=$product.quantity_discounts item='quantity_discount' name='quantity_discounts'}
          <tr data-discount-type="{$quantity_discount.reduction_type}" data-discount="{$quantity_discount.real_value}" data-discount-quantity="{$quantity_discount.quantity}">
            <td>{$quantity_discount.quantity}</td>
            <td>{$quantity_discount.discount}</td>
            <td>{l s='Up to %discount%' d='Shop.Theme.Catalog' sprintf=['%discount%' => $quantity_discount.save]}</td>
          </tr>
        {/foreach}
        </tbody>
      </table>
    {/block}
  </div>
{/if}
