{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='pack_miniature_item'}
    <a href="{$product.url}" title="{$product.name}">
        <div class="uk-card uk-card-default uk-card-hover uk-grid-collapse uk-child-width-1-2@s uk-margin" uk-grid>
            <div class="uk-card-media-left uk-cover-container">
                <img src="{$product.cover.medium.url}" loading="lazy" alt="" uk-cover>
                <canvas width="600" height="400"></canvas>
            </div>
            <div>
                <div class="uk-card-body ">
                    <p>{$product.name}</p>
                    <p class="uk-text-bolder">{$product.pack_quantity} x {$product.price}</p>
                </div>
            </div>
        </div>
    </a>
{/block}
