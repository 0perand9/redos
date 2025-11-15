{
  pkgs,
  config,
  lib,
  ...
}:
let
  intellijVersion = builtins.concatStringsSep "." (
    lib.take 2 (lib.splitString "." pkgs.jetbrains.idea-ultimate.version)
  );
in
{
  home.packages = with pkgs; [
    jetbrains.idea-ultimate
    jetbrains.rust-rover
    jetbrains.datagrip
  ];

  home.file.".config/JetBrains/IntelliJIdea${intellijVersion}/colors/stylix.icls".text = ''
    <scheme name="Stylix" version="142" parent_scheme="Darcula">
      <metaInfo>
        <property name="created">2025-01-01T00:00:00</property>
        <property name="ide">idea</property>
        <property name="ideVersion">2025.1</property>
        <property name="modified">2025-01-01T00:00:00</property>
      </metaInfo>
      <colors>
        <option name="CARET_COLOR" value="${config.lib.stylix.colors.base0D}" />
        <option name="CARET_ROW_COLOR" value="${config.lib.stylix.colors.base01}" />
        <option name="GUTTER_BACKGROUND" value="${config.lib.stylix.colors.base00}" />
        <option name="INDENT_GUIDE" value="${config.lib.stylix.colors.base02}" />
        <option name="LINE_NUMBERS_COLOR" value="${config.lib.stylix.colors.base03}" />
        <option name="METHOD_SEPARATORS_COLOR" value="${config.lib.stylix.colors.base02}" />
        <option name="SELECTED_INDENT_GUIDE" value="${config.lib.stylix.colors.base0D}" />
        <option name="SELECTED_TEARLINE_COLOR" value="${config.lib.stylix.colors.base0D}" />
        <option name="SELECTION_BACKGROUND" value="${config.lib.stylix.colors.base02}" />
        <option name="SELECTION_FOREGROUND" value="${config.lib.stylix.colors.base05}" />
        <option name="TEARLINE_COLOR" value="${config.lib.stylix.colors.base02}" />
        <option name="WHITESPACES" value="${config.lib.stylix.colors.base02}" />
      </colors>
      <attributes>
        <option name="TEXT">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base05}" />
            <option name="BACKGROUND" value="${config.lib.stylix.colors.base00}" />
          </value>
        </option>
        <option name="BAD_CHARACTER">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base08}" />
            <option name="EFFECT_COLOR" value="${config.lib.stylix.colors.base08}" />
            <option name="EFFECT_TYPE" value="2" />
          </value>
        </option>
        <option name="CONSOLE_ERROR_OUTPUT">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base08}" />
          </value>
        </option>
        <option name="CONSOLE_NORMAL_OUTPUT">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base05}" />
          </value>
        </option>
        <option name="DEFAULT_KEYWORD">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base0E}" />
          </value>
        </option>
        <option name="DEFAULT_STRING">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base0B}" />
          </value>
        </option>
        <option name="DEFAULT_NUMBER">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base09}" />
          </value>
        </option>
        <option name="DEFAULT_COMMENT">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base03}" />
            <option name="FONT_TYPE" value="2" />
          </value>
        </option>
        <option name="DEFAULT_DOC_COMMENT">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base03}" />
            <option name="FONT_TYPE" value="2" />
          </value>
        </option>
        <option name="DEFAULT_FUNCTION_DECLARATION">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base0D}" />
          </value>
        </option>
        <option name="DEFAULT_INSTANCE_METHOD">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base0D}" />
          </value>
        </option>
        <option name="DEFAULT_STATIC_METHOD">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base0D}" />
          </value>
        </option>
        <option name="DEFAULT_CLASS_NAME">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base0A}" />
          </value>
        </option>
        <option name="DEFAULT_INTERFACE_NAME">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base0A}" />
          </value>
        </option>
        <option name="DEFAULT_IDENTIFIER">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base05}" />
          </value>
        </option>
        <option name="IDENTIFIER_UNDER_CARET_ATTRIBUTES">
          <value>
            <option name="BACKGROUND" value="${config.lib.stylix.colors.base02}" />
            <option name="ERROR_STRIPE_COLOR" value="${config.lib.stylix.colors.base0D}" />
          </value>
        </option>
        <option name="WRITE_IDENTIFIER_UNDER_CARET_ATTRIBUTES">
          <value>
            <option name="BACKGROUND" value="${config.lib.stylix.colors.base02}" />
            <option name="ERROR_STRIPE_COLOR" value="${config.lib.stylix.colors.base0E}" />
          </value>
        </option>
        <option name="MATCHED_BRACE_ATTRIBUTES">
          <value>
            <option name="BACKGROUND" value="${config.lib.stylix.colors.base02}" />
            <option name="FONT_TYPE" value="1" />
          </value>
        </option>
        <option name="SEARCH_RESULT_ATTRIBUTES">
          <value>
            <option name="BACKGROUND" value="${config.lib.stylix.colors.base0A}" />
            <option name="ERROR_STRIPE_COLOR" value="${config.lib.stylix.colors.base0A}" />
          </value>
        </option>
        <option name="WRITE_SEARCH_RESULT_ATTRIBUTES">
          <value>
            <option name="BACKGROUND" value="${config.lib.stylix.colors.base09}" />
            <option name="ERROR_STRIPE_COLOR" value="${config.lib.stylix.colors.base09}" />
          </value>
        </option>
        <option name="TEXT_SEARCH_RESULT_ATTRIBUTES">
          <value>
            <option name="BACKGROUND" value="${config.lib.stylix.colors.base02}" />
            <option name="EFFECT_COLOR" value="${config.lib.stylix.colors.base0D}" />
            <option name="ERROR_STRIPE_COLOR" value="${config.lib.stylix.colors.base0D}" />
          </value>
        </option>
        <option name="TODO_DEFAULT_ATTRIBUTES">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base0A}" />
            <option name="FONT_TYPE" value="2" />
            <option name="ERROR_STRIPE_COLOR" value="${config.lib.stylix.colors.base0A}" />
          </value>
        </option>
        <option name="WARNING_ATTRIBUTES">
          <value>
            <option name="BACKGROUND" value="${config.lib.stylix.colors.base0A}" />
            <option name="ERROR_STRIPE_COLOR" value="${config.lib.stylix.colors.base0A}" />
            <option name="EFFECT_TYPE" value="2" />
          </value>
        </option>
        <option name="ERROR_ATTRIBUTES">
          <value>
            <option name="FOREGROUND" value="${config.lib.stylix.colors.base08}" />
            <option name="ERROR_STRIPE_COLOR" value="${config.lib.stylix.colors.base08}" />
            <option name="EFFECT_TYPE" value="2" />
          </value>
        </option>
      </attributes>
    </scheme>
  '';
}
