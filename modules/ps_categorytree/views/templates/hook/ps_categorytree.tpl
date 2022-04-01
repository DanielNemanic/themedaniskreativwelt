{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{function name="categories" nodes=[] depth=0}
  {strip}
    {if $nodes|count}
        {foreach from=$nodes item=node}
          <li data-depth="{$depth}" {if $depth===0}class="uk-active" {/if}>
            {if $depth===0}
              <a href="{$node.link}">{$node.name}</a>
              {if $node.children}
                <ul class="uk-nav-sub">
                  {categories nodes=$node.children depth=$depth+1}
                </ul>
              {/if}
            {else}
              <a class="category-sub-link" href="{$node.link}">{$node.name}</a>
              {if $node.children}
                <ul>
                  {categories nodes=$node.children depth=$depth+1}
                </ul>
              {/if}
            {/if}
          </li>
        {/foreach}
    {/if}
  {/strip}
{/function}

<div class="uk-width-1-1 uk-visible@s">
  <ul class="uk-nav uk-nav-primary" >
      {categories nodes=$categories.children}
  </ul>
</div>
