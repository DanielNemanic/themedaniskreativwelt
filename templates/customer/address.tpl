{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='customer/page.tpl'}

{block name='page_title'}
  {if $editing}
    {l s='Update your address' d='Shop.Theme.Customeraccount'}
  {else}
    {l s='New address' d='Shop.Theme.Customeraccount'}
  {/if}
{/block}

{block name='left_column'}
  {include file='customer/leftColumn.tpl'}
{/block}

{block name='content_wrapper'}
  <div class="uk-width-1-1 uk-width-3-4@s uk-child-width-1-1 customerOverview uk-margin-small-top" uk-grid>
    {block name='notifications'}
      {include file='_partials/notifications.tpl'}
    {/block}
      {render template="customer/_partials/address-form.tpl" ui=$address_form}
    </div>
  </div>
{/block}
