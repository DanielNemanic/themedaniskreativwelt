{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='customer/order-detail.tpl'}

{block name='page_title'}
  {l s='Guest Tracking' d='Shop.Theme.Customeraccount'}
{/block}

{block name='order_detail'}
  {include file='customer/_partials/order-detail-no-return.tpl'}
{/block}

{block name='order_messages'}
{/block}

{block name='page_content' append}
  {block name='guest_to_customer'}
    <form action="{$urls.pages.guest_tracking}" method="post" class="uk-form-stacked">
      <div class="uk-margin">
        <h3>{l s='Transform your guest account into a customer account and enjoy:' d='Shop.Theme.Customeraccount'}</h3>
        <ul class="uk-list">
          <li> -{l s='Personalized and secure access' d='Shop.Theme.Customeraccount'}</li>
          <li> -{l s='Fast and easy checkout' d='Shop.Theme.Customeraccount'}</li>
          <li> -{l s='Easier merchandise return' d='Shop.Theme.Customeraccount'}</li>
        </ul>
      </div>

      <div class="uk-margin">
        <label class="uk-form-label">{l s='Set your password:' d='Shop.Forms.Labels'}</label>
        <div class="uk-form-controls">
          <input type="password" data-validate="isPasswd" name="password" value="" class="uk-input">
        </div>
      </div>

      <div class="uk-margin">
        <div class="uk-form-controls">
          <input type="hidden" name="submitTransformGuestToCustomer" value="1">
          <input type="hidden" name="id_order" value="{$order.details.id}">
          <input type="hidden" name="order_reference" value="{$order.details.reference}">
          <input type="hidden" name="email" value="{$guest_email}">

          <button class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt" type="submit">{l s='Send' d='Shop.Theme.Actions'}</button>
        </div>
      </div>
    </form>
  {/block}
{/block}
