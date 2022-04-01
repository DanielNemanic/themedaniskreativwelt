{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='brand_miniature_item'}
    <div class="uk-card uk-card-default uk-grid-collapse uk-child-width-1-2@s uk-margin" uk-grid>
        <div class="uk-card-media-left uk-cover-container">
            <img data-src="{$brand.image}" loading="lazy" alt="{$brand.name}" uk-img uk-cover>
            <canvas width="600" height="400"></canvas>
        </div>
        <div>
            <div class="uk-card-body">
                <div class="uk-card-badge uk-badge">{$brand.nb_products}</div>
                <h3 class="uk-card-title">{$brand.name}</h3>
                <p>{$brand.text nofilter}</p>
                <p>{$brand.description nofilter}</p>
                <p>
                    <a href="{$brand.url}" class="uk-button uk-button-text">
                        {l s='View products' d='Shop.Theme.Actions'}
                    </a>
                </p>
            </div>
        </div>
    </div>
{/block}