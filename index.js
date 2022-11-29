import React from "react";
import { View, Platform } from "react-native";
import ContextMenuNativeComponent from './src/ContextMenuNativeComponent';

const ContextMenu = (props) => {
  return (
    <ContextMenuNativeComponent {...props}>
      {props.children}
      {props.preview != null && Platform.OS === 'ios' ? (
        <View nativeID="ContextMenuPreview">{props.preview}</View>
      ) : null}
    </ContextMenuNativeComponent>
  );
};

export default ContextMenu;
