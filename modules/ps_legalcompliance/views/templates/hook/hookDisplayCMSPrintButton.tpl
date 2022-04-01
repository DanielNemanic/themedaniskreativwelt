{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $directPrint}
	<input type="submit" name="printCMSPage" value="{l s='Print this page' d='Modules.Legalcompliance.Shop'}" class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt" onclick="window.print()" />
{else}
	<a href="{$print_link}" class="uk-button uk-width-1-1 uk-width-1-2@s uk-width-1-3@m uk-button-daniskreativwelt" target="_blank">{l s='Print this page' d='Modules.Legalcompliance.Shop'}</a>
{/if}
