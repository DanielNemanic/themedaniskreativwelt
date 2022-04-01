{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}

  {hook h='displayPaymentTop'}

  {* used by javascript to correctly handle cart updates when we are on payment step (eg vouchers added) *}
    <div style="display:none" class="js-cart-payment-step-refresh"></div>

    {if !empty($display_transaction_updated_info)}
      <p class="cart-payment-step-refreshed-info">
        {l s='Transaction amount has been correctly updated' d='Shop.Theme.Checkout'}
      </p>
    {/if}

    {if $is_free}
        <p>{l s='No payment needed for this order' d='Shop.Theme.Checkout'}</p>
    {/if}

  <div class="payment-options {if $is_free}uk-hidden{/if} uk-margin">
    {foreach from=$payment_options item="module_options"}
      {foreach from=$module_options item="option"}
        <div id="{$option.id}-container" class="paymentOption uk-card uk-card-default {if $selected_payment_option == $option.id || $is_free} uk-card-primary {/if} uk-card-hover uk-card-body">
          {* This is the way an option should be selected when Javascript is enabled *}
          <div class="uk-width-1-1">
            <input
              class="uk-radio paymentSelect {if $option.binary} binary {/if}"
              id="{$option.id}"
              data-module-name="{$option.module_name}"
              name="payment-option"
              type="radio"
              required
              {if $selected_payment_option == $option.id || $is_free} checked {/if}
            >
            <label class="uk-form-label" for="{$option.id}">
              <span>{$option.call_to_action_text}</span>
              {if $option.logo}
                <img loading="lazy" data-src="{$option.logo}" uk-img>
              {/if}
            </label>
          </div>

          {if $option.additionalInformation}
            <div id="{$option.id}-additional-information"
                 class="additionalInformation {if $option.id != $selected_payment_option} uk-hidden {/if}"
            >
              {$option.additionalInformation nofilter}

                {* This is the way an option should be selected when Javascript is disabled *}
                <form method="GET" >
                    {if $option.id === $selected_payment_option}
                        {l s='Selected' d='Shop.Theme.Checkout'}
                    {else}
                        <button class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt" type="submit" name="select_payment_option" value="{$option.id}">
                            {l s='Choose' d='Shop.Theme.Actions'}
                        </button>
                    {/if}
                </form>
            </div>
          {/if}

          <div id="pay-with-{$option.id}-form"
               class="js-payment-option-form {if $option.id != $selected_payment_option} uk-hidden {/if}"
          >
            {if $option.form}
              {$option.form nofilter}
            {else}
              <form id="payment-form" method="POST" action="{$option.action nofilter}">
                {foreach from=$option.inputs item=input}
                  <input type="{$input.type}" name="{$input.name}" value="{$input.value}">
                {/foreach}
                <button style="display:none" id="pay-with-{$option.id}" type="submit"></button>
              </form>
            {/if}
          </div>
        </div>
      {/foreach}
    {foreachelse}
      <p class="alert alert-danger">{l s='Unfortunately, there are no payment method available.' d='Shop.Theme.Checkout'}</p>
    {/foreach}
  </div>

    {if $selected_payment_option  || $selected_delivery_option.is_free}
        {if $show_final_summary}
            <div class="uk-margin orderFinalSummary">
                {include file='checkout/_partials/order-final-summary.tpl'}
            </div>
        {/if}

        {if $conditions_to_approve|count}
            <div class="uk-margin">
                <form id="conditions-to-approve" method="GET">
                    {foreach from=$conditions_to_approve item="condition" key="condition_name"}
                        <div class="uk-margin">
                            <label class="uk-form-label js-terms" for="conditions_to_approve[{$condition_name}]">
                                <input  id    = "conditions_to_approve[{$condition_name}]"
                                        name  = "conditions_to_approve[{$condition_name}]"
                                        required
                                        type  = "checkbox"
                                        value = "1"
                                        class = "uk-checkbox conditionsToApprove"
                                >
                                {$condition nofilter}
                            </label>
                        </div>
                    {/foreach}
                </form>
            </div>
        {/if}
        <div id="payment-confirmation" class="uk-margin">
            <div>
                <button type="submit" disabled class="uk-button uk-width-1-1 uk-width-auto@s uk-button-daniskreativwelt sendOrder">
                    {l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}
                </button>
                {if $show_final_summary}
                    <div class="uk-alert-danger js-alert-payment-conditions" uk-alert>
                        {l
                        s='Please make sure you\'ve chosen a [1]payment method[/1] and accepted the [2]terms and conditions[/2].'
                        sprintf=[
                        '[1]' => '<a href="#checkout-payment-step">',
                        '[/1]' => '</a>',
                        '[2]' => '<a href="#conditions-to-approve">',
                        '[/2]' => '</a>'
                        ]
                        d='Shop.Theme.Checkout'
                        }
                    </div>
                {/if}
            </div>
            <div >
                {if $selected_payment_option and $all_conditions_approved}
                    <label for="pay-with-{$selected_payment_option}">{l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}</label>
                {/if}
            </div>
        </div>
    {/if}

  {hook h='displayPaymentByBinaries'}
{/block}
