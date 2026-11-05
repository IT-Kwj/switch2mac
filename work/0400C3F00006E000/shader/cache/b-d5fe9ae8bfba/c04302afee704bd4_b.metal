#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_40 [[user(locn3), flat]];
    float4 m_32 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_30 [[user(locn7), flat]];
    float4 m_26 [[user(locn8)]];
    float4 m_28 [[user(locn9)]];
    float4 m_34 [[user(locn10)]];
    float4 m_49 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _58 = gl_FragCoord.w;
    float _60 = in.m_26.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_26.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_26.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_28.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_28.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_28.z;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_30.x;
    float _98 = in.m_32.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_34.w;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_36.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_36.z;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = 1.0 / _58;
    float _124 = _122 * _64;
    float _126 = _122 * _70;
    float _128 = _122 * _76;
    float _130 = _122 * _88;
    float _132 = _124 * _124;
    float _134 = _122 * _94;
    float _136 = in.m_38.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = fma(_126, _126, _132);
    float _144 = _122 * _82;
    float _146 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _148 = _130 + _146;
    float _150 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _152 = _134 + _150;
    float _154 = fma(_128, _128, _142);
    float _156 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _158 = _144 + _156;
    float _160 = in.m_40.y;
    float _162 = _158 * _158;
    float _164 = rsqrt(_154);
    float _166 = fma(_148, _148, _162);
    float _168 = fma(_152, _152, _166);
    float _170 = rsqrt(_168);
    float _172 = _124 * _164;
    float _174 = _126 * _164;
    float _176 = _128 * _164;
    float _178 = _172 * _172;
    float _180 = fma(_174, _174, _178);
    float _182 = fma(_176, _176, _180);
    float _184 = fma(_96, 100.0, _160);
    float _186 = _148 * _170;
    float _188 = _152 * _170;
    float _190 = _158 * _170;
    float _192 = _184 * 0.5;
    float _194 = rsqrt(_182);
    float _196 = _122 * _140;
    float _198 = _192 * 0.15915493667125701904296875;
    float _200 = in.m_42.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = fma(_196, 25.0, _192);
    float _208 = _198 * 6.283185482025146484375;
    float _210 = sin(_208);
    float _212 = _174 * _194;
    float _214 = _172 * _194;
    float _216 = _176 * _194;
    float _218 = _212 * _186;
    float _220 = in.m_42.y;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = -_218;
    float _228 = fma(_214, 0.75, _226);
    float _230 = fma(_210, 0.045000016689300537109375, 0.944999992847442626953125);
    float _232 = -_190;
    float _234 = -_218;
    float _236 = fma(_214, _232, _234);
    float _238 = fma(_210, -0.045000016689300537109375, 0.055000007152557373046875);
    float _240 = -_188;
    float _242 = fma(_216, _240, _228);
    float _244 = in.m_42.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = -_188;
    float _252 = fma(_216, _250, _236);
    float _254 = 1.0 / _238;
    float _256 = in.m_36.x;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = abs(_242);
    float _264 = precise::max(_230, _262);
    float _266 = abs(_252);
    float _268 = -_266;
    float _270 = _268 + 1.0;
    float _272 = precise::min(_264, 1.0);
    float _274 = precise::max(_270, 0.25);
    float _276 = -_230;
    float _278 = _276 + _272;
    float _280 = _206 * 0.15915493667125701904296875;
    float _282 = precise::min(_274, 1.0);
    float _284 = _122 * _102;
    float _286 = _278 * _254;
    float _288 = in.m_44.x;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = _280 * 6.283185482025146484375;
    float _296 = sin(_294);
    float _298 = -_284;
    float _300 = _298 + 1.0;
    float _302 = fma(_282, 1.33333337306976318359375, -0.3333333432674407958984375);
    float _304 = _286 * _286;
    float _306 = _300 * _300;
    float _308 = _302 * _302;
    float _310 = _284 * _284;
    float _312 = _122 * _120;
    float _314 = fma(_306, _304, _308);
    float _316 = _122 * _204;
    float _318 = fma(_310, 0.100000001490116119384765625, _314);
    float _320 = _122 * _224;
    float _322 = fma(_296, 0.02500000037252902984619140625, 0.02500000037252902984619140625);
    float _324 = -_316;
    float _326 = _324 + _312;
    float _328 = _318 + _322;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = _122 * _260;
    float _334 = _122 * _108;
    float _336 = _122 * _248;
    float _338 = _122 * _114;
    float _340 = fma(_330, _326, _316);
    bool _344 = _334 != 1.0;
    bool _346 = isnan(_334);
    bool _348 = _344 || _346;
    bool _350 = isnan(1.0);
    bool _352 = _348 || _350;
    float _354 = -_336;
    float _356 = _354 + _332;
    float _358 = -_320;
    float _360 = _358 + _338;
    float _362 = fma(_330, _356, _336);
    float _364 = fma(_330, _360, _320);
    float _366 = _122 * _292;
    bool _368 = !_352;
    if (!_368)
    {
        float _370 = gl_FragCoord.x;
        float _372 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _374 = _370 / _372;
        float _376 = gl_FragCoord.y;
        float _378 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _380 = _376 / _378;
        float _382 = trunc(_374);
        int _385 = int(_382);
        float _387 = trunc(_380);
        int _389 = int(_387);
        int _391 = _385 + 2;
        int _393 = _391 >> 1;
        uint _396 = uint(int(uint(_389) >> uint(1)));
        int _398 = _393 ^ int(_396);
        int _400 = _398 << 16;
        int _402 = _400 ^ _393;
        int _404 = 983055 & _402;
        float _406 = _334 * 256.0;
        int _408 = _404 << 6;
        int _410 = _408 + _404;
        float _412 = trunc(_406);
        int _414 = int(_412);
        int _416 = _410 & 13369548;
        uint _418 = uint(int(uint(_416) >> uint(3)));
        int _420 = _416 | int(_418);
        int _422 = _420 & 5570560;
        int _424 = _420 & 85;
        uint _426 = uint(int(uint(_414) >> uint(7)));
        int _428 = int(_426) + _414;
        uint _430 = uint(int(uint(_422) >> uint(15)));
        int _432 = int(_430) + _424;
        bool _434 = uint(_428) > uint(_432);
        if (!_434)
        {
            discard_fragment();
        }
        if (!_434)
        {
            out.m_47.x = _362;
            out.m_47.y = _364;
            out.m_47.z = _340;
            out.m_47.w = _366;
            return out;
        }
    }
    float _436 = _364 * 0.715200006961822509765625;
    float _438 = in.m_49.w;
    float _440 = gl_FragCoord.w;
    float _442 = _438 * _440;
    float _444 = in.m_49.x;
    float _446 = gl_FragCoord.w;
    float _448 = _444 * _446;
    float _450 = in.m_49.y;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = fma(_362, 0.2125999927520751953125, _436);
    float _458 = in.m_49.z;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = fma(_340, 0.072200000286102294921875, _456);
    bool _466 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _468 = 1.0 / _464;
    float _470 = _468 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _472 = precise::clamp(_470, 0.0, 1.0);
    float _474 = fma(_472, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _476 = _122 * _442;
    float _478 = 0.0 + _366;
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = _122 * _448;
    float _484 = _474 * _476;
    float _486 = _122 * _454;
    float _488 = _122 * _462;
    float _490 = fma(_362, _484, _482);
    float _492 = fma(_364, _484, _486);
    float _494 = fma(_340, _484, _488);
    float _496 = _482;
    if (!_466)
    {
        _496 = _480;
    }
    float _498 = _496;
    bool _500 = !_466;
    float _502 = _498;
    if (!_500)
    {
        float _504 = in.m_51.w;
        float _506 = gl_FragCoord.w;
        float _508 = _504 * _506;
        float _510 = in.m_51.z;
        float _512 = gl_FragCoord.w;
        float _514 = _510 * _512;
        float _516 = _122 * _508;
        float _518 = _122 * _514;
        float _520 = 1.0 / _516;
        float _522 = _518 * _520;
        float _524 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _526 = fma(_522, (*spvDescriptorSet0.fp_c8)._m0[30].w, _524);
        float _528 = 1.0 / _526;
        float _530 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _532 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _534 = fma(_528, _530, _532);
        float _536 = _534 * 8.0;
        float _538 = precise::clamp(_536, 0.0, 1.0);
        float _540 = _480 * _538;
        _502 = _540;
    }
    float _542 = _502;
    float _544 = 0.0 + _542;
    float _546 = precise::clamp(_544, 0.0, 1.0);
    out.m_47.x = _490;
    out.m_47.y = _492;
    out.m_47.z = _494;
    out.m_47.w = _546;
    return out;
}

