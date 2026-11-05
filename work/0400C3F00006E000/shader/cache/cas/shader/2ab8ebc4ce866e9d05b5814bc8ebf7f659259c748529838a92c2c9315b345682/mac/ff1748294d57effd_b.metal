#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _124 = false;
    bool _122 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _723 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_723, float2(0.0), isnan(_723))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_723, float2(0.0), isnan(_723))).x;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float _62 = -_56;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _58;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = _66 * _60;
    float _78 = -_66;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _82 = -_66;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _86 = !_74;
    int _89 = _86 ? 0 : 1;
    int _91 = 2;
    if (!_74)
    {
        _91 = 1;
    }
    int _93 = _91;
    int _95 = _93;
    if (!_80)
    {
        _95 = _89;
    }
    int _97 = _95;
    int _99 = _97 + 1;
    uint _102 = uint(_99);
    if (!_84)
    {
        _102 = uint(_97);
    }
    uint _104 = _102;
    uint _106 = min(_104, 2u);
    int _108 = int(_106) << 2;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.fp_c1)._m0[int(_112)][_114];
    bool _118 = as_type<int>(_116) == 384;
    if (!_118)
    {
        bool _120 = as_type<int>(_116) == 656;
        _122 = _120;
        if (!_122)
        {
            _124 = true;
        }
    }
    float _158;
    float _160;
    float _162;
    float _164;
    if (!_122)
    {
        if (!_124)
        {
            float _126 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _128 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _130 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _132 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _134 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
            float _136 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
            float _138 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
            float _140 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _132);
            float _142 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
            float _144 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
            float _146 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _138);
            float _148 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _140);
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _158 = _156;
            _160 = _150;
            _162 = _152;
            _164 = _154;
        }
    }
    if ((false || _124) || _122)
    {
        if ((!_124) || _122)
        {
            _122 = false;
            float _166 = _76 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _168 = _76 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _170 = _76 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _172 = _76 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _174 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].x, _166);
            float _176 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, _168);
            float _178 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].x, _170);
            float _180 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].x, _172);
            float _182 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _174);
            float _184 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _176);
            float _186 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _178);
            float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _180);
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _158 = _196;
            _160 = _190;
            _162 = _192;
            _164 = _194;
        }
        if (false || _124)
        {
            _124 = false;
            float _198 = _76 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _200 = _76 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _202 = _76 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _204 = _76 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _206 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].x, _198);
            float _208 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].x, _200);
            float _210 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
            float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].x, _204);
            float _214 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _206);
            float _216 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _208);
            float _218 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _210);
            float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _212);
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _158 = _228;
            _160 = _222;
            _162 = _224;
            _164 = _226;
        }
    }
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = 1.0 / _230;
    float _240 = float(int(_104));
    float _242 = rint(_240);
    float _244 = precise::max(_242, 0.0);
    uint _246 = uint(_244);
    uint _248 = clamp(_246, 0u, 65535u);
    float _250 = _238 * _232;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _238 * _234;
    float _256 = _238 * _236;
    float _258 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _252;
    float _260 = _258 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _262 = _258 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _264 = fma(_260, -0.5, _254);
    float _266 = fma(_262, 0.5, _256);
    float3 _1163 = float3(_264, _266, float(int(_248)));
    float3 _1167 = select(_1163, float3(0.0), isnan(_1163));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1167.xy, uint(rint(_1167.z)), _252);
    float _270 = -_76;
    float _272 = _270 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _274 = -_68;
    float _276 = _274 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _278 = -_66;
    float _280 = _278 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _282 = _76 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _284 = _272 * _272;
    float _286 = -_66;
    float _288 = _286 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _290 = _76 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _292 = _76 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _294 = fma(_276, _276, _284);
    float _296 = -_68;
    float _298 = _296 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _300 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].x, _290);
    float _302 = _76 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _304 = fma(_288, _288, _294);
    float _306 = -_76;
    float _308 = _306 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _310 = _76 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _312 = _76 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _314 = _76 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _316 = _76 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _318 = sqrt(_304);
    float _320 = _308 * _308;
    float _322 = _76 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _324 = _76 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _326 = fma(_298, _298, _320);
    float _328 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].x, _282);
    float _330 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].x, _292);
    float _332 = _76 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _334 = fma(_280, _280, _326);
    float _336 = _76 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _338 = _76 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _340 = _76 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _342 = _76 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _344 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _300);
    float _346 = sqrt(_334);
    bool _348 = _318 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _350 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].x, _302);
    bool _352 = _318 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _354 = _76 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _356 = !_348;
    int _358 = _356 ? 0 : 1;
    float _360 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _328);
    float _362 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].x, _310);
    float _364 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].x, _354);
    float _366 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].x, _312);
    float _368 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].x, _314);
    float _370 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].x, _336);
    float _372 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].x, _316);
    float _374 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].x, _322);
    int _376 = 2;
    if (!_348)
    {
        _376 = 1;
    }
    int _378 = _376;
    float _380 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].x, _324);
    int _382 = _378;
    if (!_352)
    {
        _382 = _358;
    }
    int _384 = _382;
    float _386 = _76 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _388 = _346 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _390 = _76 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _392 = float(_384);
    float _394 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].x, _386);
    bool _396 = _346 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _398 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].x, _332);
    float _400 = precise::min(_392, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _402 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].x, _338);
    bool _404 = !_388;
    int _406 = _404 ? 0 : 1;
    float _408 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].x, _340);
    bool _410 = _400 != 1.0;
    bool _412 = isnan(_400);
    bool _414 = _410 || _412;
    bool _416 = isnan(1.0);
    bool _418 = _414 || _416;
    float _420 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].x, _342);
    float _422 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].x, _390);
    int _424 = 2;
    if (!_388)
    {
        _424 = 1;
    }
    int _426 = _424;
    float _428 = _344 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _430 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _394);
    int _432 = _426;
    float _434 = _428;
    if (!_396)
    {
        _432 = _406;
    }
    int _436 = _432;
    float _438 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _350);
    float _440 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _330);
    float _442 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _368);
    float _444 = float(_436);
    float _446 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _380);
    if (_418)
    {
        float _448 = _360 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _434 = _448;
    }
    float _450 = _434;
    float _452 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _364);
    float _454 = _430 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _456 = precise::min(_444, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _458 = _438 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _460 = _454;
    float _462 = _458;
    float _464 = _450;
    if (_418)
    {
        float _466 = _440 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _460 = _466;
    }
    float _468 = _460;
    float _470 = _468;
    if (_418)
    {
        float _472 = _452 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _462 = _472;
    }
    float _474 = _462;
    bool _476 = _400 != 0.0;
    bool _478 = isnan(_400);
    bool _480 = _476 || _478;
    bool _482 = isnan(0.0);
    bool _484 = _480 || _482;
    float _486 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _408);
    bool _488 = _456 != 1.0;
    bool _490 = isnan(_456);
    bool _492 = _488 || _490;
    bool _494 = isnan(1.0);
    bool _496 = _492 || _494;
    float _498 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _370);
    bool _500 = _456 != 0.0;
    bool _502 = isnan(_456);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _398);
    float _512 = _446 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _514 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _420);
    float _516 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _402);
    float _518 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _372);
    float _520 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _422);
    float _522 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _362);
    float _524 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _526 = _474;
    float _528 = _512;
    if (!_484)
    {
        float _530 = _442 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _526 = _530;
    }
    float _532 = _526;
    float _534 = _510 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _536 = _534;
    if (_496)
    {
        float _538 = _486 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _528 = _538;
    }
    float _540 = _528;
    float _542 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _374);
    float _544 = _540;
    if (!_508)
    {
        float _546 = _498 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _544 = _546;
    }
    float _548 = _544;
    float _550 = 0.0 + _532;
    float _552 = precise::clamp(_550, 0.0, 1.0);
    if (_496)
    {
        float _554 = _514 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _536 = _554;
    }
    float _556 = _536;
    float _558 = _516 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _560 = _556;
    float _562 = _558;
    if (!_508)
    {
        float _564 = _518 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _560 = _564;
    }
    float _566 = _560;
    float _568 = fma(_260, 0.5, _254);
    if (_496)
    {
        float _570 = _520 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _562 = _570;
    }
    float _572 = _562;
    float _574 = _572;
    if (!_484)
    {
        float _576 = _522 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _464 = _576;
    }
    float _578 = _464;
    float _580 = rint(_400);
    float _582 = precise::max(_580, 0.0);
    uint _584 = uint(_582);
    uint _586 = clamp(_584, 0u, 65535u);
    float _588 = _552 * _524;
    if (!_508)
    {
        float _590 = _542 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _574 = _590;
    }
    float _592 = _574;
    float _594 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _366);
    float _596 = fma(_262, -0.5, _256);
    float _598 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _600 = fma(_588, 0.5, _578);
    float _602 = 0.0 + _592;
    float _604 = precise::clamp(_602, 0.0, 1.0);
    float _606 = fma(_588, -0.5, _578);
    if (!_484)
    {
        float _608 = _594 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _470 = _608;
    }
    float _610 = _470;
    float _612 = rint(_456);
    float _614 = precise::max(_612, 0.0);
    uint _616 = uint(_614);
    uint _618 = clamp(_616, 0u, 65535u);
    float _620 = _552 * _598;
    float _622 = _524 * _604;
    float _624 = _598 * _604;
    float _626 = fma(_620, 0.5, _610);
    float _628 = fma(_620, -0.5, _610);
    float _630 = fma(_622, 0.5, _548);
    float _632 = fma(_622, -0.5, _548);
    float _634 = fma(_624, 0.5, _566);
    float _636 = fma(_624, -0.5, _566);
    float3 _1842 = float3(_568, _266, float(int(_248)));
    float3 _1844 = select(_1842, float3(0.0), isnan(_1842));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1844.xy, uint(rint(_1844.z)), _252);
    float3 _1853 = float3(_568, _596, float(int(_248)));
    float3 _1855 = select(_1853, float3(0.0), isnan(_1853));
    float _640 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1855.xy, uint(rint(_1855.z)), _252);
    float3 _1864 = float3(_264, _596, float(int(_248)));
    float3 _1866 = select(_1864, float3(0.0), isnan(_1864));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1866.xy, uint(rint(_1866.z)), _252);
    float3 _1875 = float3(_606, _626, float(int(_586)));
    float3 _1877 = select(_1875, float3(0.0), isnan(_1875));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1877.xy, uint(rint(_1877.z)), _552);
    float3 _1886 = float3(_600, _626, float(int(_586)));
    float3 _1888 = select(_1886, float3(0.0), isnan(_1886));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1888.xy, uint(rint(_1888.z)), _552);
    float3 _1897 = float3(_600, _628, float(int(_586)));
    float3 _1899 = select(_1897, float3(0.0), isnan(_1897));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1899.xy, uint(rint(_1899.z)), _552);
    float3 _1908 = float3(_606, _628, float(int(_586)));
    float3 _1910 = select(_1908, float3(0.0), isnan(_1908));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1910.xy, uint(rint(_1910.z)), _552);
    float3 _1919 = float3(_632, _634, float(int(_618)));
    float3 _1921 = select(_1919, float3(0.0), isnan(_1919));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1921.xy, uint(rint(_1921.z)), _604);
    float3 _1930 = float3(_630, _634, float(int(_618)));
    float3 _1932 = select(_1930, float3(0.0), isnan(_1930));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1932.xy, uint(rint(_1932.z)), _604);
    float3 _1941 = float3(_630, _636, float(int(_618)));
    float3 _1943 = select(_1941, float3(0.0), isnan(_1941));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1943.xy, uint(rint(_1943.z)), _604);
    float3 _1952 = float3(_632, _636, float(int(_618)));
    float3 _1954 = select(_1952, float3(0.0), isnan(_1952));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1954.xy, uint(rint(_1954.z)), _604);
    float2 _1960 = float2(_52, _54);
    float _660 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1960, float2(0.0), isnan(_1960))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1960, float2(0.0), isnan(_1960))).x;
    float _662 = -_66;
    float _664 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _666 = _662 + _664;
    float _668 = -_66;
    float _670 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _672 = _668 + _670;
    float _674 = _666 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _676 = precise::clamp(_674, 0.0, 1.0);
    float _678 = _638 + _268;
    float _680 = _678 + _640;
    float _682 = _680 + _642;
    float _684 = _646 + _644;
    float _686 = fma(_682, 0.25, _676);
    float _688 = _684 + _648;
    float _690 = _654 + _652;
    float _692 = _688 + _650;
    float _694 = _692 * 0.25;
    float _696 = _690 + _656;
    float _698 = _696 + _658;
    float _700 = _698 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _702 = _700 * 0.25;
    float _704 = fma(_694, (*spvDescriptorSet0.fp_c3)._m0[49].z, _702);
    float _706 = _672 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _708 = precise::clamp(_706, 0.0, 1.0);
    float _710 = _704 + _708;
    out.m_45.x = _660;
    out.m_45.y = _686;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _710;
    return out;
}

