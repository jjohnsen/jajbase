<?php

class jajbaseHandler extends eZContentObjectEditHandler
{
    function fetchInput ($http, &$module, &$class, $object, &$version, $contentObjectAttributes, $editVersion, $editLanguage, $fromLanguage)
    {
 
    }
 
    static function storeActionList()
    {
    }
 
    function publish( $contentObjectID, $contentObjectVersion )
    {
        // fetch object
        $object = eZContentObject::fetch( $contentObjectID );

        // get content class object
        $contentClass = $object->attribute('content_class');

        if( $contentClass->attribute('identifier') == 'file' || $contentClass->attribute('identifier') == 'nettopp' ) {
            $contentObjectAttributes = $object->contentObjectAttributes();

            $loopLenght = count( $contentObjectAttributes );
 
            // Find image and file attribute
            for( $i = 0; $i < $loopLenght; $i++ )
            {
                switch( $contentObjectAttributes[$i]->attribute( 'contentclass_attribute_identifier' ) )
                {
                    case 'image':
                        $image = $contentObjectAttributes[$i];
                        break;
                    case 'file':
                        $file = $contentObjectAttributes[$i];
                        break;
                }
            }

            if( !$file->hasContent() ) 
                return;

            if( !is_object( $image ) ) {
                eZDebug::writeNotice( "Image field was not found", "pdf2image");
                return;
            }

            // Get previous version and check that file has changed
            if( (int)$file->Version > 0 && $image->hasContent() ) {
                $previousFile = eZContentObjectAttribute::fetch ($file->ID, $file->Version-1, true);
                if( is_object( $previousFile ) && $previousFile->hasContent() ) {
                    if( $previousFile->content()->Filename == $file->content()->Filename ) {
                        eZDebug::writeNotice( "File hasn't changed", "pdf2image");
                        return;
                    }
                }
            }
            
            // Check that file is PDF
            if( $file->content()->MimeType != "application/pdf" ) {
                eZDebug::writeNotice( "File not application/pdf", "pdf2image");
                return;
            }
            
            $source = $file->content()->filePath();
            
            if ( !file_exists( $source ) or !is_readable( $source ) ) {
                eZDebug::writeError( "File not readable or doesn't exist", "pdf2image");
                return;
            }
    
            $page = 0;
            $width = 1000;
            $height = 1000;
            
            $target = eZSys::cacheDirectory() ."/" . md5( time() . 'pdf2image' ) . ".jpg";
             
            // Run conversion and redirect error to stdin
            $cmd = "convert "
                 . "-density 200 "
                 . eZSys::escapeShellArgument( $source . "[" . $page . "]" ) . " "
                 . "-colorspace rgb "
                 . "-resize " . eZSys::escapeShellArgument(  $width . "x" . $height ) . " "
                 . eZSys::escapeShellArgument( $target ) . " 2>&1";
            
            eZDebug::writeNotice( "Converting '" . $cmd ."'", "pdf2image");
            $out = shell_exec( $cmd );

            // If we got a message somthing went wrong
            if( $out ) {
                eZDebug::writeError( "Conversion return error message '" . $out . "'", "pdf2image");
                // but it doesn't necessarily mean that it failed
                if( !is_readable( $target ) )
                    return;
            }

            // Add imagefile to image handler and save
            $imageContent = $image->content();
            $imageContent->initializeFromFile( $target, $object->Name );

            if( $imageContent->isStorageRequired() ) {
                $imageContent->store($image);
            }
            unlink( $target );
            
        }
    }

}

?>
