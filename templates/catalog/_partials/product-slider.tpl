{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-slider-container-offset" uk-slider>
    <div class="uk-position-relative uk-visible-toggle" tabindex="-1">
        <ul class="uk-slider-items uk-child-width-1-3@s uk-child-width-1-4@m uk-grid">
            {foreach from=$products item="product"}
                <li>
                    {include file="catalog/_partials/miniatures/product.tpl" product=$product}
                </li>
            {/foreach}
        </ul>
        <a class="uk-slidenav-large uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
        <a class="uk-slidenav-large uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>
    </div>
    <ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul>
</div>