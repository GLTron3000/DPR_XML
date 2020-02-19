#!/bin/bash

for((i=1; i<10; i++)); do
    echo "<UE id='ue-$i'>";
    echo "   ...";
    echo "   <ref-intervenant ref='intervenant-$i'>";
    echo "</UE>";
    echo "   ...";
done

for((i=1; i<10; i++)); do
    echo "<intervenant id='intervenant-$i'>";
    echo "   ...";
    echo "</intervenant>";
done
exit 0