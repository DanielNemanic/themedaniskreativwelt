{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{assign var='icon' value=$icon|default:'check'}
{assign var='modal_message' value=$modal_message|default:''}

<div id="{$modal_id}" uk-modal>
  <div class="uk-modal-dialog">
    <button class="uk-modal-close-default" type="button" uk-close></button>
    <div class="uk-modal-header">
      <h2>
        <span uk-icon="icon: {$icon}"></span>
        {$modal_title}
      </h2>
    </div>
    <div class="uk-modal-body" id="{$modal_id}-message">
      {$modal_message}
    </div>
    <div class="uk-modal-footer uk-text-right">
      <button type="button" class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-default uk-modal-close" aria-label="{l s='OK' d='Modules.Productcomments.Shop'}">
        {l s='OK' d='Modules.Productcomments.Shop'}
      </button>
    </div>
  </div>
</div>