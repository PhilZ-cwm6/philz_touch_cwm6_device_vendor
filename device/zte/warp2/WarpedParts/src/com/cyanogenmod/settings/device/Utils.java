package com.cyanogenmod.settings.device;

import android.util.Log;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.SyncFailedException;

public class Utils
{
    private static final String TAG = "WarpedParts";

    public static void writeValue(String parameter, int value) {
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(new File(parameter));
            fos.write(String.valueOf(value).getBytes());
            fos.flush();
            // fos.getFD().sync();
        } catch (FileNotFoundException ex) {
            Log.w(TAG, "file " + parameter + " not found: " + ex);
        } catch (SyncFailedException ex) {
            Log.w(TAG, "file " + parameter + " sync failed: " + ex);
        } catch (IOException ex) {
            Log.w(TAG, "IOException trying to sync " + parameter + ": " + ex);
        } catch (RuntimeException ex) {
            Log.w(TAG, "exception while syncing file: ", ex);
        } finally {
            if (fos != null) {
                try {
                    Log.w(TAG, "file " + parameter + ": " + value);
                    fos.close();
                } catch (IOException ex) {
                    Log.w(TAG, "IOException while closing synced file: ", ex);
                } catch (RuntimeException ex) {
                    Log.w(TAG, "exception while closing file: ", ex);
                }
            }
        }
    }
    
        public void checkboxChanged(String p) {
        
        if (p == hwacc) {
        
        String s = "CAUTION!!!";
        String t = "Changing this option requires a full reboot. Reboot now?";
        String y = "Reboot Now";
        String n = "Not Now";
        String c = "Cancel";
        
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());

//
        builder.setMessage(t)
               .setTitle(s);
               
        builder.setPositiveButton(y, new DialogInterface.OnClickListener() {
           public void onClick(DialogInterface dialog, int id) {
               PowerManager powerManager = (PowerManager) getSystemService(Context.POWER_SERVICE);
               powerManager.reboot(null);
           }
       });
        builder.setNegativeButton(c, new DialogInterface.OnClickListener() {
           public void onClick(DialogInterface dialog, int id) {
               if(android.os.SystemProperties.get(debug.sf.hw) == 0){
                        android.os.SystemProperties.set(debug.sf.hw, 1);
                        cb.setChecked(true);
                    }
                else
                    if(android.os.SystemProperties.get(debug.sf.hw) == 1){
                        android.os.SystemProperties.set(debug.sf.hw, 0);
                        cb.setChecked(false);
                    }
           }
       });
        builder.setNeutralButton(c, new DialogInterface.OnClickListener() {
           public void onClick(DialogInterface dialog, int id) {
               dialog.dismiss();
           }
       });
       
        }


        AlertDialog dialog = builder.create();
    }
}
}
