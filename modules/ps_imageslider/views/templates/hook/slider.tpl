{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $homeslider.slides}
  <div uk-slideshow="animation: push;autoplay: true;autoplay-interval:{$homeslider.speed};pause-on-hover:{$homeslider.pause};min-height: 300; max-height: 600" class="uk-width-1-1"  >
    <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1">
      <ul class="uk-slideshow-items" >
        {foreach from=$homeslider.slides item=slide name='homeslider'}
          <li href="{$slide.url}">
            <img loading="lazy" data-src="{$slide.image_url}" alt="" uk-cover uk-img="target: !.uk-slideshow-items">
            {if $slide.title || $slide.description}
            <div class="uk-overlay uk-overlay-primary uk-position-left uk-transition-slide-left uk-width-medium" >
              <h3 class="uk-margin-remove">{$slide.title}</h3>
              <p class="uk-margin-remove">{$slide.description nofilter}</p>
            </div>
            {/if}
          </li>
        {/foreach}
      </ul>
      <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
      <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
    </div>
    <ul class="uk-slideshow-nav uk-dotnav uk-flex-center uk-margin"></ul>
  </div>
{/if}
