#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
    float4 m_34 [[user(locn2), flat]];
    float4 m_47 [[user(locn3)]];
    float4 m_36 [[user(locn4)]];
    float4 m_32 [[user(locn5), flat]];
    float4 m_30 [[user(locn6)]];
    float4 m_28 [[user(locn7)]];
    float4 m_45 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _54 = gl_FragCoord.w;
    float _56 = in.m_28.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_28.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_30.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_28.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_30.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_30.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_32.x;
    float _94 = in.m_32.y;
    float _96 = in.m_34.y;
    float _98 = 1.0 / _54;
    float _100 = _94 * 6.283185482025146484375;
    float _102 = _98 * _60;
    float _104 = _98 * _66;
    float _106 = _98 * _72;
    float _108 = _98 * _78;
    float _110 = _98 * _84;
    float _112 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _114 = _104 + _112;
    float _116 = _106 * _106;
    float _118 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _120 = _102 + _118;
    float _122 = _98 * _90;
    float _124 = _114 * _114;
    float _126 = fma(_110, _110, _116);
    float _128 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _130 = _108 + _128;
    float _132 = fma(_120, _120, _124);
    float _134 = fma(_122, _122, _126);
    float _136 = in.m_36.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = fma(_130, _130, _132);
    float _144 = fma(_92, 0.300000011920928955078125, 0.20000000298023223876953125);
    float _146 = rsqrt(_134);
    float _148 = in.m_38.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = fma(_96, _144, _100);
    float _156 = _154 * 0.15915493667125701904296875;
    float _158 = rsqrt(_142);
    float _160 = _156 * 6.283185482025146484375;
    float _162 = cos(_160);
    float _164 = _106 * _146;
    float _166 = _110 * _146;
    float _168 = _122 * _146;
    float _170 = _164 * _164;
    float _172 = _156 * 6.283185482025146484375;
    float _174 = sin(_172);
    float _176 = _114 * _158;
    float _178 = _120 * _158;
    float _180 = fma(_166, _166, _170);
    float _182 = _130 * _158;
    float _184 = _176 * _176;
    float _186 = fma(_168, _168, _180);
    float _188 = _162 * _162;
    float _190 = fma(_178, _178, _184);
    float _192 = fma(_182, _182, _190);
    float _194 = rsqrt(_186);
    float _196 = fma(_174, _174, _188);
    float _198 = rsqrt(_192);
    float _200 = rsqrt(_196);
    float _202 = _164 * _194;
    float _204 = _166 * _194;
    float _206 = _168 * _194;
    float _208 = _176 * _198;
    float _210 = _178 * _198;
    float _212 = _182 * _198;
    float _214 = _174 * _200;
    float _216 = _202 * _208;
    float _218 = _162 * _200;
    float _220 = fma(_204, _210, _216);
    float _222 = _204 * _214;
    float _224 = fma(_206, _212, _220);
    float _226 = -_222;
    float _228 = fma(_202, _218, _226);
    float _230 = abs(_224);
    float _232 = fma(_230, -1.66666662693023681640625, 1.0);
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = fma(_228, 0.25, 0.25);
    float _238 = fma(_234, -2.0, 3.0);
    float _240 = _234 * _234;
    float _242 = _98 * _152;
    float _244 = fma(_238, _240, _236);
    float _246 = _98 * _140;
    float _248 = _242 + _244;
    float _250 = 0.0 + _248;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _252 * _246;
    bool _258 = _254 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _260 = isnan(_254);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _266 = _262 || _264;
    float _268 = in.m_40.x;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_40.y;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_38.x;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_38.y;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_40.z;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_38.z;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    if (!_266)
    {
        discard_fragment();
    }
    float _304 = 0.0 + _244;
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = _98 * _272;
    float _310 = _98 * _278;
    float _312 = _98 * _284;
    float _314 = _98 * _290;
    float _316 = _98 * _296;
    float _318 = _98 * _302;
    float _320 = fma(_312, _306, _308);
    float _322 = fma(_314, _306, _310);
    float _324 = fma(_318, _306, _316);
    if (!_266)
    {
        out.m_43.x = _320;
        out.m_43.y = _322;
        out.m_43.z = _324;
        out.m_43.w = _248;
        return out;
    }
    float _326 = _322 * 0.715200006961822509765625;
    float _328 = in.m_45.w;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_45.z;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_45.x;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = fma(_320, 0.2125999927520751953125, _326);
    float _348 = in.m_45.y;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = 0.0 + _254;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = fma(_324, 0.072200000286102294921875, _346);
    bool _360 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _362 = 1.0 / _358;
    float _364 = _362 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = fma(_366, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _370 = _98 * _332;
    float _372 = _98 * _338;
    float _374 = _368 * _370;
    float _376 = _98 * _344;
    float _378 = _98 * _352;
    float _380 = fma(_324, _374, _372);
    float _382 = fma(_320, _374, _376);
    float _384 = fma(_322, _374, _378);
    float _386 = _372;
    if (!_360)
    {
        _386 = _356;
    }
    float _388 = _386;
    bool _390 = !_360;
    float _392 = _388;
    if (!_390)
    {
        float _394 = in.m_47.w;
        float _396 = gl_FragCoord.w;
        float _398 = _394 * _396;
        float _400 = in.m_47.z;
        float _402 = gl_FragCoord.w;
        float _404 = _400 * _402;
        float _406 = _98 * _398;
        float _408 = _98 * _404;
        float _410 = 1.0 / _406;
        float _412 = _408 * _410;
        float _414 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _416 = fma(_412, (*spvDescriptorSet0.fp_c8)._m0[30].w, _414);
        float _418 = 1.0 / _416;
        float _420 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _422 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _424 = fma(_418, _420, _422);
        float _426 = _424 * 8.0;
        float _428 = precise::clamp(_426, 0.0, 1.0);
        float _430 = _356 * _428;
        _392 = _430;
    }
    float _432 = _392;
    float _434 = 0.0 + _432;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    out.m_43.x = _382;
    out.m_43.y = _384;
    out.m_43.z = _380;
    out.m_43.w = _436;
    return out;
}

