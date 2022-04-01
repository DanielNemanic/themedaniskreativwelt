{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<!-- Block search module TOP -->
<div class="uk-navbar-right nav-overlay">
	<a class="uk-navbar-toggle" uk-search-icon uk-toggle="target: #my-id; animation: uk-animation-fade" href="#"></a>
</div>

<div id="my-id" uk-modal>
	<div class="uk-modal-dialog">

		<button class="uk-modal-close-default" type="button" uk-close></button>

		<div class="uk-modal-header">
			<form method="get" action="{$search_controller_url}"  class="uk-search uk-width-1-1 searchbar">
				<input type="hidden" name="controller" value="search">
				<input class="uk-search-input searchbarInput" type="search" name="s" placeholder="{l s='Search our catalog' d='Shop.Theme.Catalog'}" aria-label="{l s='Search' d='Shop.Theme.Catalog'}" autofocus>
			</form>
		</div>

		<div class="uk-modal-body searchAutocomplete" uk-overflow-auto>

		</div>
	</div>
</div>
<!-- /Block search module TOP -->
