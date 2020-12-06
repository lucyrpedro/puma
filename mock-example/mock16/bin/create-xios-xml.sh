#!/bin/bash

# Create XIOS xml file
cat > iodef.xml << EOF
<!-- Test XIOS ensemble -->

<simulation>
  <context id="xios_test" >
    <axis_definition prec="8">
      <axis id="ensemble" />
      <axis id="um-atmos_dp17" long_name="pressure levels" n_glo="17" name="dp17" positive="down" standard_name="air_pressure" unit="hPa" value="(0,16)[1000.000 925.000 850.000 700.000 600.000 500.000 400.000 300.000 250.000 200.000 150.000 100.000 70.000 50.000 30.000 20.000 10.000]" />
    </axis_definition>

    <domain_definition prec="8">
      <domain id="input_domain" name="in" />
    </domain_definition>

    <grid_definition>
      <grid id="grid_ens_in">
        <domain domain_ref="input_domain" />
        <axis axis_ref="um-atmos_dp17" />
        <axis axis_ref="ensemble" />
      </grid>
      <grid id="grid_ens_mean">
        <domain domain_ref="input_domain" />
        <axis axis_ref="um-atmos_dp17" />
        <scalar id="ensmean">
          <reduce_axis operation="average" />
        </scalar>
      </grid>
    </grid_definition>

    <field_definition default_value="-1073741824.0" prec="8" >
      <field id="u" check_if_active=".TRUE." grid_ref="grid_ens_in" long_name="U COMPNT OF WIND ON P LEV/UV GRID" standard_name="eastward_wind" unit="m s-1" />
    </field_definition>

    <!-- <file_definition format="netcdf4" time_counter="instant" type="multiple_file" > -->
    <file_definition format="netcdf4" time_counter="instant" type="one_file" >
      <file id="output" name="esdm://ens_test" output_freq="1h">
        <field field_ref="u" operation="instant" />
      </file>
      <file id="output_ens" name="esdm://ens_mean" output_freq="1h">
        <field field_ref="u" name="u_ens" grid_ref="grid_ens_mean" operation="instant" />
        <field field_ref="u" operation="instant" />
      </file>
    </file_definition>
  </context>

  <context id="xios">
    <variable_definition>
      <variable id="using_server" type="bool">true</variable>
      <variable id="info_level" type="int">100</variable>
      <variable id="print_file" type="bool">true</variable>
    </variable_definition>
  </context>
</simulation>
EOF