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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
};

struct main0_out
{
    float4 m_45 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_49 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_30 [[attribute(2)]];
    float4 m_32 [[attribute(3)]];
    float4 m_41 [[attribute(5)]];
    float4 m_39 [[attribute(7)]];
    float4 m_43 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_30.w;
    float _67 = in.m_32.w;
    float _69 = trunc(_65);
    int _72 = int(_69);
    float _74 = -_67;
    float _76 = _74 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _76;
    bool _80 = _72 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    if (!_80)
    {
        out.m_37.x = 0.0;
    }
    int _86 = 0;
    if (!_80)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _609 = as_type<float>(_90);
        out.gl_Position.z = _609;
    }
    if (!_80)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _94 = _67 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_67);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = float(_72);
    bool _106 = _76 >= _104;
    bool _108 = !_102;
    bool _110 = _106 || _108;
    float _112 = _104;
    if (_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (_110)
    {
        out.m_37.x = 0.0;
    }
    if (_110)
    {
        float _116 = _114 * 5.0;
        _92 = as_type<int>(_116);
    }
    int _118 = _92;
    if (_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _665 = as_type<float>(_118);
        out.gl_Position.z = _665;
    }
    if (_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_39.w;
    float _122 = _76 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _124 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _126 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _128 = _124 || _126;
    bool _130 = isnan(1.0);
    bool _132 = _128 || _130;
    float _134 = in.m_32.x;
    float _136 = in.m_32.y;
    float _138 = in.m_32.z;
    float _140 = in.m_30.x;
    float _142 = in.m_30.y;
    float _144 = in.m_30.z;
    float _146 = 0.0;
    float _148 = _122;
    if (!_132)
    {
        float _150 = _122 * _122;
        float _152 = _150 * 0.5;
        _146 = _152;
    }
    float _154 = _146;
    float _156 = _154;
    if (!_132)
    {
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = !_132;
    float _164 = _160;
    if (!_162)
    {
        float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _168 = log2(_166);
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _172 = _170 + 1.0;
        float _174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = _122 * _168;
        float _178 = exp2(_176);
        float _180 = _174 * 0.693147182464599609375;
        float _182 = 1.0 / _180;
        float _184 = 1.0 / _172;
        float _186 = _178 + (-1.0);
        float _188 = -_186;
        float _190 = fma(_188, _182, _122);
        float _192 = _190 * _184;
        float _194 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _194;
    }
    float _196 = _164;
    bool _198 = !_132;
    if (!_198)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = 1.0 / _206;
        float _210 = _122 * _202;
        float _212 = exp2(_210);
        float _214 = -_212;
        float _216 = _214 + 1.0;
        float _218 = _216 * _208;
        _148 = _218;
    }
    float _220 = _148;
    float _222 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _226 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _228 = fma(_220, _136, _222);
    float _230 = fma(_220, _134, _224);
    float _232 = fma(_220, _138, _226);
    float _234 = fma(_228, _120, _142);
    float _236 = fma(_230, _120, _140);
    float _238 = fma(_232, _120, _144);
    float _240 = _234 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _242 = _234 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _244 = _234 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _246 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _240);
    float _248 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _242);
    float _250 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _244);
    float _252 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].z, _246);
    float _254 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].z, _248);
    float _256 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].z, _250);
    float _258 = _252 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _260 = _254 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _262 = _256 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _264 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _266 = _258 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _270 = _260 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _274 = _262 + _272;
    float _276 = in.m_39.x;
    float _278 = in.m_39.y;
    float _280 = in.m_39.z;
    float _282 = _266 * _266;
    float _284 = fma(_270, _270, _282);
    float _286 = fma(_274, _274, _284);
    float _288 = rsqrt(_286);
    float _290 = _278 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _292 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _294 = _280 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _298 = _266 * _288;
    float _300 = _270 * _288;
    float _302 = _274 * _288;
    float _304 = _292 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _306 = -_298;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _266);
    float _310 = -_300;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _270);
    float _314 = -_302;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _274);
    float _318 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _320 = _308 * _308;
    float _322 = fma(_312, _312, _320);
    float _324 = in.m_41.x;
    float _326 = in.m_41.y;
    float _328 = in.m_41.z;
    float _330 = fma(_316, _316, _322);
    float _332 = sqrt(_330);
    float _334 = _288 * _332;
    float _336 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _326);
    float _338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _324);
    float _340 = _296 * _334;
    float _342 = _304 * _334;
    float _344 = _318 * _334;
    float _346 = _340 * _336;
    float _348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _328);
    float _350 = _342 * _338;
    float _352 = _346 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _354 = _344 * _348;
    float _356 = _346 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _358 = _346 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _360 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[10].x, _352);
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _364 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[8].x, _356);
    float _366 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[9].x, _358);
    float _368 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[10].z, _360);
    float _370 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[8].z, _364);
    float _372 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[9].z, _366);
    float _374 = _262 + _368;
    float _376 = _260 + _370;
    float _378 = _258 + _372;
    float _380 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _382 = _374 + _380;
    float _384 = in.m_43.w;
    float _386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _388 = _376 + _386;
    float _390 = _382 * _382;
    float _392 = fma(_388, _388, _390);
    float _394 = sqrt(_392);
    bool _396 = _394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _398 = _390;
    float _400 = _350;
    float _402 = _374;
    if (!_396)
    {
        _398 = _376;
    }
    float _404 = _398;
    float _406 = _404;
    if (!_396)
    {
        _400 = _378;
    }
    float _408 = _400;
    bool _410 = !_396;
    float _412 = _408;
    if (!_410)
    {
        float _414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _418 = _394 + _416;
        float _420 = _378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _422 = rsqrt(_392);
        float _424 = _418 * _414;
        float _426 = _424 * 0.15915493667125701904296875;
        float _428 = _426 * 6.283185482025146484375;
        float _430 = cos(_428);
        float _432 = _426 * 6.283185482025146484375;
        float _434 = sin(_432);
        float _436 = _430 + (-1.0);
        float _438 = _436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _440 = fma(_434, _420, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _442 = fma(_378, _430, _438);
        float _444 = _422 * _440;
        float _446 = fma(_388, _444, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _448 = fma(_382, _444, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _412 = _442;
        _406 = _446;
        _402 = _448;
    }
    float _450 = _412;
    float _452 = _406;
    float _454 = _402;
    float _456 = -_298;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _450);
    float _460 = -_300;
    float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[18].w, _452);
    float _464 = -_302;
    float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[18].w, _454);
    out.m_45.w = _362;
    float _468 = _458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _470 = _458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _472 = _458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _474 = _458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _476 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[1].x, _468);
    float _478 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[0].x, _470);
    float _480 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[2].x, _472);
    out.m_47.w = _384;
    float _482 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[1].z, _476);
    float _484 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[0].z, _478);
    float _486 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[3].x, _474);
    float _488 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[2].z, _480);
    float _490 = _482 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _492 = _484 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _494 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[3].z, _486);
    float _496 = _488 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _498 = _490 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _500 = _490 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _502 = _490 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _504 = _490 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _506 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[5].x, _498);
    float _508 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[4].x, _500);
    float _510 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[6].x, _502);
    float _512 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[7].x, _504);
    float _514 = _494 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _516 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[5].z, _506);
    float _518 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[4].z, _508);
    float _520 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[6].z, _510);
    float _522 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[7].z, _512);
    float _524 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _516);
    float _526 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _518);
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _520);
    float _530 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _522);
    out.m_49.x = _462;
    out.m_49.y = _458;
    out.m_49.z = _466;
    float _532 = _526 + _530;
    float _534 = _528 + _530;
    float _536 = _530 * 0.5;
    float _538 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _540 = _532 * 0.5;
    float _542 = _534 * 0.5;
    float _544 = fma(_524, -0.5, _536);
    out.m_37.x = _538;
    out.gl_Position.x = _526;
    out.gl_Position.y = _524;
    out.gl_Position.z = _528;
    out.gl_Position.w = _530;
    out.m_51.x = _540;
    out.m_51.y = _544;
    out.m_51.z = _542;
    out.m_51.w = _530;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_30.w;
    float _67 = in.m_32.w;
    float _69 = trunc(_65);
    int _72 = int(_69);
    float _74 = -_67;
    float _76 = _74 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _76;
    bool _80 = _72 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    if (!_80)
    {
        out.m_37.x = 0.0;
    }
    int _86 = 0;
    if (!_80)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _609 = as_type<float>(_90);
        out.gl_Position.z = _609;
    }
    if (!_80)
    {
        return out;
    }
    bool _94 = _67 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_67);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = float(_72);
    bool _106 = _76 >= _104;
    bool _108 = !_102;
    bool _110 = _106 || _108;
    float _112 = _104;
    if (_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (_110)
    {
        out.m_37.x = 0.0;
    }
    if (_110)
    {
        float _116 = _114 * 5.0;
        _92 = as_type<int>(_116);
    }
    int _118 = _92;
    if (_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _665 = as_type<float>(_118);
        out.gl_Position.z = _665;
    }
    if (_110)
    {
        return out;
    }
    float _120 = in.m_39.w;
    float _122 = _76 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _124 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _126 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _128 = _124 || _126;
    bool _130 = isnan(1.0);
    bool _132 = _128 || _130;
    float _134 = in.m_32.x;
    float _136 = in.m_32.y;
    float _138 = in.m_32.z;
    float _140 = in.m_30.x;
    float _142 = in.m_30.y;
    float _144 = in.m_30.z;
    float _146 = 0.0;
    float _148 = _122;
    if (!_132)
    {
        float _150 = _122 * _122;
        float _152 = _150 * 0.5;
        _146 = _152;
    }
    float _154 = _146;
    float _156 = _154;
    if (!_132)
    {
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = !_132;
    float _164 = _160;
    if (!_162)
    {
        float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _168 = log2(_166);
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _172 = _170 + 1.0;
        float _174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = _122 * _168;
        float _178 = exp2(_176);
        float _180 = _174 * 0.693147182464599609375;
        float _182 = 1.0 / _180;
        float _184 = 1.0 / _172;
        float _186 = _178 + (-1.0);
        float _188 = -_186;
        float _190 = fma(_188, _182, _122);
        float _192 = _190 * _184;
        float _194 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _194;
    }
    float _196 = _164;
    bool _198 = !_132;
    if (!_198)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = 1.0 / _206;
        float _210 = _122 * _202;
        float _212 = exp2(_210);
        float _214 = -_212;
        float _216 = _214 + 1.0;
        float _218 = _216 * _208;
        _148 = _218;
    }
    float _220 = _148;
    float _222 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _226 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _228 = fma(_220, _136, _222);
    float _230 = fma(_220, _134, _224);
    float _232 = fma(_220, _138, _226);
    float _234 = fma(_228, _120, _142);
    float _236 = fma(_230, _120, _140);
    float _238 = fma(_232, _120, _144);
    float _240 = _234 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _242 = _234 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _244 = _234 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _246 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _240);
    float _248 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _242);
    float _250 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _244);
    float _252 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].z, _246);
    float _254 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].z, _248);
    float _256 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].z, _250);
    float _258 = _252 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _260 = _254 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _262 = _256 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _264 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _266 = _258 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _270 = _260 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _274 = _262 + _272;
    float _276 = in.m_39.x;
    float _278 = in.m_39.y;
    float _280 = in.m_39.z;
    float _282 = _266 * _266;
    float _284 = fma(_270, _270, _282);
    float _286 = fma(_274, _274, _284);
    float _288 = rsqrt(_286);
    float _290 = _278 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _292 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _294 = _280 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _298 = _266 * _288;
    float _300 = _270 * _288;
    float _302 = _274 * _288;
    float _304 = _292 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _306 = -_298;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _266);
    float _310 = -_300;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _270);
    float _314 = -_302;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _274);
    float _318 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _320 = _308 * _308;
    float _322 = fma(_312, _312, _320);
    float _324 = in.m_41.x;
    float _326 = in.m_41.y;
    float _328 = in.m_41.z;
    float _330 = fma(_316, _316, _322);
    float _332 = sqrt(_330);
    float _334 = _288 * _332;
    float _336 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _326);
    float _338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _324);
    float _340 = _296 * _334;
    float _342 = _304 * _334;
    float _344 = _318 * _334;
    float _346 = _340 * _336;
    float _348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _328);
    float _350 = _342 * _338;
    float _352 = _346 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _354 = _344 * _348;
    float _356 = _346 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _358 = _346 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _360 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[10].x, _352);
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _364 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[8].x, _356);
    float _366 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[9].x, _358);
    float _368 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[10].z, _360);
    float _370 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[8].z, _364);
    float _372 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[9].z, _366);
    float _374 = _262 + _368;
    float _376 = _260 + _370;
    float _378 = _258 + _372;
    float _380 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _382 = _374 + _380;
    float _384 = in.m_43.w;
    float _386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _388 = _376 + _386;
    float _390 = _382 * _382;
    float _392 = fma(_388, _388, _390);
    float _394 = sqrt(_392);
    bool _396 = _394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _398 = _390;
    float _400 = _350;
    float _402 = _374;
    if (!_396)
    {
        _398 = _376;
    }
    float _404 = _398;
    float _406 = _404;
    if (!_396)
    {
        _400 = _378;
    }
    float _408 = _400;
    bool _410 = !_396;
    float _412 = _408;
    if (!_410)
    {
        float _414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _418 = _394 + _416;
        float _420 = _378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _422 = rsqrt(_392);
        float _424 = _418 * _414;
        float _426 = _424 * 0.15915493667125701904296875;
        float _428 = _426 * 6.283185482025146484375;
        float _430 = cos(_428);
        float _432 = _426 * 6.283185482025146484375;
        float _434 = sin(_432);
        float _436 = _430 + (-1.0);
        float _438 = _436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _440 = fma(_434, _420, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _442 = fma(_378, _430, _438);
        float _444 = _422 * _440;
        float _446 = fma(_388, _444, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _448 = fma(_382, _444, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _412 = _442;
        _406 = _446;
        _402 = _448;
    }
    float _450 = _412;
    float _452 = _406;
    float _454 = _402;
    float _456 = -_298;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _450);
    float _460 = -_300;
    float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[18].w, _452);
    float _464 = -_302;
    float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[18].w, _454);
    out.m_45.w = _362;
    float _468 = _458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _470 = _458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _472 = _458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _474 = _458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _476 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[1].x, _468);
    float _478 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[0].x, _470);
    float _480 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[2].x, _472);
    out.m_47.w = _384;
    float _482 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[1].z, _476);
    float _484 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[0].z, _478);
    float _486 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[3].x, _474);
    float _488 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[2].z, _480);
    float _490 = _482 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _492 = _484 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _494 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[3].z, _486);
    float _496 = _488 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _498 = _490 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _500 = _490 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _502 = _490 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _504 = _490 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _506 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[5].x, _498);
    float _508 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[4].x, _500);
    float _510 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[6].x, _502);
    float _512 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[7].x, _504);
    float _514 = _494 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _516 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[5].z, _506);
    float _518 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[4].z, _508);
    float _520 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[6].z, _510);
    float _522 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[7].z, _512);
    float _524 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _516);
    float _526 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _518);
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _520);
    float _530 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _522);
    out.m_49.x = _462;
    out.m_49.y = _458;
    out.m_49.z = _466;
    float _532 = _526 + _530;
    float _534 = _528 + _530;
    float _536 = _530 * 0.5;
    float _538 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _540 = _532 * 0.5;
    float _542 = _534 * 0.5;
    float _544 = fma(_524, -0.5, _536);
    out.m_37.x = _538;
    out.gl_Position.x = _526;
    out.gl_Position.y = _524;
    out.gl_Position.z = _528;
    out.gl_Position.w = _530;
    out.m_51.x = _540;
    out.m_51.y = _544;
    out.m_51.z = _542;
    out.m_51.w = _530;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_37 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _65 = in.m_30.w;
    float _67 = in.m_32.w;
    float _69 = trunc(_65);
    int _72 = int(_69);
    float _74 = -_67;
    float _76 = _74 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_35.y = _76;
    bool _80 = _72 >= 1;
    float _82 = 0.0;
    if (!_80)
    {
        _82 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _84 = _82;
    if (!_80)
    {
        out.m_37.x = 0.0;
    }
    int _86 = 0;
    if (!_80)
    {
        float _88 = _84 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    int _92 = _90;
    if (!_80)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _609 = as_type<float>(_90);
        out.gl_Position.z = _609;
    }
    if (!_80)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _94 = _67 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_67);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = float(_72);
    bool _106 = _76 >= _104;
    bool _108 = !_102;
    bool _110 = _106 || _108;
    float _112 = _104;
    if (_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (_110)
    {
        out.m_37.x = 0.0;
    }
    if (_110)
    {
        float _116 = _114 * 5.0;
        _92 = as_type<int>(_116);
    }
    int _118 = _92;
    if (_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _665 = as_type<float>(_118);
        out.gl_Position.z = _665;
    }
    if (_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_39.w;
    float _122 = _76 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _124 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _126 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _128 = _124 || _126;
    bool _130 = isnan(1.0);
    bool _132 = _128 || _130;
    float _134 = in.m_32.x;
    float _136 = in.m_32.y;
    float _138 = in.m_32.z;
    float _140 = in.m_30.x;
    float _142 = in.m_30.y;
    float _144 = in.m_30.z;
    float _146 = 0.0;
    float _148 = _122;
    if (!_132)
    {
        float _150 = _122 * _122;
        float _152 = _150 * 0.5;
        _146 = _152;
    }
    float _154 = _146;
    float _156 = _154;
    if (!_132)
    {
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _156 = _158;
    }
    float _160 = _156;
    bool _162 = !_132;
    float _164 = _160;
    if (!_162)
    {
        float _166 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _168 = log2(_166);
        float _170 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _172 = _170 + 1.0;
        float _174 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _176 = _122 * _168;
        float _178 = exp2(_176);
        float _180 = _174 * 0.693147182464599609375;
        float _182 = 1.0 / _180;
        float _184 = 1.0 / _172;
        float _186 = _178 + (-1.0);
        float _188 = -_186;
        float _190 = fma(_188, _182, _122);
        float _192 = _190 * _184;
        float _194 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _164 = _194;
    }
    float _196 = _164;
    bool _198 = !_132;
    if (!_198)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = 1.0 / _206;
        float _210 = _122 * _202;
        float _212 = exp2(_210);
        float _214 = -_212;
        float _216 = _214 + 1.0;
        float _218 = _216 * _208;
        _148 = _218;
    }
    float _220 = _148;
    float _222 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _224 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _226 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _228 = fma(_220, _136, _222);
    float _230 = fma(_220, _134, _224);
    float _232 = fma(_220, _138, _226);
    float _234 = fma(_228, _120, _142);
    float _236 = fma(_230, _120, _140);
    float _238 = fma(_232, _120, _144);
    float _240 = _234 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _242 = _234 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _244 = _234 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _246 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[5].x, _240);
    float _248 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[4].x, _242);
    float _250 = fma(_236, (*spvDescriptorSet0.vp_c10)._m0[6].x, _244);
    float _252 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[5].z, _246);
    float _254 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[4].z, _248);
    float _256 = fma(_238, (*spvDescriptorSet0.vp_c10)._m0[6].z, _250);
    float _258 = _252 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _260 = _254 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _262 = _256 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _264 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _266 = _258 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _270 = _260 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _274 = _262 + _272;
    float _276 = in.m_39.x;
    float _278 = in.m_39.y;
    float _280 = in.m_39.z;
    float _282 = _266 * _266;
    float _284 = fma(_270, _270, _282);
    float _286 = fma(_274, _274, _284);
    float _288 = rsqrt(_286);
    float _290 = _278 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _292 = _276 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _294 = _280 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _296 = _290 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _298 = _266 * _288;
    float _300 = _270 * _288;
    float _302 = _274 * _288;
    float _304 = _292 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _306 = -_298;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _266);
    float _310 = -_300;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _270);
    float _314 = -_302;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _274);
    float _318 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _320 = _308 * _308;
    float _322 = fma(_312, _312, _320);
    float _324 = in.m_41.x;
    float _326 = in.m_41.y;
    float _328 = in.m_41.z;
    float _330 = fma(_316, _316, _322);
    float _332 = sqrt(_330);
    float _334 = _288 * _332;
    float _336 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _326);
    float _338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _324);
    float _340 = _296 * _334;
    float _342 = _304 * _334;
    float _344 = _318 * _334;
    float _346 = _340 * _336;
    float _348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _328);
    float _350 = _342 * _338;
    float _352 = _346 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _354 = _344 * _348;
    float _356 = _346 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _358 = _346 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _360 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[10].x, _352);
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _364 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[8].x, _356);
    float _366 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[9].x, _358);
    float _368 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[10].z, _360);
    float _370 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[8].z, _364);
    float _372 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[9].z, _366);
    float _374 = _262 + _368;
    float _376 = _260 + _370;
    float _378 = _258 + _372;
    float _380 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _382 = _374 + _380;
    float _384 = in.m_43.w;
    float _386 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _388 = _376 + _386;
    float _390 = _382 * _382;
    float _392 = fma(_388, _388, _390);
    float _394 = sqrt(_392);
    bool _396 = _394 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _398 = _390;
    float _400 = _350;
    float _402 = _374;
    if (!_396)
    {
        _398 = _376;
    }
    float _404 = _398;
    float _406 = _404;
    if (!_396)
    {
        _400 = _378;
    }
    float _408 = _400;
    bool _410 = !_396;
    float _412 = _408;
    if (!_410)
    {
        float _414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _418 = _394 + _416;
        float _420 = _378 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _422 = rsqrt(_392);
        float _424 = _418 * _414;
        float _426 = _424 * 0.15915493667125701904296875;
        float _428 = _426 * 6.283185482025146484375;
        float _430 = cos(_428);
        float _432 = _426 * 6.283185482025146484375;
        float _434 = sin(_432);
        float _436 = _430 + (-1.0);
        float _438 = _436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _440 = fma(_434, _420, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _442 = fma(_378, _430, _438);
        float _444 = _422 * _440;
        float _446 = fma(_388, _444, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _448 = fma(_382, _444, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _412 = _442;
        _406 = _446;
        _402 = _448;
    }
    float _450 = _412;
    float _452 = _406;
    float _454 = _402;
    float _456 = -_298;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[18].w, _450);
    float _460 = -_300;
    float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[18].w, _452);
    float _464 = -_302;
    float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[18].w, _454);
    out.m_45.w = _362;
    float _468 = _458 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _470 = _458 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _472 = _458 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _474 = _458 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _476 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[1].x, _468);
    float _478 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[0].x, _470);
    float _480 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[2].x, _472);
    out.m_47.w = _384;
    float _482 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[1].z, _476);
    float _484 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[0].z, _478);
    float _486 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[3].x, _474);
    float _488 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[2].z, _480);
    float _490 = _482 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _492 = _484 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _494 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[3].z, _486);
    float _496 = _488 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _498 = _490 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _500 = _490 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _502 = _490 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _504 = _490 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _506 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[5].x, _498);
    float _508 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[4].x, _500);
    float _510 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[6].x, _502);
    float _512 = fma(_492, (*spvDescriptorSet0.vp_c8)._m0[7].x, _504);
    float _514 = _494 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _516 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[5].z, _506);
    float _518 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[4].z, _508);
    float _520 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[6].z, _510);
    float _522 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[7].z, _512);
    float _524 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _516);
    float _526 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _518);
    float _528 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _520);
    float _530 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _522);
    out.m_49.x = _462;
    out.m_49.y = _458;
    out.m_49.z = _466;
    float _532 = _526 + _530;
    float _534 = _528 + _530;
    float _536 = _530 * 0.5;
    float _538 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _540 = _532 * 0.5;
    float _542 = _534 * 0.5;
    float _544 = fma(_524, -0.5, _536);
    out.m_37.x = _538;
    out.gl_Position.x = _526;
    out.gl_Position.y = _524;
    out.gl_Position.z = _528;
    out.gl_Position.w = _530;
    out.m_51.x = _540;
    out.m_51.y = _544;
    out.m_51.z = _542;
    out.m_51.w = _530;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_37.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_37.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_37.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_37.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

