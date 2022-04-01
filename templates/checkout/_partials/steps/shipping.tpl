{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  <div id="hook-display-before-carrier">
    {$hookDisplayBeforeCarrier nofilter}
  </div>

  <div class="delivery-options-list">
    {if $delivery_options|count}
      <form
        id="js-delivery"
        data-url-update="{url entity='order' params=['ajax' => 1, 'action' => 'selectDeliveryOption']}"
        method="post"
      >

        {block name='delivery_options'}
          {foreach from=$delivery_options item=carrier key=carrier_id}
              <div class="uk-card uk-card-default {if $delivery_option == $carrier_id}uk-card-primary{/if} uk-card-hover uk-card-body uk-card-small uk-width-1-1">
                  <label for="delivery_option_{$carrier.id}" class="delivery-option-2">
                      <div uk-grid>
                          <div class="uk-width-auto">
                              <input class="uk-radio" type="radio" name="delivery_option[{$id_address}]" id="delivery_option_{$carrier.id}" value="{$carrier_id}"{if $delivery_option == $carrier_id} checked{/if}>
                          </div>
                          <div class="uk-width-expand">
                              <div>
                                  {if $carrier.logo}
                                      <img loading="lazy" src="{$carrier.logo}" alt="{$carrier.name}" />
                                  {/if}
                                  {$carrier.name}
                              </div>
                              <div>
                                  {$carrier.delay}
                              </div>
                              <div>
                                  {$carrier.price}
                              </div>
                              <div class="row carrier-extra-content"{if $delivery_option != $carrier_id} style="display:none;"{/if}>
                                  {$carrier.extraContent nofilter}
                              </div>
                          </div>
                      </div>
                  </label>
              </div>
          {/foreach}
        {/block}
        <div class="order-options uk-margin-top">
          <div class="uk-margin">
            <label class="uk-form-label" for="delivery_message">{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Checkout'}</label>
              <div class="uk-form-controls">
                <textarea class="uk-textarea" rows="2" cols="120" id="delivery_message" name="delivery_message">{$delivery_message}</textarea>
              </div>
          </div>

          {if $recyclablePackAllowed}
            <div class="uk-margin">
              <input type="uk-checkbox" id="input_recyclable" name="recyclable" value="1" {if $recyclable} checked {/if}>
              <span uk-icon="icon:check"></span>
              <label class="uk-form-label" for="input_recyclable">{l s='I would like to receive my order in recycled packaging.' d='Shop.Theme.Checkout'}</label>
            </div>
          {/if}

          {if $gift.allowed}
            <div class="uk-margin">
              <input class="uk-checkbox js-gift-checkbox" id="input_gift" name="gift" type="checkbox" value="1" {if $gift.isGift}checked="checked"{/if}>
              <label class="uk-form-label" for="input_gift">{$gift.label}</label >
            </div>

            <div id="gift" class="uk-margin collapse">
              <label class="uk-form-label" for="gift_message">{l s='If you\'d like, you can add a note to the gift:' d='Shop.Theme.Checkout'}</label>
              <textarea class="uk-textarea" rows="2" cols="120" id="gift_message" name="gift_message">{$gift.message}</textarea>
            </div>
          {/if}

        </div>
          <div class="uk-margin">
            <button type="submit" class="continue uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt" name="confirmDeliveryOption" value="1">
              {l s='Continue' d='Shop.Theme.Actions'}
            </button>
          </div>
      </form>
    {else}
      <div class="uk-alert-danger" uk-alert>{l s='Unfortunately, there are no carriers available for your delivery address.' d='Shop.Theme.Checkout'}</div>
    {/if}
  </div>

  <div id="hook-display-after-carrier">
    {$hookDisplayAfterCarrier nofilter}
  </div>

  <div id="extra_carrier"></div>
{/block}
