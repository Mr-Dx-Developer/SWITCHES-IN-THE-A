Config = {};

Config.Locale = 'en'; // en / pt / es / fr / de / nl / sv

Config.MusicVolume = 0.15 // 0.0 - 1.0

Config.BackgroundVideo = true // true it will use a video (img/video/.WEBM), false it will use a carousel of images (img/slide/.JPG)

Config.UseYoutubeVideo = false // true it will use a youtube video, false it will use a local video (img/video/.WEBM)

Config.YoutubeVideoID = 'QdBZY2fkU-0' // Youtube video ID (The ID is the last part of the URL after 'watch?v=')

Config.UpdateCarouselTime = 8; // Time in seconds

Config.Color = '#1f5eff' // Color of the UI

Config.SocialMedia = {
    instagram: {
        link: "https://instagram.com/outdamud_rp?igshid=NGVhN2U2NjQ0Yg%3D%3D&utm_source=qr", // Change this to your social media link
    },
    tiktok: {
        link: "https://www.tiktok.com/@outdamud.gg?_t=8kUJ2Zqocsk&_r=1",
    },
    discord: {
        link: "https://discord.gg/odmatlantav3",
    },
};

Config.StaffMembers = {
    1: {
        name: "Rico Haiti ", // Staff member name
        rank: "Owner", // Staff member rank (administrator / moderator and can't be changed)
        image: "https://cdn.discordapp.com/attachments/1150972679940214816/1195122746720538634/IMG_7427.jpg?ex=65f3714b&is=65e0fc4b&hm=21e98a81390b671c314befed1fcac8a8e3dd49935aecad7a9597d8ca9f999792&", // Staff member image (img/avatars/image_name.jpg) or a link ( needs to start with https://)
    },
    2: {
        name: "Stormii Haiti",
        rank: "Owner",
        image: "https://cdn.discordapp.com/attachments/1150972679940214816/1195130030087475270/IMG_8020.jpg?ex=65f37813&is=65e10313&hm=a640052d133107870f0dc346e02cb7da4e0b29dc37167e6751dfc5d311a2b3b0&",
    },
}

Config.UpdateList = {
    1: {
        date: 'November 25, 2023',
        title: 'Update Patch Notes 1.1',
        subtitle: 'Our new update is finally here!',
        description: 'We are thrilled to announce our latest update after 7 months of development! This update includes new maps, new cars, and more!',
        image: 'patchnotes.jpg',
        updateList: {
            1: {
                description: 'New Maps: Explore the vast landscapes of our new map, filled with hidden treasures and dangers.',
            },
            2: {
                description: 'New Cars: Experience the thrill of driving our newly added cars, each with unique designs and features.',
            },
            3: {
                description: 'And More: We have also made several improvements and bug fixes to enhance your gaming experience.',
            },
        }
    },
    2: {
        date: 'December 21, 2023',
        title: 'Grand Racing Tournament',
        subtitle: 'Rev up your engines for the ultimate race!',
        description: 'Get ready for the thrill of the Grand Racing Tournament! Compete against the best racers, unlock new tracks, and claim the title of the fastest driver!',
        image: 'racing.jpg',
        updateList: {
            1: {
                description: 'Challenging Tracks: Experience adrenaline-pumping races on brand new and challenging racetracks.',
            },
            2: {
                description: 'High-Speed Vehicles: Unlock and race with high-performance vehicles, each with its unique characteristics.',
            },
            3: {
                description: 'Tournament Rewards: Compete for exclusive rewards and claim your place as the champion of the Grand Racing Tournament!',
            },
        }
    },
    3: {
        date: 'December 25, 2023',
        title: 'Christmas Sale Event',
        subtitle: 'The Christmas event is now available!',
        description: 'Celebrate the holiday season with our Christmas Sale Event! Enjoy special discounts, festive activities, and more!',
        image: 'christmas.jpg',
        updateList: {
            1: {
                description: 'Special Discounts: Explore the Christmas sale using the code \'OKOK-F4T8\' for 50% discount on okok.tebex.io - limited to the first 10 uses.',
            },
            2: {
                description: 'Festive Activities: Engage in holiday-themed activities scattered throughout the new island.',
            },
            3: {
                description: 'Limited-Time Rewards: Earn exclusive rewards by participating in the Christmas event. Don\'t miss out!',
            },
        }
    },
}

Config.Music = {
    1: {
        filename: 'BossManDlow.mp3',
        title: 'Mr Pot Scraper',
        artist: 'BossMan Dlow'
    }
   /*  2: {
        filename: 'allineed.mp3',
        title: 'All I Need',
        artist: 'Ariadne'
    },
    3: {
        filename: 'holdonme.mp3',
        title: 'Hold On Me',
        artist: 'Raul Ojamaa'
    } */
};