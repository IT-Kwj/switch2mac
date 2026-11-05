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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_12 [[id(10)]];
    sampler fp_t_tcb_12Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _116 = false;
    bool _114 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _734 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_734, float2(0.0), isnan(_734))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_734, float2(0.0), isnan(_734))).x;
    float _60 = in.m_44.y;
    float _62 = -_58;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _60;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = -_66;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _80 = !_74;
    uint _83 = uint(_80 ? 0 : 1);
    uint _85 = 2u;
    if (!_74)
    {
        _85 = 1u;
    }
    uint _87 = _85;
    uint _89 = _87;
    if (!_78)
    {
        _89 = _83;
    }
    uint _91 = _89;
    uint _93 = min(_91, 2u);
    int _96 = int(_93) << 2;
    float _98 = in.m_44.x;
    uint _100 = uint(int(uint(_96) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    float _108 = _66 * _98;
    bool _110 = as_type<int>(_106) == 336;
    if (!_110)
    {
        bool _112 = as_type<int>(_106) == 608;
        _114 = _112;
        if (!_114)
        {
            _116 = true;
        }
    }
    float _150;
    float _152;
    float _154;
    float _156;
    if (!_114)
    {
        if (!_116)
        {
            float _118 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
            float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _150 = _148;
            _152 = _146;
            _154 = _142;
            _156 = _144;
        }
    }
    if ((false || _116) || _114)
    {
        if ((!_116) || _114)
        {
            _114 = false;
            float _158 = _68 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _68 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _68 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _170);
            float _180 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _150 = _188;
            _152 = _186;
            _154 = _182;
            _156 = _184;
        }
        if (false || _116)
        {
            _116 = false;
            float _190 = _68 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _68 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _68 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _68 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _202);
            float _212 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _150 = _220;
            _152 = _218;
            _154 = _214;
            _156 = _216;
        }
    }
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _232 = -_68;
    float _234 = _232 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _236 = -_68;
    float _238 = _236 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _240 = -_108;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _244 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[21].x, _230);
    float _246 = _234 * _234;
    float2 _1138 = float2(_54, _56);
    float2 _250 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1138, float2(0.0), isnan(_1138))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1138, float2(0.0), isnan(_1138))).xy;
    float _252 = _250.x;
    float _254 = _250.y;
    float _256 = -_108;
    float _258 = _256 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _260 = _238 * _238;
    float _262 = fma(_242, _242, _246);
    float _264 = -_66;
    float _266 = _264 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _268 = 1.0 / _222;
    float _270 = fma(_258, _258, _260);
    float _272 = -_66;
    float _274 = _272 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _276 = fma(_266, _266, _262);
    float _278 = float(int(_91));
    float _280 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _282 = fma(_274, _274, _270);
    float _284 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _286 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _288 = sqrt(_276);
    float _290 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _292 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _294 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _296 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _298 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _300 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _302 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _304 = sqrt(_282);
    float _306 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _308 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _310 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _312 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _314 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _316 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _318 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _320 = rint(_278);
    float _322 = precise::max(_320, 0.0);
    uint _324 = uint(_322);
    uint _326 = clamp(_324, 0u, 65535u);
    bool _328 = _288 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _330 = _268 * _224;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    bool _334 = _288 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _336 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[19].x, _280);
    float _338 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[22].x, _284);
    float _340 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[20].x, _286);
    bool _342 = _304 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _344 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[23].x, _290);
    bool _346 = _304 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _348 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[24].x, _292);
    float _350 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[16].x, _294);
    float _352 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[17].x, _296);
    float _354 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[18].x, _298);
    float _356 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[25].x, _300);
    float _358 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[26].x, _302);
    float _360 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[27].x, _306);
    float _362 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[28].x, _308);
    float _364 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[29].x, _310);
    float _366 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[30].x, _312);
    float _368 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[31].x, _314);
    float _370 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[32].x, _316);
    float _372 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[33].x, _318);
    float _374 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _332;
    float _376 = _268 * _226;
    float _378 = _268 * _228;
    bool _380 = !_342;
    int _382 = _380 ? 0 : 1;
    float _384 = _374 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    bool _386 = !_328;
    int _388 = _386 ? 0 : 1;
    float _390 = _374 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _392 = fma(_384, -0.5, _376);
    float _394 = fma(_390, 0.5, _378);
    int _396 = 2;
    int _398 = 2;
    if (!_342)
    {
        _396 = 1;
    }
    int _400 = _396;
    int _402 = _400;
    if (!_328)
    {
        _398 = 1;
    }
    int _404 = _398;
    int _406 = _404;
    if (!_346)
    {
        _402 = _382;
    }
    int _408 = _402;
    if (!_334)
    {
        _406 = _388;
    }
    int _410 = _406;
    float3 _1464 = float3(_392, _394, float(int(_326)));
    float3 _1468 = select(_1464, float3(0.0), isnan(_1464));
    float _412 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1468.xy, uint(rint(_1468.z)), _332);
    float _414 = float(_410);
    float _416 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _336);
    float _418 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _340);
    float _420 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _244);
    float _422 = precise::min(_414, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _424 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _338);
    float _426 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _344);
    float _428 = float(_408);
    float _430 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _348);
    bool _432 = _422 != 1.0;
    bool _434 = isnan(_422);
    bool _436 = _432 || _434;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    float _442 = _416 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _444 = _418 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _446 = _420 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _448 = precise::min(_428, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _450 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _354);
    float _452 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _366);
    float _454 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _372);
    bool _456 = _448 != 1.0;
    bool _458 = isnan(_448);
    bool _460 = _456 || _458;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    float _466 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _350);
    bool _468 = _448 != 0.0;
    bool _470 = isnan(_448);
    bool _472 = _468 || _470;
    bool _474 = isnan(0.0);
    bool _476 = _472 || _474;
    float _478 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _360);
    float _480 = _452 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _482 = _442;
    float _484 = _444;
    float _486 = _446;
    float _488 = _480;
    if (_440)
    {
        float _490 = _424 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _482 = _490;
    }
    float _492 = _482;
    float _494 = _492;
    if (_440)
    {
        float _496 = _426 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _484 = _496;
    }
    float _498 = _484;
    float _500 = _498;
    if (_440)
    {
        float _502 = _430 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _486 = _502;
    }
    float _504 = _486;
    bool _506 = _422 != 0.0;
    bool _508 = isnan(_422);
    bool _510 = _506 || _508;
    bool _512 = isnan(0.0);
    bool _514 = _510 || _512;
    float _516 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _352);
    float _518 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _364);
    float _520 = fma(_384, 0.5, _376);
    float _522 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _362);
    float _524 = _504;
    if (_464)
    {
        float _526 = _454 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _488 = _526;
    }
    float _528 = _488;
    float _530 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _532 = _528;
    if (!_476)
    {
        float _534 = _478 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _532 = _534;
    }
    float _536 = _532;
    float _538 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _370);
    float _540 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _542 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _368);
    float _544 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _358);
    float _546 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _356);
    if (!_514)
    {
        float _548 = _450 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _524 = _548;
    }
    float _550 = _524;
    if (!_514)
    {
        float _552 = _466 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _494 = _552;
    }
    float _554 = _494;
    if (!_514)
    {
        float _556 = _516 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _500 = _556;
    }
    float _558 = _500;
    float _560 = 0.0 + _536;
    float _562 = precise::clamp(_560, 0.0, 1.0);
    float _564 = 0.0 + _550;
    float _566 = precise::clamp(_564, 0.0, 1.0);
    float _568 = _518 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _570 = _522 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _572 = _568;
    float _574 = _570;
    if (_464)
    {
        float _576 = _538 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _572 = _576;
    }
    float _578 = _572;
    float _580 = _566 * _530;
    float _582 = _566 * _540;
    float _584 = _578;
    if (_464)
    {
        float _586 = _542 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _574 = _586;
    }
    float _588 = _574;
    float _590 = _588;
    if (!_476)
    {
        float _592 = _544 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _584 = _592;
    }
    float _594 = _584;
    float _596 = fma(_390, -0.5, _378);
    if (!_476)
    {
        float _598 = _546 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _590 = _598;
    }
    float _600 = _590;
    float _602 = fma(_580, 0.5, _554);
    float _604 = _530 * _562;
    float _606 = fma(_580, -0.5, _554);
    float _608 = fma(_582, 0.5, _558);
    float _610 = fma(_582, -0.5, _558);
    float _612 = fma(_604, 0.5, _600);
    float _614 = fma(_604, -0.5, _600);
    float _616 = rint(_422);
    float _618 = precise::max(_616, 0.0);
    uint _620 = uint(_618);
    uint _622 = clamp(_620, 0u, 65535u);
    float _624 = _540 * _562;
    float _626 = rint(_448);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    uint _632 = clamp(_630, 0u, 65535u);
    float _634 = fma(_624, 0.5, _594);
    float _636 = fma(_624, -0.5, _594);
    float3 _1849 = float3(_520, _394, float(int(_326)));
    float3 _1851 = select(_1849, float3(0.0), isnan(_1849));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1851.xy, uint(rint(_1851.z)), _332);
    float _640 = fma(_252, 2.0, -1.0);
    float _642 = fma(_254, 2.0, -1.0);
    float _644 = _640 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _646 = _642 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _648 = fma(_644, 2.0, _54);
    float _650 = fma(_646, 2.0, _56);
    float3 _1881 = float3(_520, _596, float(int(_326)));
    float3 _1883 = select(_1881, float3(0.0), isnan(_1881));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1883.xy, uint(rint(_1883.z)), _332);
    float3 _1892 = float3(_392, _596, float(int(_326)));
    float3 _1894 = select(_1892, float3(0.0), isnan(_1892));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1894.xy, uint(rint(_1894.z)), _332);
    float3 _1903 = float3(_606, _608, float(int(_622)));
    float3 _1905 = select(_1903, float3(0.0), isnan(_1903));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1905.xy, uint(rint(_1905.z)), _566);
    float3 _1914 = float3(_602, _608, float(int(_622)));
    float3 _1916 = select(_1914, float3(0.0), isnan(_1914));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1916.xy, uint(rint(_1916.z)), _566);
    float3 _1925 = float3(_602, _610, float(int(_622)));
    float3 _1927 = select(_1925, float3(0.0), isnan(_1925));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1927.xy, uint(rint(_1927.z)), _566);
    float3 _1936 = float3(_614, _634, float(int(_632)));
    float3 _1938 = select(_1936, float3(0.0), isnan(_1936));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1938.xy, uint(rint(_1938.z)), _562);
    float3 _1947 = float3(_612, _634, float(int(_632)));
    float3 _1949 = select(_1947, float3(0.0), isnan(_1947));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1949.xy, uint(rint(_1949.z)), _562);
    float3 _1958 = float3(_612, _636, float(int(_632)));
    float3 _1960 = select(_1958, float3(0.0), isnan(_1958));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1960.xy, uint(rint(_1960.z)), _562);
    float3 _1969 = float3(_606, _610, float(int(_622)));
    float3 _1971 = select(_1969, float3(0.0), isnan(_1969));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1971.xy, uint(rint(_1971.z)), _566);
    float3 _1980 = float3(_614, _636, float(int(_632)));
    float3 _1982 = select(_1980, float3(0.0), isnan(_1980));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1982.xy, uint(rint(_1982.z)), _562);
    float2 _1988 = float2(_648, _650);
    float _672 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1988, float2(0.0), isnan(_1988))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1988, float2(0.0), isnan(_1988))).x;
    float _674 = -_66;
    float _676 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _678 = _674 + _676;
    float _680 = -_66;
    float _682 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _684 = _680 + _682;
    float _686 = _678 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _688 = precise::clamp(_686, 0.0, 1.0);
    float _690 = _638 + _412;
    float _692 = _690 + _652;
    float _694 = _658 + _656;
    float _696 = _692 + _654;
    float _698 = _664 + _662;
    float _700 = _694 + _660;
    float _702 = fma(_696, 0.25, _688);
    float _704 = _698 + _666;
    float _706 = _700 + _668;
    float _708 = _704 + _670;
    float _710 = _706 * 0.25;
    float _712 = _708 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _714 = _712 * 0.25;
    float _716 = fma(_710, (*spvDescriptorSet0.fp_c3)._m0[49].z, _714);
    float _718 = _684 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = _716 + _720;
    out.m_47.x = _672;
    out.m_47.y = _702;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _722;
    return out;
}

