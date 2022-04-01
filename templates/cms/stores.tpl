{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file='page.tpl'}

{block name='page_title'}
  {l s='Our stores' d='Shop.Theme.Global'}
{/block}

{block name='page_content_container'}
  <div id="content" class="uk-width-1-1 stores">
    <div class="uk-child-width-1-1" uk-grid>
      {foreach $stores as $store}
        <div class="uk-card uk-card-default uk-grid-collapse uk-margin" uk-grid>
          <div class="uk-card-media-left uk-cover-container uk-width-1-4@s">
            <img loading="lazy" src="{$store.image.bySize.stores_default.url}" alt="{$store.image.legend}" title="{$store.image.legend}">
          </div>
          <div class="uk-width-3-4@s">
            <div class="uk-card-body uk-child-width-1-2" uk-grid>
              <div>
                <h4 class="uk-card-title">{$store.name}</h4>
                <address>{$store.address.formatted nofilter}</address>
                {if $store.note || $store.phone || $store.fax || $store.email}
                  <a data-toggle="collapse" href="#about-{$store.id}" aria-expanded="false" aria-controls="about-{$store.id}"><strong>{l s='About and Contact' d='Shop.Theme.Global'}</strong><i class="material-icons">&#xE409;</i></a>
                {/if}

                <div class="card-block">
                  {if $store.note}
                  <p class="text-justify">{$store.note}<p>
                    {/if}
                </div>
                  <ul class="uk-list">
                      {if $store.phone}
                          <li><i class="material-icons">&#xE0B0;</i>{$store.phone}</li>
                      {/if}
                      {if $store.fax}
                          <li><i class="material-icons">&#xE8AD;</i>{$store.fax}</li>
                      {/if}
                      {if $store.email}
                          <li><i class="material-icons">&#xE0BE;</i>{$store.email}</li>
                      {/if}
                  </ul>
              </div>
              <div>
                  <ul class="uk-list">
                      {foreach $store.business_hours as $day}
                          <li>
                              <b>{$day.day|truncate:4:'.'}</b>
                              {foreach $day.hours as $h}{$h}{/foreach}
                          </li>
                      {/foreach}
                  </ul>
              </div>
            </div>
          </div>
        </div>
      {/foreach}
    </div>
  </div>
{/block}
