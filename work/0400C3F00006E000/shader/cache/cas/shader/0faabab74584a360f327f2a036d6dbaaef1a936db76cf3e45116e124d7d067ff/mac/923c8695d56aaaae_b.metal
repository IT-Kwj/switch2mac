#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    constant _16* fp_c11 [[id(4)]];
    texture2d<float> fp_t_tcb_14 [[id(5)]];
    sampler fp_t_tcb_14Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture3d<float> fp_t_tcb_1A [[id(9)]];
    sampler fp_t_tcb_1ASmplr [[id(10)]];
    texture2d<float> fp_t_tcb_C [[id(11)]];
    sampler fp_t_tcb_CSmplr [[id(12)]];
    texture2d<float> fp_t_tcb_E [[id(13)]];
    sampler fp_t_tcb_ESmplr [[id(14)]];
    sampler fp_t_tcb_14Smplr_w [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    sampler fp_t_tcb_1ASmplr_w [[id(17)]];
    sampler fp_t_tcb_CSmplr_w [[id(18)]];
    sampler fp_t_tcb_ESmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
    float4 m_53 [[color(1)]];
};

struct main0_in
{
    float4 m_48 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _60 = gl_FragCoord.w;
    float _62 = in.m_46.w;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = gl_FragCoord.x;
    float _70 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _72 = _68 / _70;
    float _74 = gl_FragCoord.y;
    float _76 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _78 = _74 / _76;
    float _80 = 1.0 / _60;
    float _82 = _72 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _84 = _78 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _86 = _80 * _66;
    float _88 = (*spvDescriptorSet0.fp_c9)._m0[62].z + (-1.0);
    float _90 = _86 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _92 = -_90;
    float _94 = fma(_88, _92, 1.0);
    float _96 = log2(_94);
    float2 _717 = float2(_82, _84);
    float _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_717, float2(0.0), isnan(_717))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_717, float2(0.0), isnan(_717))).x;
    float _100 = _96 * 0.693147182464599609375;
    float _102 = _100 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float2 _735 = float2(_82, _84);
    float2 _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_735, float2(0.0), isnan(_735))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_735, float2(0.0), isnan(_735))).xy;
    float _108 = _106.x;
    float _110 = _106.y;
    float3 _748 = float3(_82, _84, _102);
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_748, float3(0.0), isnan(_748))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_748, float3(0.0), isnan(_748))).x;
    float _114 = in.m_48.z;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_48.x;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = _80 * _118;
    float _128 = _80 * _124;
    float _130 = in.m_48.y;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _138 = _126 + _136;
    float _140 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _142 = _128 + _140;
    float _144 = _138 * _138;
    float _146 = fma(_142, _142, _144);
    float _148 = sqrt(_146);
    bool _152 = _148 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _154 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _156 = _148 + _154;
    float _158 = _80 * _134;
    float _160 = _144;
    float _162 = _156;
    float _164 = _134;
    if (_152)
    {
        float _166 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _160 = _166;
    }
    float _168 = _160;
    float _170 = 0.0;
    if (_152)
    {
        float _172 = rsqrt(_146);
        _170 = _172;
    }
    float _174 = _170;
    float _176 = _168;
    float _178 = _174;
    if (_152)
    {
        float _180 = _156 * _168;
        _162 = _180;
    }
    float _182 = _162;
    if (_152)
    {
        float _184 = _158 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _176 = _184;
    }
    float _186 = _176;
    float _188 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _190 = _158 + _188;
    float _192 = 0.0;
    float _194 = _186;
    if (_152)
    {
        float _196 = _182 * 0.15915493667125701904296875;
        _192 = _196;
    }
    float _198 = _192;
    float _200 = 0.0;
    if (_152)
    {
        float _202 = _198 * 6.283185482025146484375;
        float _204 = cos(_202);
        _200 = _204;
    }
    float _206 = _200;
    float _208 = _182;
    if (_152)
    {
        float _210 = _198 * 6.283185482025146484375;
        float _212 = sin(_210);
        _208 = _212;
    }
    float _214 = _208;
    if (_152)
    {
        float _216 = _206 + (-1.0);
        _164 = _216;
    }
    float _218 = _164;
    float _220 = 0.0;
    float _222 = _218;
    if (_152)
    {
        float _224 = _218 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _220 = _224;
    }
    float _226 = _220;
    if (!_152)
    {
        _222 = _128;
    }
    float _228 = _222;
    float _230 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _232 = _128 + _230;
    float _234 = 0.0;
    float _236 = _214;
    float _238 = _228;
    if (_152)
    {
        float _240 = fma(_214, _186, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _234 = _240;
    }
    float _242 = _234;
    if (!_152)
    {
        _194 = _158;
    }
    float _244 = _194;
    float _246 = _244;
    if (_152)
    {
        float _248 = fma(_158, _206, _226);
        _246 = _248;
    }
    float _250 = _246;
    if (!_152)
    {
        _236 = _126;
    }
    float _252 = _236;
    float _254 = _252;
    if (_152)
    {
        float _256 = _174 * _242;
        _178 = _256;
    }
    float _258 = _178;
    float _260 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _262 = _126 + _260;
    float _264 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _266 = _250 + _264;
    if (_152)
    {
        float _268 = fma(_142, _258, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _238 = _268;
    }
    float _270 = _238;
    if (_152)
    {
        float _272 = fma(_138, _258, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _254 = _272;
    }
    float _274 = _254;
    float _276 = _266 * _266;
    float _278 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _280 = _270 + _278;
    float _282 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _284 = _274 + _282;
    float _286 = fma(_280, _280, _276);
    float _288 = fma(_284, _284, _286);
    float _290 = _190 * _190;
    float _292 = fma(_232, _232, _290);
    float _294 = rsqrt(_288);
    float _296 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _298 = fma(_262, _262, _292);
    float _300 = precise::max(0.0, _296);
    float _302 = sqrt(_298);
    float _304 = _294 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _306 = _280 * _304;
    float _308 = _284 * _304;
    float _310 = -_304;
    float _312 = -_300;
    float _314 = fma(_266, _310, _312);
    float _316 = _306 * _306;
    float _318 = _308 * _308;
    float _320 = _316 + _318;
    float _322 = sqrt(_320);
    bool _324 = _322 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _326 = _296;
    float _328 = _300;
    float _330 = _292;
    float _332 = _306;
    float _334 = _308;
    if (!_324)
    {
        _326 = _318;
    }
    float _336 = _326;
    float _338 = _336;
    if (!_324)
    {
        _328 = _316;
    }
    float _340 = _328;
    float _342 = _340;
    if (!_324)
    {
        _330 = _314;
    }
    float _344 = _330;
    bool _346 = !_324;
    float _348 = _344;
    if (!_346)
    {
        float _350 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _352 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _354 = _322 + _352;
        float _356 = rsqrt(_320);
        float _358 = _354 * _350;
        float _360 = _314 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _362 = _358 * 0.15915493667125701904296875;
        float _364 = _362 * 6.283185482025146484375;
        float _366 = sin(_364);
        float _368 = _362 * 6.283185482025146484375;
        float _370 = cos(_368);
        float _372 = fma(_366, _360, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _374 = _356 * _372;
        float _376 = _370 + (-1.0);
        float _378 = _306 * _374;
        float _380 = _308 * _374;
        float _382 = _376 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _384 = _380 * _380;
        float _386 = fma(_314, _370, _382);
        float _388 = _378 * _378;
        _348 = _386;
        _342 = _388;
        _338 = _384;
        _332 = _378;
        _334 = _380;
    }
    float _390 = _348;
    float _392 = _342;
    float _394 = _338;
    float _396 = _332;
    float _398 = _334;
    float _400 = fma(_390, _390, _392);
    float _402 = _400 + _394;
    float _404 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _406 = fma(_302, (*spvDescriptorSet0.fp_c9)._m0[63].x, _404);
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = -_408;
    float _412 = _410 + 1.0;
    float _414 = rsqrt(_402);
    float _416 = abs(_412);
    float _418 = log2(_416);
    float _420 = _414 * _396;
    float _422 = _414 * _390;
    float _424 = _414 * _398;
    float _426 = _420 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _428 = _422 + 1.0;
    float _430 = _418 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _432 = -_426;
    float _434 = fma(_422, (*spvDescriptorSet0.fp_c9)._m0[69].y, _432);
    float _436 = exp2(_430);
    float _438 = -_424;
    float _440 = fma(_438, (*spvDescriptorSet0.fp_c9)._m0[69].z, _434);
    float _442 = fma(_440, -0.5, 0.5);
    float _444 = fma(_440, 0.5, 0.5);
    float _446 = sqrt(_442);
    float _448 = -_422;
    float _450 = fma(_436, _428, _448);
    float _452 = fma(_444, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _454 = fma(_450, 0.5, 0.5);
    float _456 = fma(_444, _452, -0.212114393711090087890625);
    float _458 = fma(_108, 2.0, -1.0);
    float _460 = fma(_110, 2.0, -1.0);
    float _462 = fma(_444, _456, 1.570728778839111328125);
    float _464 = fma(_458, (*spvDescriptorSet0.fp_c9)._m0[983].z, _82);
    float _466 = fma(_460, (*spvDescriptorSet0.fp_c9)._m0[983].w, _84);
    float _468 = _446 * 0.636619746685028076171875;
    float _470 = -_462;
    float _472 = fma(_468, _470, 1.0);
    float2 _1294 = float2(_464, _466);
    float4 _475 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1294, float2(0.0), isnan(_1294))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1294, float2(0.0), isnan(_1294))).xyzw;
    float _477 = _475.x;
    float _479 = _475.y;
    float _481 = _475.z;
    float _483 = _475.w;
    float2 _1310 = float2(_472, _454);
    float3 _487 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1310, float2(0.0), isnan(_1310))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1310, float2(0.0), isnan(_1310))).xyz;
    float _489 = _487.x;
    float _491 = _487.y;
    float _493 = _487.z;
    float _495 = -_98;
    float _497 = fma(_495, (*spvDescriptorSet0.fp_c4)._m0[14].w, 1.0);
    float _499 = -_84;
    float _501 = _499 + 1.0;
    float _503 = _82 + (*spvDescriptorSet0.fp_c9)._m0[992].x;
    float _505 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _507 = _158 + _505;
    float _509 = _501 + (*spvDescriptorSet0.fp_c9)._m0[992].y;
    float _511 = 1.0 / _497;
    float _513 = fma(_503, 2.0, -1.0);
    int _516 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    float _518 = fma(_509, 2.0, -1.0);
    float _520 = _507 * _507;
    float _522 = _513 * (*spvDescriptorSet0.fp_c4)._m0[17].x;
    float _524 = _418 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _526 = _518 * (*spvDescriptorSet0.fp_c4)._m0[17].y;
    int _528 = _516 & 31;
    uint _531 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_528)));
    bool _533 = uint(_528) < 32u;
    uint _535 = uint(_533 ? int(_531) : 0);
    float _537 = exp2(_524);
    float _539 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _541 = _511 * _539;
    float _543 = fma(_142, _142, _520);
    float _545 = _541 * _526;
    float _547 = _541 * _522;
    float _549 = fma(_138, _138, _543);
    float _551 = -(*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _553 = _545 * _551;
    float _555 = -(*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _557 = _545 * _555;
    float _559 = -_547;
    float _561 = fma(_559, (*spvDescriptorSet0.fp_c4)._m0[12].x, _553);
    float _563 = -_547;
    float _565 = fma(_563, (*spvDescriptorSet0.fp_c4)._m0[11].x, _557);
    float _567 = -(*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _569 = _545 * _567;
    float _571 = sqrt(_549);
    float _573 = fma(_541, (*spvDescriptorSet0.fp_c4)._m0[12].z, _561);
    float _575 = fma(_541, (*spvDescriptorSet0.fp_c4)._m0[11].z, _565);
    float _577 = -_547;
    float _579 = fma(_577, (*spvDescriptorSet0.fp_c4)._m0[13].x, _569);
    float _581 = -_537;
    float _583 = _581 + 1.0;
    float _585 = _573 + (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _587 = _575 + (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _589 = fma(_541, (*spvDescriptorSet0.fp_c4)._m0[13].z, _579);
    float _591 = 1.0 / (*spvDescriptorSet0.fp_c11)._m0[40].x;
    float _593 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _595 = _585 + _593;
    float _597 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _599 = _587 + _597;
    float _601 = _589 + (*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _603 = _583 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _605 = _595 * _595;
    float _607 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _609 = _601 + _607;
    uint _611 = extract_bits(_535, 0u, 8u);
    float _613 = float(_611);
    float _615 = fma(_599, _599, _605);
    float _617 = fma(_609, _609, _615);
    float _619 = sqrt(_617);
    float _621 = _613 * 0.0039215688593685626983642578125;
    float _623 = -_571;
    float _625 = _623 + _619;
    float _627 = _625 * _591;
    float _629 = precise::clamp(_627, 0.0, 1.0);
    float _631 = -_629;
    float _633 = _631 + 1.0;
    float _635 = _483 * _112;
    float _637 = _621 * _621;
    float _639 = -_633;
    float _641 = fma(_639, _633, 1.0);
    float _643 = _603 * _635;
    float _645 = _641 * _637;
    float _647 = fma(_489, _643, _477);
    float _649 = fma(_491, _643, _479);
    float _651 = fma(_493, _643, _481);
    out.m_51.x = _647;
    out.m_51.y = _649;
    out.m_51.z = _651;
    out.m_51.w = _645;
    out.m_53.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

