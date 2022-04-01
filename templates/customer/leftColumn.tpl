{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div id="left-column" class="uk-width-1-1 uk-width-1-4@s uk-margin-small-top">
    <div class="uk-visible@s uk-margin-small-top">
        <ul class="uk-nav uk-nav-default">
            <li {if $urls.current_url == $urls.pages.identity}class="uk-active" {/if}>
                <a href="{$urls.pages.identity}"><span uk-icon="icon: user"></span> {l s='Information' d='Shop.Theme.Customeraccount'}</a>
            </li>
            <li {if $urls.current_url == $urls.pages.addresses}class="uk-active" {/if}>
                <a href="{$urls.pages.addresses}"><span uk-icon="icon: location"></span> {l s='Addresses' d='Shop.Theme.Customeraccount'}</a>
            </li>
            {if !$configuration.is_catalog}
                <li {if $urls.current_url == $urls.pages.history}class="uk-active" {/if}>
                    <a href="{$urls.pages.history}"><span uk-icon="icon: calendar"></span> {l s='Order history and details' d='Shop.Theme.Customeraccount'}</a>
                </li>
            {/if}
            {if !$configuration.is_catalog}
                <li {if $urls.current_url == $urls.pages.order_slip}class="uk-active" {/if}>
                    <a href="{$urls.pages.order_slip}"><span uk-icon="icon: history"></span> {l s='Credit slips' d='Shop.Theme.Customeraccount'}</a>
                </li>
            {/if}
            {if $configuration.voucher_enabled && !$configuration.is_catalog}
                <li {if $urls.current_url == $urls.pages.discount}class="uk-active" {/if}>
                    <a href="{$urls.pages.discount}"><span uk-icon="icon: tag"></span> {l s='Vouchers' d='Shop.Theme.Customeraccount'}</a>
                </li>
            {/if}
            {if $configuration.return_enabled && !$configuration.is_catalog}
                <li {if $urls.current_url == $urls.pages.order_follow}class="uk-active" {/if}>
                    <a href="{$urls.pages.order_follow}"><span uk-icon="icon: history"></span> {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}</a>
                </li>
            {/if}
            <li>
                <a href="{url entity='module' name='ps_emailalerts' controller='account'}"><span uk-icon="icon: mail"></span>{l s='My alerts' d='Shop.Theme.Catalog'}</a>
            </li>
        </ul>
    </div>
</div>