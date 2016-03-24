<?php

/**
 * @Project NUKEVIET 4.x
 * @Author NHÍM THỦ LĨNH (contact@vinanat.vn)
 * @Copyright (C) 2014 Pa Software Solutions (http://vinanat.vn). All rights reserved
 * @Createdate Nov 18, 2014, 02:32:08 PM
 */

if( ! defined( 'NV_MAINFILE' ) ) die( 'Stop!!!' );

if( ! nv_function_exists( 'nv_block_slider_owl' ) )
{
	function nv_block_config_slider_owl( $module, $data_block, $lang_block )
	{
		global $nv_Cache, $site_mods;

		$html .= '<tr>';
		$html .= '<td>' . $lang_block['catid'] . '</td>';
		$sql = 'SELECT * FROM ' . NV_PREFIXLANG . '_' . $site_mods[$module]['module_data'] . '_cat ORDER BY sort ASC';
		$list = $nv_Cache->db( $sql, '', $module );
		$html .= '<td>';
		foreach( $list as $l )
		{
			$xtitle_i = '';

			if( $l['lev'] > 0 )
			{
				for( $i = 1; $i <= $l['lev']; ++$i )
				{
					$xtitle_i .= '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				}
			}
			$html .= $xtitle_i . '<label><input type="checkbox" name="config_catid[]" value="' . $l['catid'] . '" ' . ( ( in_array( $l['catid'], $data_block['catid'] ) ) ? ' checked="checked"' : '' ) . '</input>' . $l['title'] . '</label><br />';
		}
		$html .= '</td>';
		$html .= '</tr>';
		$html .= '<tr>';
		$html .= '<td>' . $lang_block['numrow'] . '</td>';
		$html .= '<td><input type="text" class="form-control w200" name="config_numrow" size="5" value="' . $data_block['numrow'] . '"/></td>';
		$html .= '</tr>';

		return $html;
	}

	function nv_block_config_slider_submit_owl( $module, $lang_block )
	{
		global $nv_Request;
		$return = array();
		$return['error'] = array();
		$return['config'] = array();
		$return['config']['catid'] = $nv_Request->get_array( 'config_catid', 'post', array() );
		$return['config']['numrow'] = $nv_Request->get_int( 'config_numrow', 'post', 0 );
		$return['config']['showtooltip'] = $nv_Request->get_int( 'config_showtooltip', 'post', 0 );
		$return['config']['tooltip_position'] = $nv_Request->get_string( 'config_tooltip_position', 'post', 0 );
		$return['config']['tooltip_length'] = $nv_Request->get_string( 'config_tooltip_length', 'post', 0 );
		return $return;
	}

	function nv_block_slider_owl( $block_config )
	{
		global $nv_Cache, $module_array_cat, $module_info, $site_mods, $module_config, $global_config, $db;
		$module = $block_config['module'];
		$show_no_image = $module_config[$module]['show_no_image'];
		$blockwidth = $module_config[$module]['blockwidth'];

		if( empty( $block_config['catid'] ) ) return '';
		
		$catid = implode( ',', $block_config['catid'] );
		
		$db->sqlreset()
			->select( 'id, catid, title, homeimgfile, homeimgthumb, hometext,link, publtime' )
			->from( NV_PREFIXLANG . '_' . $site_mods[$module]['module_data'] . '_rows' )
			->where( 'status= 1 AND catid IN(' . $catid . ')' )
			->order( 'publtime DESC' )
			->limit( $block_config['numrow'] );
		$list = $nv_Cache->db( $db->sql(), '', $module );

		if( ! empty( $list ) )
		{
			if( file_exists( NV_ROOTDIR . '/themes/' . $module_info['template'] . '/modules/slider/block_cat_owl.tpl' ) )
			{
				$block_theme = $module_info['template'];
			}
			else
			{
				$block_theme = 'default';
			}
			
			$xtpl = new XTemplate( 'block_cat_owl.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/modules/slider' );
				$xtpl->assign( 'TEMPLATE', $module_info['template'] );
			foreach( $list as $l )
			{
				
				if( $l['homeimgthumb'] == 1 )
				{
					$l['thumb'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module . '/' . $l['homeimgfile'];
				}
				elseif( $l['homeimgthumb'] == 2 )
				{
					$l['thumb'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module . '/' . $l['homeimgfile'];
				}
				elseif( $l['homeimgthumb'] == 3 )
				{
					$l['thumb'] = $l['homeimgfile'];
				}
				elseif( ! empty( $show_no_image ) )
				{
					$l['thumb'] = NV_BASE_SITEURL . $show_no_image;
				}
				else
				{
					$l['thumb'] = '';
				}

				
				
				$xtpl->assign( 'ROW', $l );
				if( ! empty( $l['thumb'] ) ) $xtpl->parse( 'main.loop.img' );
				$xtpl->parse( 'main.loop' );
			}
			
			

			$xtpl->parse( 'main' );
			return $xtpl->text( 'main' );
		}
	}
}
if( defined( 'NV_SYSTEM' ) )
{
	global $nv_Cache,$site_mods, $module_name, $global_array_cat, $module_array_cat;
	$module = $block_config['module'];
	if( isset( $site_mods[$module] ) )
	{
		if( $module == $module_name )
		{
			$module_array_cat = $global_array_cat;
			unset( $module_array_cat[0] );
		}
		else
		{
			$module_array_cat = array();
			$sql = 'SELECT catid, parentid, title, alias, viewcat, subcatid,  inhome, groups_view FROM ' . NV_PREFIXLANG . '_' . $site_mods[$module]['module_data'] . '_cat ORDER BY sort ASC';
			$list = $nv_Cache->db( $sql, 'catid', $module );
			
			foreach( $list as $l )
			{
				$module_array_cat[$l['catid']] = $l;
				$module_array_cat[$l['catid']]['link'] = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module . '&amp;' . NV_OP_VARIABLE . '=' . $l['alias'];
			}
		}
		$content = nv_block_slider_owl( $block_config );
	}
}
