{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{extends file=$layout}

{block name='content'}
    {block name='page_header_container'}
      {block name='page_title' hide}
          <div class="uk-width-1-1 uk-margin">
            <h1>{$smarty.block.child}</h1>
          <hr>
          </div>
      {/block}
    {/block}


    {block name='page_content_container'}
        <div class="uk-width-1-1 uk-margin">
            {block name='page_content_top'}{/block}
            {block name='page_content'}
              <!-- Page content -->
            {/block}
        </div>
    {/block}
{/block}
