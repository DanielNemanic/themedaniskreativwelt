{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='customer_form'}
  {block name='customer_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

<form action="{block name='customer_form_actionurl'}{$action}{/block}" id="customer-form" class="js-customer-form uk-form-stacked" method="post">

  {block "form_fields"}
    {foreach from=$formFields item="field"}
      {block "form_field"}
        {form_field field=$field}
      {/block}
    {/foreach}

    {$hook_create_account_form nofilter}
  {/block}

  {block name='customer_form_footer'}
    <div class="uk-margin">
      <input type="hidden" name="submitCreate" value="1">
      {block "form_buttons"}
        <button class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt" data-link-action="save-customer" type="submit">
          {l s='Save' d='Shop.Theme.Actions'}
        </button>
      {/block}
    </div>
  {/block}

</form>
{/block}
