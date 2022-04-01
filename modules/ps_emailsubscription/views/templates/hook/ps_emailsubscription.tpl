{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
<div class="uk-child-width-1-1 uk-child-width-1-2@s newsletter" uk-grid>
  <div>
    <h3 id="block-newsletter-label" class="col-md-5 col-xs-12">{l s='Get our latest news and special sales' d='Shop.Theme.Global'}</h3>
  </div>
  <div>
    <form action="{$urls.pages.index}#footer" method="post">
      <div class="uk-margin">
        {if $conditions}
          <p>{$conditions}</p>
        {/if}
        {if $msg}
          <p class="newsletter-alert {if $nw_error}uk-alert-danger{else}uk-alert-success{/if}" uk-alert>
            <a class="uk-alert-close" uk-close></a>
            {$msg}
          </p>
        {/if}
        {if isset($id_module)}
          {hook h='displayGDPRConsent' id_module=$id_module}
        {/if}
      </div>

      <div class="uk-margin">
        <div class="uk-form-controls">
          <input
            name="email"
            type="email"
            value="{$value}"
            placeholder="{l s='Your email address' d='Shop.Forms.Labels'}"
            aria-labelledby="block-newsletter-label"
            class="uk-input"
          >
        </div>
      </div>
      <div class="uk-margin">
        <div class="uk-form-controls">
          <input
            class="uk-button uk-button-primary uk-visible@s uk-width-1-1"
            name="submitNewsletter"
            type="submit"
            value="{l s='Subscribe' d='Shop.Theme.Actions'}"
          >
        </div>
      </div>
      <div class="uk-margin">
        <div class="uk-form-controls">
          <input
            class="uk-button uk-button-primary uk-hidden@s uk-width-1-1"
            name="submitNewsletter"
            type="submit"
            value="{l s='OK' d='Shop.Theme.Actions'}"
          >

          <input type="hidden" name="action" value="0">
        </div>
      </div>
    </form>
  </div>
</div>
