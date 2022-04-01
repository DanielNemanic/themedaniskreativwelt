{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if isset($listing.rendered_facets)}
    <hr>
    <div id="search_filters_reset" class="uk-width-1-1 uk-visible@s">
      <div id="search_filter_controls" class="uk-hidden">
          <span id="_mobile_search_filters_clear_all"></span>
          <button class="uk-button uk-button-secondary ok">
            <span uk-icon="icon: check"></span>
            {l s='OK' d='Shop.Theme.Actions'}
          </button>
      </div>
    </div>
    <div id="search_filters_overview" class="uk-width-1-1 uk-visible@s">
      {$listing.rendered_facets nofilter}
    </div>
{/if}