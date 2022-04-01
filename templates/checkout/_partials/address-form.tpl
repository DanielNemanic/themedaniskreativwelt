{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='customer/_partials/address-form.tpl'}

{block name='form_field'}
  {if $field.name eq "alias"}
    {* we don't ask for alias here *}
  {else}
    {$smarty.block.parent}
  {/if}
{/block}

{block name="address_form_url"}
    <form
      method="POST"
      action="{url entity='order' params=['id_address' => $id_address]}"
      data-id-address="{$id_address}"
      data-refresh-url="{url entity='order' params=['ajax' => 1, 'action' => 'addressForm']}"
    >
{/block}

{block name='form_fields' append}
  <input type="hidden" name="saveAddress" value="{$type}">
  {if $type === "delivery"}
    <div class="uk-margin">
      <input class="uk-checkbox" name="use_same_address" id="use_same_address" type="checkbox" value = "1" {if $use_same_address} checked {/if}>
      <label for="use_same_address">{l s='Use this address for invoice too' d='Shop.Theme.Checkout'}</label>
    </div>
  {/if}
{/block}

{block name='form_buttons'}
  {if !$form_has_continue_button}
    <button type="submit" class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt">{l s='Save' d='Shop.Theme.Actions'}</button>
    <a class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-default" href="{url entity='order' params=['cancelAddress' => {$type}]}">{l s='Cancel' d='Shop.Theme.Actions'}</a>
  {else}
    <form>
      <button type="submit" class="continue uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt" name="confirm-addresses" value="1">
          {l s='Continue' d='Shop.Theme.Actions'}
      </button>
      {if $customer.addresses|count > 0}
        <a class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-default" href="{url entity='order' params=['cancelAddress' => {$type}]}">{l s='Cancel' d='Shop.Theme.Actions'}</a>
      {/if}
    </form>
  {/if}
{/block}
