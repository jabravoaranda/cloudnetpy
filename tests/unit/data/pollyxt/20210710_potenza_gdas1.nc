CDF   	   
      time       level         	frequency            
   Conventions       CF-1.0     title         %GDAS1 single-site output over Potenza      location      Potenza    source        ohttps://www.ready.noaa.gov/gdas1.php using output produced by the profile binary in the HYSPLIT offline package    author        <Patric Seifert (seifert@tropos.de), TROPOS, Leipzig, Germany   institution       FLeibniz Institute for Tropospheric Research (TROPOS), Leipzig, Germany     history       �13-Jul-2021 19:09:02: Created from GDAS1 profiles produced with the profile binary in the HYSPLIT offline package using convert_gdas12pro.sh.      day        
     month               year      �        /   time                	long_name         	hours UTC      standard_name         time   units         &hours since 2021-07-10 00:00:00 +00:00          7�   forecast_time                   units         	hours UTC      	long_name         %Time since initialization of forecast      comments      WThis dataset is based on assimilation data. Forecast time is always considered to be 0.         7�   horizontal_resolution                   units         km     	long_name         Horizontal resolution of model     comments      �Resolution is 1 deg. Spatial resolution was calculated along x-direction as a function of latitude (dx=2*Pi*r_0*cos(latitude)/360) with r_0=6378 km being the Earths radius at the equator. Along y, spatial resolution is approx. 111 km.          7�   temperature                    
_FillValue        �y�    units         K      	long_name         Temperature    standard_name         air_temperature    C_format      %.2f   missing_value         �y�       \  7�   pressure                   
_FillValue        �y�    units         Pa     	long_name         Pressure   standard_name         air_pressure   C_format      %.0f   missing_value         �y�       \  8D   height                     
_FillValue        �y�    units         m      	long_name         Height above ground    standard_name         height     C_format      %.3f   missing_value         �y�       \  8�   rh                     
_FillValue        �y�    units         1      	long_name         Relative humidity      standard_name         relative_humidity      comment       SWith respect to liquid above 0 degrees C and with respect to ice below 0 degrees C.    C_format      %.8f   missing_value         �y�       \  8�   uwind                      
_FillValue        �y�    units         m s-1      	long_name         
Zonal wind     standard_name         eastward_wind      C_format      %.6f   missing_value         �y�       \  9X   vwind                      
_FillValue        �y�    units         m s-1      	long_name         Meridional wind    standard_name         northward_wind     C_format      %.6f   missing_value         �y�       \  9�   omega                      
_FillValue        �y�    units         Pa s-1     	long_name         %Vertical wind in pressure coordinates      standard_name         omega      C_format      %.6f   missing_value         �y�       \  :   q                      
_FillValue        �y�    units         1      	long_name         Specific humidity      standard_name         specific_humidity      comment       _Calculated from relative humidity, pressure, and temperature: q=rh*temperature2mixingratio(T,p)    C_format      %.8f   missing_value         �y�       \  :l   potential_temperature                      
_FillValue        �y�    units         K      	long_name         potential temperature      standard_name         air_potential_temperature      C_format      %.6f   missing_value         �y�       \  :�   latitude                units         	degrees_N      	long_name         Latitude of model gridpoint    standard_name         latitude        ;$   	longitude                   units         	degrees_E      	long_name         Longitude of model gridpoint   standard_name         	longitude           ;(   sfc_pressure                
_FillValue        �y�    units         Pa     	long_name         Surface pressure   standard_name         surface_pressure   
gdas1_info        1Pressure at surface [hPa] (PRSS), converted to Pa      C_format      %.0f   missing_value         �y�         ;,   sfc_msl_pressure                
_FillValue        �y�    units         Pa     	long_name         Mean sea level pressure    standard_name         msl_pressure   comment       "Pressure reduced to mean sea level     
gdas1_info        @Pressure reduced to mean sea level [hPa] (MSLP), converted to Pa   C_format      %.0f   missing_value         �y�         ;0   sfc_total_rain                  
_FillValue        �y�    units         kg m-2     	long_name         Total precipitation amount     standard_name         Total precipiation amount      
gdas1_info        LAccumulated precipitation (6 h accumulation) [m] (TPP6), converted to kg m-2   C_format      %.8f   missing_value         �y�         ;4   sfc_turb_mom_u                  
_FillValue        �y�    units         
kg m-1 s-2     	long_name         @Zonal turbulent momentum flux (3- or 6-h average) at the surface   standard_name         %surface_eastward_momentum_flux_in_air      
gdas1_info        >v-component of momentum flux (3- or 6-h average) [N/m2] (VMOF)     C_format      %.8f   missing_value         �y�         ;8   sfc_turb_mom_v                  
_FillValue        �y�    units         
kg m-1 s-2     	long_name         EMeridional turbulent momentum flux (3- or 6-h average) at the surface      standard_name         &surface_northward_momentum_flux_in_air     C_format      %.8f   missing_value         �y�         ;<   sfc_sens_heat_flx                   
_FillValue        �y�    units         W m-2      	long_name         Sensible heat flux     standard_name         #surface_downward_sensible_heat_flux    
gdas1_info        CSensible heat net flux at surface (3- or 6-h average) [W/m2] (SHTF)    C_format      %.8f   missing_value         �y�         ;@   
sfc_net_sw                  
_FillValue        �y�    units         W m-2      	long_name         #Surface net downward shortwave flux    standard_name         #surface_net_downward_shortwave_flux    
gdas1_info        DDownward short wave radiation flux (3- or 6-h average) [W/m2] (DSWF)   C_format      %.8f   missing_value         �y�         ;D   	sfc_rh_2m                   
_FillValue        �y�    units         1      	long_name         Relative humidity at 2m    standard_name         relative_humidity      
gdas1_info        =Relative Humidity at 2m AGL [%] (RH2M), converted to fraction      comment       With respect to liquid.    C_format      %.8f   missing_value         �y�         ;H   sfc_wind_u_10m                  
_FillValue        �y�    units         m s-1      	long_name         Zonal wind at 10m      
gdas1_info        ,U-component of wind at 10 m AGL [m/s] (U10M)   C_format      %.6f   missing_value         �y�         ;L   sfc_wind_v_10m                  
_FillValue        �y�    units         m s-1      	long_name         Zonal wind at 10m      
gdas1_info        ,V-component of wind at 10 m AGL [m/s] (V10M)   C_format      %.6f   missing_value         �y�         ;P   sfc_temp_2m                 
_FillValue        �y�    units         K      	long_name         Temperature at 2m      
gdas1_info         Temperature at 2m AGL [K] (TO2M)   C_format      %.2f   missing_value         �y�         ;T   sfc_cloud_fraction                  
_FillValue        �y�    units         1      	long_name         Surface total cloud fraction   
gdas1_info        GTotal cloud cover (3- or 6-h average) [%] (TCLD), converted to fraction    C_format      %.8f   missing_value         �y�         ;X   sfc_geopotential                
_FillValue        �y�    units         m2 s-2     	long_name         Geopotential   standard_name         geopotential   
gdas1_info         Geopotential height [gpm] (SHGT)   C_format      %.6f   missing_value         �y�         ;\   %convective_available_potential_energy                   
_FillValue        �y�    units         J kg-1     	long_name         ,Convective available potential energy (CAPE)   standard_name         0atmosphere_convective_available_potential_energy   
gdas1_info        3Convective available potential energy [J/Kg] (CAPE)    C_format      %.6f   missing_value         �y�         ;`   convective_inhibition                   
_FillValue        �y�    units         J kg-1     	long_name         Convective inhibition (CIN)    standard_name         ,atmosphere_convective_inhibition_wrt_surface   
gdas1_info        #Convective inhibition [J/kg] (CINH)    C_format      %.6f   missing_value         �y�         ;d   standard_lifted_index                   
_FillValue        �y�    units         K      	long_name         Standard lifted index      
gdas1_info         Standard lifted index [K] (LISD)   C_format      %.6f   missing_value         �y�         ;h   best_4layer_lifted_index                
_FillValue        �y�    units         K      	long_name         Standard lifted index      
gdas1_info        $Best 4-layer lifted index [K] (LIB4)   C_format      %.6f   missing_value         �y�         ;l   sfc_bl_height                   
_FillValue        �y�    units         m      	long_name         Planetary boundary layer height    
gdas1_info        *Planetary boundary layer height [m] (PBLH)     C_format      %.3f   missing_value         �y�         ;p   sfc_temp                
_FillValue        �y�    units         K      	long_name         Temperature at the surface     
gdas1_info        !Temperature at surface [K] (TMPS)      C_format      %.2f   missing_value         �y�         ;t   sfc_conv_rain                   
_FillValue        �y�    units         kg m-2     	long_name         Convective rainfall amount     standard_name         convective_rainfall_amount     
gdas1_info        WAccumulated convective precipitation (6 h accumulation) [m] (CPP6), converted to kg m-2    C_format      %.8f   missing_value         �y�         ;x   sfc_soil_moisture                   
_FillValue        �y�    units         1      	long_name         Volumetric_soil_moisture   C_format      %.8f   
gdas1_info        /Volumetric soil moisture content [frac.] (SOLM)    missing_value         �y�         ;|   sfc_categorial_snow                 
_FillValue        �     units         1      	long_name         Categorial snow    C_format      %.1d   
gdas1_info        >Categorial snow (yes=1, no=0) (3- or 6-h average) [0/1] (CSNO)     missing_value         �          ;�   sfc_categorial_ice                  
_FillValue        �     units         1      	long_name         Categorial ice     C_format      %.1d   
gdas1_info        =Categorial ice (yes=1, no=0) (3- or 6-h average) [0/1] (CICE)      missing_value         �          ;�   sfc_categorial_freezing_rain                
_FillValue        �     units         1      	long_name         Categorial freezing rain   C_format      %.1d   
gdas1_info        GCategorial freezing rain (yes=1, no=0) (3- or 6-h average) [0/1] (CFZR)    missing_value         �          ;�   sfc_categorial_rain                 
_FillValue        �     units         1      	long_name         Categorial rain    C_format      %.1d   
gdas1_info        >Categorial rain (yes=1, no=0) (3- or 6-h average) [0/1] (CRAI)     missing_value         �          ;�   sfc_net_lat_heat_flx                
_FillValue        �y�    units         W m-2      	long_name         #Net latent heat flux at the surface    standard_name         surface_net_latent_heat_flux   C_format      %.8f   missing_value         �y�         ;�   sfc_low_cloud_fraction                  
_FillValue        �y�    units         1      	long_name          Surface low-level cloud fraction   
gdas1_info        ELow cloud cover (3- or 6-h average) [%] (LCLD), converted to fraction      C_format      %.8f   missing_value         �y�         ;�   sfc_mid_cloud_fraction                  
_FillValue        �y�    units         1      	long_name          Surface mid-level cloud fraction   
gdas1_info        EMid cloud cover (3- or 6-h average) [%] (MCLD), converted to fraction      C_format      %.8f   missing_value         �y�         ;�   sfc_high_cloud_fraction                 
_FillValue        �y�    units         1      	long_name         !Surface high-level cloud fraction      
gdas1_info        FHigh cloud cover (3- or 6-h average) [%] (HCLD), converted to fraction     C_format      %.8f   missing_value         �y�         ;�   sfc_wind_dir_10m                
_FillValue        �y�    units         deg    	long_name         Wind direction at 10m      C_format      %.6f   missing_value         �y�         ;�   sfc_wind_spd_10m                
_FillValue        �y�    units         m s-1      	long_name         Wind velocity at 10m   C_format      %.6f   missing_value         �y�         ;�   level                  	long_name         Model level    units         1      standard_name         model_level_number     axis      Z      positive      down      \  7x   	frequency                  	long_name         Microwave frequency    units         GHz         7�A�  A�  A�  A�  A�  A�  A�  A�  Ap  A`  AP  A@  A0  A   A  A   @�  @�  @�  @�  @@  @   ?�  B�
B�          B�
.C�z�C�ǮC�nC�:�C��C��{C�!HC��{C�G�C���C��{C�!HC�T{C�T{C|��CtB�CkCbB�C_B�CY\CSu�CWu�Ca(�G�P G�n G�� G�� G�� G� G�@ G�| G�� G}� Gj` GV� GCP G/� G@ G� F�` F�P F�@ Fj` F@ E�@ D�  C  C�  D@ DJ@ D�� D�` E � E"p EF` Elp E�� E�8 E�� E�� E�X F\ FD F)� F@\ F]p F�� F�* F�P ?`B?`B? A�>�E�?�?$�?)7L>���=��w=��
=���>	7L>��\>��>k�>�?}>��H?�9=�`B=�P=#�
        ?���?ٙ�@���@�ff@Y��@,��@9��@���@�33@�  @�ffA  A!��AK33A[33Aq��A�  A�33A�  A���A   ����d�Ϳ�33�ٙ��l�����    @S33@s33@s33@33?���>�녾B�\��ff��33�fff��33��33�����L���   @Fff�k�@,�;�[�i>���ff�i>�            =��.��[�`��n��        =�O�                =��޼�O����        <!~<�<��<
-}<��<(|<�f;R�w:Z+�:=Cj:@[j:@?:x :#��9���9�0q9J�8���7h��6:��6y        C�� C�ٚC���C���C���C�� C���C���C�s3C���C�33C�L�C�Y�C�� C�33C��fC�Y�C�33C�ٚC��3C�L�C�� D,Y�B"ffA{33G�n G�p     ��=����33    ?r�?�ff��33A�      C��         C�  �c�
C  A�ff    =���  �  �  �  �                C���?�33@@      B�
.C��{C�!HC�{C��{C�nC�z�C�!HC��HC��C�:�C�nC�{C���C��HC|u�CsCku�Cb�\C_�\CY�\CSB�CW�)CaG�P G�n G�� G�� G�� G� G�@ G�| G�� G}� Gj` GV� GCP G/� G@ G� F�` F�P F�@ Fj` F@ E�@ D�  B�  C�� D@ DG@ D�  D�� D�� E!` EE0 Ek0 E�� E�� E�� E�0 E�� F F� F), F@ F]  F�\ F� F�. ?��?��?ƨ?G�?��>�p�>���=�{=���=�o=�C�>I�=��>F��>�G�?ȴ>o��>��7=ȴ9=#�
=49X        ?���?���@s33@s33@Fff@&ff@9��@S33@���@�33@�ffAffA#33A`  Ai��A�ffA�33A�  A�33A�ffA$���33�<�ͿO\)�O\)�S33�S33�33?ٙ�@Y��@��?�33?�ff?k�?�\�u�333��ff�s33��33�����`  ����@   @Y��?������?���?�������J    �����}(���?����8�>�[=�>�                >   >�l    ���.=�a        <!��<�o<��<	�{<�~;�#;v�:�(:J��:&:H�:B�q9��a:�9�Il9��8��8j��7Sg`6W�S6�        C�ٚC�33C�@ C�&fC��fC�ffC��fC�ٚC�&fC�� C��C�L�C���C�33C��C���C�&fC�ffC�&fC�&fC��C�33D,�3B"ffA{33G�< G�     �#�
    �;33    ?�u?�33�h��A�      C��         C�� @L��B��A���    =���  �  �  �  �                C�&f?ٙ�@�      B�
.C�aHC���C�nC���C�aHC�!HC���C�T{C��C�:�C�:�C�.C��C�ǮC|��CtCku�CaC^u�CZ\)CR�)CW�)C_��G�P G�n G�� G�� G�� G� G�@ G�| G�� G}� Gj` GV� GCP G/� G@ G� F�` F�P F�@ Fj` F@ E�@ D�  B�  C�� D� DH  D�� D�� D�  E!P EE Ek E�� E�x E�� E�8 E�� F F F)< F@ F] F�^ F�
 F�F >�>�>�|�>�^5>��T>�Ĝ>j~�=�;d=���=�t�=��=8Q�=� �>��^>+>��y?��>�l�>�+<�=49X        ?�ff@   @333@`  @333?�  @   @33@���@�33@�  @陚A)��AL��AD��AQ��A|��A�ffA�33A�33A33��  �!���&ff�fff���Ϳ������?Y��@y��@333?�33>���J=q��������������������33�Fff�����y��?�ff>#�
���;�.���P    =���>*��=���    =���                                    =���    ��O�            <��<��<!<�;�9y;�M?;BU�:��:R��:#J�:>9i9�8�9�,�:7҇9�3~9�Hf98��8~��7�b�63E�6�6        C�ffC��fC���C��C�ٚC�  C�33C���C��C�� C���C�ffC�33C��C�33C�33C��C���C�L�C�ٚC˦fC�33D+ffB"ffA{33G�< G�>     ���
<��
A��B�  >߾w@ff�W
=Ař�    C��         C�� @ə�CҀ A�ff    =���  �  �  �  �A               C��f@33A      B�
.C��C�:�C��HC��C��{C�.C�:�C�nC���C�.C�!HC�.C���C���C}(�Ct��Cku�CbC^(�CY�)CS��CXC_G�P G�n G�� G�� G�� G� G�@ G�| G�� G}� Gj` GV� GCP G/� G@ G� F�` F�P F�@ Fj` F@ E�@ D�  B�  C�  D  DH� D�  D�� D�� E!� EE` Ekp E�� E�� E�  E�P E�  F4 F$ F)\ F@$ F], F�l F� F�T >q��>q��>�1'>�
=>�ff>�\)>�\)=�=�{=�hs=���=�hs>��>��>�\)>��>Õ�>��>1'=�P=#�
        ?�33?�33?�33@ff@ff@��@ff@ff@&ff@L��@�33@�33A��A$��A9��A>ffAd��A�  A�  A�33Aff��ff�   ����,����Ϳٙ�����>���@&ff@Fff?�ff>B�\�k��s33��33��ff��  �(  ����A�������,��@   ?�33��  ���P���P��.=���>��[>�r>��[                ����            >]��    =�a                    ;ޗ�;�';Ζ�;�-�;ȷ�;�F�;�ѩ:�C�:d):�V:69�u�:�c9�|�9��9]�9	�	8U=7q<!6OC�6j        C��3C�Y�C��C��C��C��C��fC��fC��C�ffC��3C�ffC���C�L�C�� C�Y�C�&fC�� C��C�Y�C�s3C�L�D+9�B"ffA{33G�
 G�     ����=���C�� D$  >`A�?�  �FffA���    C��         C�� @�  D�  B&ff    =���  �  �  �  �A�ff            C�s3@Y��A@      B�
.C�z�C��C�T{C�!HC��HC�z�C�{C���C��HC�G�C�aHC�T{C���C�.C}(�Ct�)ClB�Ca��C^\)CY�)CT(�CXB�C_B�G�P G�n G�� G�� G�� G� G�@ G�| G�� G}� Gj` GV� GCP G/� G@ G� F�` F�P F�@ Fj` F@ E�@ D�  B�  C�  D  DF  D�@ D�  D�� E!� EE0 Ek  E�� E�� E�� E�P E�  F8 F, F)p F@< F]< F�t F�, F�B >(��>333>F��>\(�>p��>�
=>��H>�33>���=}�=�hs=�^5>�>I�>o��>��>�  >ؓu>!��='�=�P        >��
>��
>��
?�?\)?���?�ff@&ff@�33@�ff@�  @���A33A6ffA1��AA��Ai��A�ffA�ffA�  @��������i����  �������������s33��ff��\)?8Q�@�  ?xQ쿦ff�fff��33��  ��  ��33�  �   �4�Ϳ�  @   ?333��ff������ﾋ`�>-��>��?s33?�a?'�}>��=���=�I�=��P    ���?��l    >X-�>�`�=�����9�#�
        ;�	�;�W�;���;���;���;�#;�0�;�4;FȤ:��:t:�:�-9�q+9�T29Y�8�N�8to7��6e��6�|        C�� C���C���C�� C�s3C�s3C���C��fC��fC���C�  C���C�&fC���C�� C�L�C��fC�  C�&fC�ffC��3C��3D*�fB"ffA{33G�� GŨ     ����>#�
CĀ DJ  >#�
>\)����B      C��         C�  @�  E%� B333    =���  �  �  �  �A���            C�33@���Ap      B�
.C��C�:�C��HC��C��{C�G�C���C��{C�ǮC��C��C�aHC�ǮC�{C}u�Cu��Cl\)Cb�\C^u�CYCTB�CXu�C^��G�P G�n G�� G�� G�� G� G�@ G�| G�� G}� Gj` GV� GCP G/� G@ G� F�` F�P F�@ Fj` F@ E�@ D�  B�ffC�� D� DC� D� D�� D�� E!  ED� Ej� E�� E�� E�� E�H E�� F8 F8 F)| F@T F]X F�r F�& F�> >��>�=q>�z�>��
>�Q�>�(�?�\?�>��R=aG�=��P=�S�>$�=���>o>��>��^>�+=�h=0 �=\)        �,���,���9����33�n{?Q�@&ff@���A	��@�33@���@�33A   A��AffAP  A`  A�ffA�ffAt��@�  ��ff��33�����������������������Ϳ�33@&ff@�33�S33�l����ff�ٙ����������#33�33�  �H      ?�33��  �   ������UU����    >-��>���?��?��.?�O�=�l��l    >��?>��?>���>���>www        ��?            <
�<�c;�Z�;�R�;��:;���;ߨr;���;J`�:�:�:&$3:	�/9�'�9^2P9\�8֨8q��7Zgy6m��6�v        C��fC�Y�C��C��C��C�@ C�s3C�  C��fC�  C�L�C���C��fC�s3C��3C�ٚC�� C�ffC�@ C�L�C�  C��3D*l�B"ffA{33G�� G�v     =���>\C�  DJ  >z�H�9����ffB ff    C��         C�  @S33D�� B      =���  �  �  �  �B��            A���@���A�      B�
.C��HC�.C�aHC�G�C�G�C�!HC�nC�T{C�T{C�{C�nC��HC�z�C�z�C}��Cuu�Ck��Cb��C^\CX�\CT�)CWCa\G�P G�n G�� G�� G�� G� G�@ G�| G�� G}� Gj` GV� GCP G/� G@ G� F�` F�P F�@ Fj` F@ E�@ D�  B�  C�� D	� DD@ D�  D�  D�� E!@ EE Ej� E�� E�x E�� E�` E�  FP FH F)� F@h F]L F�p F�. F�H >���>���>��R>�{>�p�>�
=>��>�(�>�p�=q��=��T=�h>bN=�Q�=���>dZ>Xb>I�^>J=T��=\)        ����������33�L��?�  @@  @�33@�  @ə�@s33@�33@�ff@�  AffA>ffAA��Ak33A�ffA���A���@����  �fff�   ����,���L���L����ff�,��>���   ��ff������  �陚��ff�33��33��ff����  �aG��B�\@   @s33��8���J���?�4�J�4�J���J>���    �4�J�6a>��>��?>}'�            �]��    >[�    �X-�        <��<��;��`;�2K;�os;��k;��U;��;b�W: �: U:5K:'��9�� 9669HR�8�7���7c�6u��6��        C��fC�L�C���C��fC���C��C��3C���C�ffC�L�C��C��fC�� C��3C�  C��3C�� C�� C��3C�L�C͙�C�&fD,9�B"ffA{33G�t GŨ     =���>���C�  D
  >������Ϳ�33A���    C��         C�� @���B�  A�      =���  �  �  �  �Aݙ�            A���@��A�      B�
.C�{C�aHC�G�C��C�{C�nC��{C��C�:�C�:�C�ǮC�ǮC���C�!HC}u�CtCk(�Cc�\C^�\CX�)CS�)CX(�Ca(�G�P G�n G�� G�� G�� G� G�@ G�| G�� G}� Gj` GV� GCP G/� G@ G� F�` F�P F�@ Fj` F@ E�@ D�  B�  C�  D@ DF@ D�� D�  D�� E!0 ED� Ej� E�� E�x E�� E�H E�� F4 F F)d F@X F]L F�x F�0 F�p >�+>�+>�J>�J>և+>�|�>�>�Ĝ>�+=aG�=��T=��#>�=�Q�=��>j~�>���>�I�>%=#�
=�P        ?�33@ff@Fff@ff?(�?(�@9��?���?���@��@���A��AffA$��Al��Ap  Ay��A�ffA���A�  @�33��ff�&ff��\)����  ��  ��  >aG��   �`  ��  �S33��  ��  �ə���  ������  �����  ��ff    ?�  @   @l��    ��8�""�'�}�""���ﾠ�    >�`�>Ȉ�>8㎾X-����9�Ű[����-�=zO�>0[>333    =�?        <ڪ;�z;�p;�n;���;��G;�YF;�V	;kU�9�yi:!��:C[{:�-9�""9/S�9?v�8���8?�7p2�6D��6і        C��C�s3C�s3C�  C���C�Y�C�L�C��C�L�C�� C�s3C��C��C���C��3C�@ C��3C�&fC�L�C���C̦fC���D,Y�B"ffA{33G�
 G�     ���
<#�
��      >�bN@       A���    C��         C�  @���BA33A���    =���  �  �  �  �                C�  @   A�      B�
.C���C���C��HC�.C�ǮC�nC���C��HC�T{C�G�C��HC���C�aHC�nC}\Cu(�Cl(�Cb��C^CY��CS��CWB�C`\)G�P G�n G�� G�� G�� G� G�@ G�| G�� G}� Gj` GV� GCP G/� G@ G� F�` F�P F�@ Fj` F@ E�@ D�  B�  C�  D  DE  D�  D�` D�� E � EDp Ejp E�� E�P E�� E�� E�x F� F� F)0 F@ F] F�^ F� F� >ۥ�>ۥ�>�|�>�>�
=>ۥ�?�\?�R>�{=<j>$�=���>Xb=��>hs>aG�>�r�>���=ȴ9=�P=�P        ?���?���@�  @�  @�ff@l��@,��@,��@��@333@ə�A33A33A333AP  A\��A�  A���A�ffA���A���@  ���>u    �@  ��  ��  �@  ��  ������  ��33��33��ff��33��33�陚�������;33���;k�@   @Y����ff=���=����X-�    =���                =�9                >��}>�>�                =���        <�]< BO<�,<Pq;�w�;ե�;�e�;�M&;P�-9� �:���:9:O9��9m2�9?��910�8X�;7?��6Q�O6	�        C�� C��C���C�� C�L�C�Y�C�33C��C�ffC���C���C���C�ffC���C�s3C�� C���C�s3C�� C�s3C̀ C�� D+��B"ffA{33G�� G��     ���
    ����    >�D?���>�A�33    C��         C�� @���Aٙ�A���    =�G�  �  �  �  �@�              CuL�?���