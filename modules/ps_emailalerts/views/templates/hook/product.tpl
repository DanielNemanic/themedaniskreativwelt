{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-width-1-1">
	<form>
		<div class="js-mailalert" data-url="{url entity='module' name='ps_emailalerts' controller='actions' params=['process' => 'add']}">
            {if isset($email) AND $email}
				<input class="uk-input" type="email" placeholder="{l s='your@email.com' d='Modules.Mailalerts.Shop'}"/><br />
            {/if}
            {if isset($id_module)}
                {hook h='displayGDPRConsent' id_module=$id_module}
            {/if}
			<input type="hidden" value="{$id_product}"/>
			<input type="hidden" value="{$id_product_attribute}"/>
			<button class="uk-button uk-width-1-1 uk-button-daniskreativwelt" type="submit" rel="nofollow" onclick="return addNotification();">{l s='Notify me when available' d='Modules.Mailalerts.Shop'}</button>
		</div>
	</form>
</div>