
{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-child-width-1-2 uk-grid-small cartSummaryTotal" uk-grid>

  {block name='cart_summary_total'}
    {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
      <div>{$cart.totals.total.label}&nbsp;{$cart.labels.tax_short}</div>
      <div class="uk-text-right">{$cart.totals.total.value}</div>

      <div>{$cart.totals.total_including_tax.label}</div>
      <div class="uk-text-right">{$cart.totals.total_including_tax.value}</div>
    {else}
      <div>{$cart.totals.total.label}&nbsp;{if $configuration.taxes_enabled}{$cart.labels.tax_short}{/if}</div>
      <div class="uk-text-right">{$cart.totals.total.value}</div>
    {/if}
  {/block}

  {*
  {block name='cart_summary_tax'}
    {if $cart.subtotals.tax}
      <div>{l s='%label%:' sprintf=['%label%' => $cart.subtotals.tax.label] d='Shop.Theme.Global'}</div>
      <div class="uk-text-right">{$cart.subtotals.tax.value}</div>
    {/if}
  {/block}
  *}
</div>
<small>
  Aufgrund des Kleinunternehmerstatus gem. § 19 UStG erheben wir keine Umsatzsteuer und weisen diese daher auch nicht aus.
</small>