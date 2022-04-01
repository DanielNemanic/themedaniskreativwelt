{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='order_messages_table'}
<div class="uk-width-1-1 uk-margin">
  {if $order.messages}
    <h2>{l s='Messages' d='Shop.Theme.Customeraccount'}</h2>

    {foreach from=$order.messages item=message}
      <article class="uk-comment uk-comment-primary uk-margin">
        <div class="uk-comment-header">
          <div class="uk-grid-medium uk-flex-middle" uk-grid>
            <div class="uk-width-expand">
              <h4 class="uk-comment-title uk-margin-remove">{$message.name}</h4>
              <ul class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
                <li>{$message.message_date}</li>
              </ul>
            </div>
          </div>
        </div>
        <div class="uk-comment-body">
          {$message.message nofilter}
        </div>
      </article>
    {/foreach}
  {/if}
</div>
{/block}

{block name='order_message_form'}
  <div class="uk-width-1-1">
    <form action="{$urls.pages.order_detail}" method="post" class="uk-form-stacked orderMessageForm">
      <input type="hidden" name="id_order" value="{$order.details.id}">

      <div class="uk-margin">
        <dt>{l s='Add a message' d='Shop.Theme.Customeraccount'}</dt>
        <dd>{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Customeraccount'}</dd>
      </div>

      <div class="uk-margin">
        <label class="uk-form-label" for="id_product">{l s='Product' d='Shop.Forms.Labels'}</label>
        <div class="uk-form-controls">
          <select name="id_product" class="uk-select" id="id_product">
            <option value="0">{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
            {foreach from=$order.products item=product}
              <option value="{$product.id_product}">{$product.name}</option>
            {/foreach}
          </select>
        </div>
      </div>

      <div class="uk-margin">
        <label class="uk-form-label" for="msgText">{l s='Message' d='Shop.Forms.Labels'}</label>
        <div class="uk-form-controls">
          <textarea rows="5" name="msgText" class="uk-textarea" id="msgText"></textarea>
        </div>
      </div>

      <div class="uk-margin">
        <div class="uk-form-controls">
          <button type="submit" name="submitMessage" class="uk-button uk-width-1-1 uk-width-1-2@s uk-button-daniskreativwelt">
            {l s='Send' d='Shop.Theme.Actions'}
          </button>
        </div>
      </div>
    </form>

  </div>
{/block}
