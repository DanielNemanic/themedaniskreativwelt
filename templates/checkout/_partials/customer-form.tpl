{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends "customer/_partials/customer-form.tpl"}

{block "form_field"}
  {if $field.name === 'password' and $guest_allowed}
      <p>
        <span class="font-weight-bold">{l s='Create an account' d='Shop.Theme.Checkout'}</span> <span class="font-italic">{l s='(optional)' d='Shop.Theme.Checkout'}</span>
        <br>
        <span class="text-muted">{l s='And save time on your next order!' d='Shop.Theme.Checkout'}</span>
      </p>
      {$smarty.block.parent}
  {else}
    {$smarty.block.parent}
  {/if}
{/block}

{block "form_buttons"}
    <button
      class="continue uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt"
      name="continue"
      data-link-action="register-new-customer"
      type="submit"
      value="1"
    >
        {l s='Continue' d='Shop.Theme.Actions'}
    </button>
{/block}
