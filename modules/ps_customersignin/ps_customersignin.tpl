{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $logged}
	<a
		class="logout"
		href="{$logout_url}"
		rel="nofollow"
	>
		<span uk-icon="icon: sign-out"></span>
		<span class="uk-visible@s noOffCanvasHide">{l s='Sign out' d='Shop.Theme.Actions'}</span>
	</a>
	<a
		class="account"
		href="{$my_account_url}"
		title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
		rel="nofollow"
	>
		<span uk-icon="icon: user"></span>
		<span class="uk-visible@s noOffCanvasHide">{$customerName}</span>
	</a>
{else}
	<a
		href="{$my_account_url}"
		title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
		rel="nofollow"
	>
		<span uk-icon="icon: sign-in"></span>
		<span class="uk-visible@s noOffCanvasHide">{l s='Sign in' d='Shop.Theme.Actions'}</span>
	</a>
{/if}
