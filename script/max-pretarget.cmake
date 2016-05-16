# Copyright (c) 2016, Cycling '74
# Usage of this file and its contents is governed by the MIT License

string(REGEX REPLACE "(.*)/" "" THIS_FOLDER_NAME "${CMAKE_CURRENT_SOURCE_DIR}")
project(${THIS_FOLDER_NAME})

if (NOT DEFINED C74_MAX_API_DIR)
	set(C74_MAX_API_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../max-api)
endif ()
set(C74_INCLUDES "${C74_MAX_API_DIR}/include")
set(C74_SCRIPTS "${C74_MAX_API_DIR}/script")

set(C74_CXX_STANDARD 0)

if (APPLE)
	set(CMAKE_OSX_ARCHITECTURES x86_64;i386)
endif ()

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../../../externals")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")

IF(WIN32)

	set(CMAKE_COMPILE_PDB_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/tmp")
	set(CMAKE_PDB_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/tmp")

	if(WIN64)
		SET(MaxAPI_LIB ${C74_MAX_API_DIR}/lib/win64/MaxAPI.lib)
		SET(MaxAudio_LIB ${C74_MAX_API_DIR}/lib/win64/MaxAudio.lib)
		SET(Jitter_LIB ${C74_MAX_API_DIR}/lib/win64/jitlib.lib)	
	else()
		SET(MaxAPI_LIB ${C74_MAX_API_DIR}/lib/win32/MaxAPI.lib)
		SET(MaxAudio_LIB ${C74_MAX_API_DIR}/lib/win32/MaxAudio.lib)
		SET(Jitter_LIB ${C74_MAX_API_DIR}/lib/win32/jitlib.lib)
	endif()

	MARK_AS_ADVANCED (MaxAPI_LIB)
	MARK_AS_ADVANCED (MaxAudio_LIB)
	MARK_AS_ADVANCED (Jitter_LIB)

	add_definitions(
		-DMAXAPI_USE_MSCRT
		-DWIN_VERSION
	)

ELSE()

set(C74_SYM_LINKER_FLAGS "-Wl,-U,_sysmem_newptr,-U,_sysmem_freeptr,-U,_sysmem_resizeptr,-U,_strncpy_zero,-U,_stdinletinfo,-U,_outlet_new,-U,_outlet_anything,-U,_object_getmethod,-U,_object_post,-U,_object_obex_store,-U,_object_obex_dumpout,-U,_object_method,-U,_object_error,-U,_object_alloc,-U,_hashtab_store,-U,_hashtab_new,-U,_hashtab_lookup,-U,_gensym,-U,_error,-U,_common_symbols_gettable,-U,_class_register,-U,_class_new,-U,_class_attr_addattr_parse,-U,_class_addmethod,-U,_class_addattr,-U,_attr_offset_new,-U,_attr_args_process,-U,_attr_args_offset,-U,_atom_setsym,-U,_atom_setlong,-U,_atom_setfloat,-U,_atom_gettype,-U,_atom_getsym,-U,_atom_getlong,-U,_atom_getfloat,-U,_z_dsp_setup,-U,_z_dsp_free,-U,_sys_getsr,-U,_dsp_addv,-U,_class_dspinit,-U,_jit_object_method,-U,_outlet_int,-U,_outlet_list,-U,_class_attr_get,-U,_dsp_add,-U,_fileusage_addfile,-U,_locatefile_extended,-U,_nameinpath,-U,_path_closefolder,-U,_path_foldernextfile,-U,_path_openfolder,-U,_defer_low,-U,_globalsymbol_reference,-U,_globalsymbol_dereference,-U,_bangout,-U,_freeobject,-U,_outlet_bang,-U,_outlet_float,-U,_proxy_getinlet,-U,_proxy_new,-U,_atom_arg_getlong,-U,_atom_arg_getsym,-U,_floatout,-U,_intout,-U,_post,-U,_sys_getblksize,-U,_sysmem_newptrclear,-U,_object_attr_setfloat,-U,_object_attr_setlong,-U,_atom_arg_getfloat,-U,_atom_getfloatarg,-U,_listout,-U,_attr_addfilter_clip,-U,_attr_dictionary_process,-U,_class_attr_addattr_format,-U,_jbox_free,-U,_jbox_get_rect_for_view,-U,_jbox_initclass,-U,_jbox_new,-U,_jbox_ready,-U,_jbox_redraw,-U,_jgraphics_fill,-U,_jgraphics_rectangle_rounded,-U,_jgraphics_set_source_jrgba,-U,_object_attach_byptr,-U,_object_attr_get_rect,-U,_object_attr_set_rect,-U,_object_detach_byptr,-U,_object_dictionaryarg,-U,_object_register,-U,_object_unregister,-U,_patcherview_get_jgraphics,-U,_symbol_unique,-U,_attr_offset_array_new,-U,_defer,-U,_object_free,-U,_object_method_typed,-U,_object_new_typed,-U,_path_copyfile,-U,_path_copyfolder,-U,_path_createfolder,-U,_path_frompathname,-U,_path_nameconform,-U,_clock_delay,-U,_clock_new,-U,_clock_unset,-U,_intin,-U,_addmess,-U,_newobject,-U,_setup,-U,_z_add_signalmethod,-U,_object_attr_setsym,-U,_open_dialog,-U,_path_addnamed,-U,_path_createsysfile,-U,_path_getfilemoddate,-U,_path_opensysfile,-U,_path_topotentialname,-U,_sysfile_close,-U,_sysfile_geteof,-U,_sysfile_read,-U,_sysfile_seteof,-U,_sysfile_write,-U,_systime_secondstodate,-U,_qelem_new,-U,_qelem_free,-U,_qelem_set,-U,_jit_class_addadornment,-U,_jit_class_addattr,-U,_jit_class_addmethod,-U,_jit_class_findbyname,-U,_jit_class_new,-U,_jit_class_register,-U,_jit_error_code,-U,_jit_object_alloc,-U,_jit_object_free,-U,_jit_object_new,-U,_jit_object_new_imp,-U,_max_addmethod_usurp_low,-U,_max_jit_attr_args,-U,_max_jit_classex_mop_wrap,-U,_max_jit_classex_setup,-U,_max_jit_classex_standard_wrap,-U,_max_jit_mop_assist,-U,_max_jit_mop_free,-U,_max_jit_mop_getoutputmode,-U,_max_jit_mop_outputmatrix,-U,_max_jit_mop_setup_simple,-U,_max_jit_obex_adornment_get,-U,_max_jit_obex_free,-U,_max_jit_obex_jitob_get,-U,_max_jit_obex_new,-U,_jbox_get_nextobject,-U,_jbox_get_object,-U,_jbox_get_varname,-U,_jpatcher_get_box,-U,_jpatcher_get_firstobject,-U,_object_attr_getnames,-U,_object_attr_getvalueof,-U,_object_new_imp,-U,_object_obex_lookup,-U,_jit_atom_setfloat,-U,_jit_error_sym,-U,_jit_matrix_info_default,-U,_jit_object_findregistered,-U,_jit_symbol_unique,-U,_max_jit_obex_dumpout,-U,_jit_object_detach,-U,_jit_object_attach,-U,_atom_setobj,-U,_gettime,-U,_critical_enter,-U,_critical_exit,-U,_object_attr_setchar,-U,_object_new,-U,_object_warn,-U,_outlet_atoms,-U,_atom_setparse,-U,_class_findbyname,-U,_maxversion,-U,_newinstance,-U,_object_attr_getobj,-U,_object_attr_getsym,-U,_object_classname,-U,_object_method_long,-U,_object_method_parse,-U,_path_topathname,-U,_qelem_unset,-U,_saveas_promptset,-U,_saveasdialog_extended,-U,_setclock_fdelay,-U,_sysmem_copyptr,-U,_systime_ms,-U,_zgetfn,-U,__jit_sym_char,-U,__jit_sym_getdata,-U,__jit_sym_jit_matrix,-U,__jit_sym_setinfo,-U,_jit_object_register,-U,_jit_object_unregister,-U,_class_dspinitjbox,-U,_jbox_notify,-U,_jgraphics_attr_setrgba,-U,_jgraphics_image_surface_create,-U,_jgraphics_image_surface_draw,-U,_jgraphics_image_surface_set_pixel,-U,_jgraphics_line_to,-U,_jgraphics_move_to,-U,_jgraphics_rectangle_fill_fast,-U,_jgraphics_set_line_width,-U,_jgraphics_stroke,-U,_jgraphics_surface_destroy,-U,_notify_free,-U,_sys_getdspstate,-U,_z_jbox_dsp_free,-U,_z_jbox_dsp_setup,-U,_classname_openhelp,-U,_classname_openrefpage,-U,_jbox_getoutlet,-U,_newobject_sprintf,-U,_object_attr_setvalueof,-U,_object_method_sym,-U,_filewatcher_new,-U,_filewatcher_start,-U,_filewatcher_stop,-U,_atom_alloc,-U,_attribute_new_parse,-U,_class_sticky,-U,_class_sticky_clear,-U,_dictionary_read,-U,_jbox_get_textfield,-U,_jbox_set_mousedragdelta,-U,_jdialog_showtext,-U,_jfont_create,-U,_jfont_destroy,-U,_jgraphics_arc,-U,_jgraphics_close_path,-U,_jgraphics_select_font_face,-U,_jgraphics_set_font_size,-U,_jgraphics_show_text,-U,_jpatcher_get_firstview,-U,_jpopupmenu_additem,-U,_jpopupmenu_addseperator,-U,_jpopupmenu_create,-U,_jpopupmenu_destroy,-U,_jpopupmenu_popup,-U,_jpopupmenu_setfont,-U,_linklist_append,-U,_linklist_clear,-U,_linklist_getindex,-U,_linklist_getsize,-U,_linklist_new,-U,_object_addattr_format,-U,_object_attach_byptr_register,-U,_object_attr_setcolor,-U,_object_attr_setobj,-U,_symobject_new,-U,_textfield_get_textmargins,-U,_textfield_set_editonclick,-U,_textfield_set_noactivate,-U,_textfield_set_readonly,-U,_textfield_set_textcolor,-U,_textfield_set_textmargins,-U,_textfield_set_useellipsis,-U,_textfield_set_wordwrap,-U,_jgraphics_line_draw_fast,-U,_jgraphics_rectangle,-U,_jmouse_setposition_view,-U,_atom_gettext,-U,_jgraphics_oval,-U,_jgraphics_set_source_rgb,-U,_jgraphics_set_source_rgba,-U,_jrgba_set,-U,_jpopupmenu_popup_nearbox,-U,_jtextlayout_create,-U,_jtextlayout_destroy,-U,_jtextlayout_draw,-U,_jtextlayout_set,-U,_jtextlayout_settextcolor,-U,__jit_sym_float32,-U,__jit_sym_getindex,-U,__jit_sym_jit_attr_offset,-U,__jit_sym_jit_mop,-U,__jit_sym_lock,-U,_jit_object_error,-U,__jit_sym_jit_attr_offset_array,-U,__jit_sym_long,-U,__jit_sym_symbol,-U,_table_get,-U,_jbox_get_maxclass,-U,_jpatchline_get_box1,-U,_jpatchline_get_box2,-U,_jpatchline_get_inletnum,-U,_jpatchline_get_outletnum,-U,_cpost,-U,_object_error_obtrusive,-U,_gensym_tr,-U,_str_tr,-U,_jit_object_method_imp,-U,_object_method_imp,-U,_buffer_getchannelcount,-U,_buffer_getframecount,-U,_buffer_locksamples,-U,_buffer_ref_getobject,-U,_buffer_ref_new,-U,_buffer_ref_notify,-U,_buffer_ref_set,-U,_buffer_setdirty,-U,_buffer_unlocksamples,-U,_buffer_view,-U,_dictionary_sprintf,-U,_dictionary_appendatoms,-U,_dictionary_new,-U,_dictionary_appenddictionary,-U,_jpatcher_get_parentpatcher,-U,_atom_getlong,-U,_fileusage_addpackage,-U,_systimer_gettime,-U,_sysfile_readtextfile,-U,_sysmem_freehandle,-U,_sysmem_handlesize,-U,_sysmem_newhandle,-U,_sysmem_newhandleclear,-U,_atom_getobj,-U,_atomarray_getatoms,-U,_atomisatomarray,-U,_atomisstring,-U,_dictionary_getatoms,-U,_dictionary_getkeys_ordered,-U,_dictobj_findregistered_retain,-U,_dictobj_release,-U,_hashtab_flags,-U,_hashtab_lookuplong,-U,_jcolumn_setcheckbox,-U,_jcolumn_setlabel,-U,_jcolumn_setnumeric,-U,_jcolumn_setrowcomponentmsg,-U,_jcolumn_setvaluemsg,-U,_jcolumn_setwidth,-U,_jdataview_addcolumn,-U,_jdataview_addrows,-U,_jdataview_clear,-U,_jdataview_new,-U,_jdataview_patcherinvis,-U,_jdataview_patchervis,-U,_jdataview_setclient,-U,_jdataview_setcolumnheaderheight,-U,_jdataview_setheight,-U,_object_notify,-U,_string_getptr,-U,_atomisdictionary,-U,_dsp_add64,-U,_buffer_getmillisamplerate,-U,_buffer_getsamplerate,-U,_buffer_ref_exists,-U,_saveas_dialog,-U,_path_toabsolutesystempath,-U,_dictionary_getkeys,-U,_path_opensysfile,-U,_object_attr_touch,-U,_object_method_direct_getmethod,-U,_object_method_direct_getobject,-U,_object_method_obj,-U,_string_new,-U,_dictionary_clone_to_existing,-U,_dictionary_copyunique,-U,_dictobj_dictionaryfromatoms,-U,_dictobj_namefromptr,-U,_dictobj_register,-U,_object_retain,-U,_clock_fdelay,-U,_path_desktopfolder,-U,_path_getapppath,-U,_path_tempfolder,-U,_preferences_path")

set(C74_JITTER_SYM_LINKER_FLAGS "-U,_jit_class_new,-U,_jit_object_free,-U,_jit_object_alloc,-U,_max_jit_mop_free,-U,_max_jit_obex_new,-U,_max_jit_attr_args,-U,_max_jit_obex_free,-U,_jit_class_register,-U,_jit_object_new_imp,-U,_max_jit_mop_assist,-U,_jit_class_addmethod,-U,_jit_class_findbyname,-U,_jit_object_method_imp,-U,_max_jit_classex_setup,-U,_jit_class_addadornment,-U,_max_jit_obex_jitob_get,-U,_max_jit_classex_mop_wrap,-U,_max_jit_mop_setup_simple,-U,_max_jit_classex_standard_wrap,-U,_jit_attr_setlong,-U,_jit_attr_setsym,-U,_jit_mop_output_nolink,-U,_jit_mop_single_planecount,-U,_jit_mop_single_type,-U,_max_jit_classex_mop_mproc,-U,_jit_attr_addfilterset_clip,-U,_max_jit_mop_getoutputmode,-U,_jit_error_code,-U,_jit_object_attach,-U,_jit_object_dettach,-U,_jit_matrix_info_default,-U,_max_jit_mop_getinput,-U,_jit_parallel_ndim_simplecalc3,-U,_jit_mop_ioproc_copy_adapt,-U,_jit_mop_input_nolink,-U,_max_jit_mop_getoutput,-U,_max_jit_object_alloc,-U,_max_jit_object_free,-U,_max_jit_class_wrap_standard,-U,_max_jit_class_obex_setup,-U,_max_jit_class_mop_wrap,-U,_jit_parallel_ndim_simplecalc1,-U,_jit_parallel_ndim_simplecalc2,-U,_jit_parallel_ndim_simplecalc3,-U,_jit_parallel_ndim_simplecalc4")






set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${C74_SYM_LINKER_FLAGS},${C74_JITTER_SYM_LINKER_FLAGS}")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${C74_SYM_LINKER_FLAGS},${C74_JITTER_SYM_LINKER_FLAGS}")
set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${C74_SYM_LINKER_FLAGS},${C74_JITTER_SYM_LINKER_FLAGS}")

ENDIF()
