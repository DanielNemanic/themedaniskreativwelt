{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{block name='step'}
  <div  id="{$identifier}"
        class="uk-width-1-1 uk-card uk-card-default uk-card-body {[
            'checkout-step'   => true,
            '-current'        => $step_is_current,
            '-reachable'      => $step_is_reachable,
            '-complete'       => $step_is_complete,
            'js-current-step' => $step_is_current
        ]|classnames}"
  >
    <h3 class="uk-card-title">
      {if $step_is_complete}
        <span uk-icon="icon:check"></span>
      {else}
        <span class="step-number">{$position}</span>
      {/if}
      {$title}
      {if $step_is_complete}
        <a href="#" class="uk-float-right uk-text-small stepCompleteEdit"><span uk-icon="icon:pencil"></span>{l s='Edit' d='Shop.Theme.Actions'}</a>
      {/if}
    </h3>

    <div class="uk-width-1-1 stepContent {if !$step_is_current}uk-hidden{/if}">
      {block name='step_content'}DUMMY STEP CONTENT{/block}
    </div>
  </div>
{/block}