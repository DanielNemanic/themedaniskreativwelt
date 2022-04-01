{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name="address_form"}
  {include file='_partials/form-errors.tpl' errors=$errors['']}

  {block name="address_form_url"}
  <form
    method="POST"
    action="{url entity='address' params=['id_address' => $id_address]}"
    data-id-address="{$id_address}"
    data-refresh-url="{url entity='address' params=['ajax' => 1, 'action' => 'addressForm']}"
  >
  {/block}

    {block name="address_form_fields"}
      <div class="uk-width-1-1">
        {block name='form_fields'}
          {foreach from=$formFields item="field"}
            {block name='form_field'}
              {form_field field=$field}
            {/block}
          {/foreach}
        {/block}
      </div>
    {/block}

    {block name="address_form_footer"}
    <div class="uk-margin">
      <input type="hidden" name="submitAddress" value="1">
      {block name='form_buttons'}
        <button class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt" type="submit" class="form-control-submit">
          {l s='Save' d='Shop.Theme.Actions'}
        </button>
      {/block}
    </div>
    {/block}

  </form>
{/block}
