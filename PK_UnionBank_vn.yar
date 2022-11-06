rule PK_UnionBank_vn : UnionBank
{
    meta:
        description = "Phishing Kit impersonating UnionBank"
        licence = "GPL-3.0"
        author = "Thomas 'tAd' Damonneville"
        reference = ""
        date = "2022-10-17"
        comment = "Phishing Kit - UnionBank - mostly found on .VN domain names"

    strings:
        // the zipfile working on
        $zip_file = { 50 4b 03 04 }
        // specific directory found in PhishingKit
        $spec_dir = "online"
        // specific file found in PhishingKit
        $spec_file = "confir-info.php"
        $spec_file2 = "confir.php"
        $spec_file3 = "index-info.php"
        $spec_file4 = "veri-info.php"
        $spec_file5 = "04aa55f8de2e368f5621bbfb4c0c67e2.jpg"

    condition:
        // look for the ZIP header
        uint32(0) == 0x04034b50 and
        // make sure we have a local file header
        $zip_file and
        all of ($spec_dir*) and 
        // check for file
        all of ($spec_file*)
}
