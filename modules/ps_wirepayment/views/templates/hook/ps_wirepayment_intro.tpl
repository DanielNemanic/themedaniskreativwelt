{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div>
  <p>
    {l s='Please transfer the invoice amount to our bank account. You will receive our order confirmation by email containing bank details and order number.' d='Modules.Wirepayment.Shop'}
    {if $bankwireReservationDays}
      {l s='Goods will be reserved %s days for you and we\'ll process the order immediately after receiving the payment.' sprintf=[$bankwireReservationDays] d='Modules.Wirepayment.Shop'}
    {/if}
  </p>
  {if $bankwireCustomText }
    <p>
      <button uk-toggle="target: #bankwire-modal" type="button" class="uk-button uk-button-text">{l s='More information' d='Modules.Wirepayment.Shop'}</button>
    </p>
  {/if}
  <div id="bankwire-modal" uk-modal>
    <div class="uk-modal-dialog uk-modal-body">
      <button class="uk-modal-close-default" type="button" uk-close></button>
      <h2 class="uk-modal-title">{l s='Bankwire' d='Modules.Wirepayment.Shop'}</h2>
      <p>{l s='Payment is made by transfer of the invoice amount to the following account:' d='Modules.Wirepayment.Shop'}</p>
      {include file='module:ps_wirepayment/views/templates/hook/_partials/payment_infos.tpl'}
      <p>{$bankwireCustomText nofilter}</p>
    </div>
  </div>
</div>
