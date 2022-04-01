{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $notifications.error || $notifications.warning || $notifications.success || $notifications.info}
<div id="notifications" class="uk-width-1-1 uk-child-width-1-1" uk-grid>
  <div>
    {if $notifications.error}
      {block name='notifications_error'}
        <div class="uk-alert-danger" uk-alert>
          <ul class="uk-list uk-list-divider">
            {foreach $notifications.error as $notif}
              <li>{$notif nofilter}</li>
            {/foreach}
          </ul>
        </div>
      {/block}
    {/if}

    {if $notifications.warning}
      {block name='notifications_warning'}
        <div class="uk-alert-warning" uk-alert>
          <ul class="uk-list uk-list-divider">
            {foreach $notifications.warning as $notif}
              <li>{$notif nofilter}</li>
            {/foreach}
          </ul>
        </div>
      {/block}
    {/if}

    {if $notifications.success}
      {block name='notifications_success'}
        <div class="uk-alert-success" uk-alert>
          <ul class="uk-list uk-list-divider">
            {foreach $notifications.success as $notif}
              <li>{$notif nofilter}</li>
            {/foreach}
          </ul>
        </div>
      {/block}
    {/if}

    {if $notifications.info}
      {block name='notifications_info'}
        <div class="uk-alert-primary" uk-alert>
          <ul class="uk-list uk-list-divider">
            {foreach $notifications.info as $notif}
              <li>{$notif nofilter}</li>
            {/foreach}
          </ul>
        </div>
      {/block}
    {/if}
  </div>
</div>
{/if}
