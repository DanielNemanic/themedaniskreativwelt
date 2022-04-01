{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Guest Order Tracking' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  <form id="guestOrderTrackingForm" action="{$urls.pages.guest_tracking}" method="get" class="uk-form-stacked">
    <div class="uk-margin">
      <p>{l s='To track your order, please enter the following information:' d='Shop.Theme.Customeraccount'}</p>
    </div>

    <div class="uk-margin">
      <label class="uk-form-label required">{l s='Order Reference:' d='Shop.Forms.Labels'}</label>
      <div class="uk-form-controls">
        <input
            class="uk-input"
            name="order_reference"
            type="text"
            size="8"
            value="{if isset($smarty.request.order_reference)}{$smarty.request.order_reference}{/if}"
        >
        <div class="form-control-comment">
          {l s='For example: QIIXJXNUI or QIIXJXNUI#1' d='Shop.Theme.Customeraccount'}
        </div>
      </div>
    </div>

    <div class="uk-margin">
      <label class="uk-form-label required">{l s='Email:' d='Shop.Forms.Labels'}</label>
      <div class="uk-form-controls">
        <input
          class="uk-input"
          name="email"
          type="email"
          value="{if isset($smarty.request.email)}{$smarty.request.email}{/if}"
        >
      </div>
    </div>

    <div class="uk-margin">
      <div class="uk-form-controls">
        <button class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt" type="submit">{l s='Send' d='Shop.Theme.Actions'}</button>
      </div>
    </div>

  </form>
{/block}
