{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{assign var='icon' value=$icon|default:'check'}
{assign var='modal_message' value=$modal_message|default:''}

<script type="text/javascript">
  document.addEventListener("DOMContentLoaded", function() {
    const confirmModal = $('#{$modal_id}');

    $('.confirm-button', confirmModal).click(function() {
      confirmModal.trigger('modal:confirm', true);
    });
    $('.refuse-button', confirmModal).click(function() {
      confirmModal.trigger('modal:confirm', false);
    });
  });
</script>

<div id="{$modal_id}" uk-modal>
  <div class="uk-modal-dialog">
    <button class="uk-modal-close-default" type="button" uk-close></button>
    <div class="uk-modal-header">
      <h2>
        <span uk-icon="icon: {$icon}"></span>
        {$modal_title}
      </h2>
    </div>
    <div class="uk-modal-body"  id="{$modal_id}-message">
        {$modal_message}
    </div>
    <div class="uk-modal-footer uk-text-right">
      <div class="uk-width-1-1 post-comment-buttons">
        <button type="button" class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-default refuse-button uk-modal-close" aria-label="{l s='OK' d='Modules.Productcomments.Shop'}">
          {l s='No' d='Modules.Productcomments.Shop'}
        </button>
        <button type="button" class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt confirm-button" aria-label="{l s='Yes' d='Modules.Productcomments.Shop'}">
          {l s='Yes' d='Modules.Productcomments.Shop'}
        </button>
      </div>
    </div>
  </div>
</div>
