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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _116 = false;
    bool _114 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _631 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_631, float2(0.0), isnan(_631))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_631, float2(0.0), isnan(_631))).x;
    float _56 = in.m_40.y;
    float _58 = in.m_40.x;
    float _60 = -_54;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = -_68;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = -_68;
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
    float _98 = _68 * _58;
    float _100 = _68 * _56;
    uint _102 = uint(int(uint(_96) >> uint(2)));
    uint _104 = uint(int(uint(int(_102)) >> uint(2)));
    int _106 = int(_102) & 3;
    float _108 = (*spvDescriptorSet0.fp_c1)._m0[int(_104)][_106];
    bool _110 = as_type<int>(_108) == 368;
    if (!_110)
    {
        bool _112 = as_type<int>(_108) == 640;
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
            float _118 = _100 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _100 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _100 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _100 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
            float _140 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _150 = _148;
            _152 = _142;
            _154 = _144;
            _156 = _146;
        }
    }
    if ((false || _116) || _114)
    {
        if ((!_116) || _114)
        {
            _114 = false;
            float _158 = _100 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _100 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _100 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _100 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _170);
            float _180 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _150 = _188;
            _152 = _182;
            _154 = _184;
            _156 = _186;
        }
        if (false || _116)
        {
            _116 = false;
            float _190 = _100 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _100 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _100 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _100 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _202);
            float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _150 = _220;
            _152 = _214;
            _154 = _216;
            _156 = _218;
        }
    }
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = -_100;
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _234 = -_98;
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _238 = -_100;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _242 = -_98;
    float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _246 = _232 * _232;
    float _248 = -_68;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _252 = _100 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _254 = _100 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _256 = fma(_236, _236, _246);
    float _258 = _240 * _240;
    float _260 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[30].x, _252);
    float _262 = fma(_250, _250, _256);
    float _264 = -_68;
    float _266 = _264 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _268 = fma(_244, _244, _258);
    float _270 = 1.0 / _222;
    float _272 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[33].x, _254);
    float _274 = fma(_266, _266, _268);
    float _276 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _260);
    float _278 = _100 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _280 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _272);
    float _282 = _100 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _284 = _276 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _286 = sqrt(_262);
    float _288 = _100 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _290 = _100 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _292 = _100 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _294 = _100 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _296 = _100 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _298 = _100 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _300 = _100 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _302 = sqrt(_274);
    float _304 = _100 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _306 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[18].x, _282);
    float _308 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[26].x, _290);
    float _310 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[19].x, _292);
    float _312 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[20].x, _294);
    float _314 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[23].x, _296);
    float _316 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[16].x, _298);
    bool _318 = _286 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _320 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[27].x, _300);
    bool _322 = _286 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _324 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[32].x, _304);
    bool _326 = !_318;
    int _328 = _326 ? 0 : 1;
    float _330 = _270 * _224;
    float _332 = _270 * _226;
    float _334 = _270 * _228;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    bool _338 = _302 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _340 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _320);
    bool _342 = _302 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _344 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _310);
    bool _346 = !_338;
    int _348 = _346 ? 0 : 1;
    float _350 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _324);
    int _352 = 2;
    int _354 = 2;
    float _356 = _284;
    if (!_318)
    {
        _352 = 1;
    }
    int _358 = _352;
    float _360 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _306);
    int _362 = _358;
    if (!_322)
    {
        _362 = _328;
    }
    int _364 = _362;
    float _366 = _100 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _368 = float(int(_91));
    float _370 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _312);
    float _372 = float(_364);
    float _374 = _100 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_338)
    {
        _354 = 1;
    }
    int _376 = _354;
    float _378 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[21].x, _366);
    int _380 = _376;
    if (!_342)
    {
        _380 = _348;
    }
    int _382 = _380;
    float _384 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[24].x, _374);
    float _386 = precise::min(_372, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _388 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _378);
    float _390 = float(_382);
    float _392 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _384);
    bool _394 = _386 != 1.0;
    bool _396 = isnan(_386);
    bool _398 = _394 || _396;
    bool _400 = isnan(1.0);
    bool _402 = _398 || _400;
    float _404 = _388 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _406 = precise::min(_390, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _408 = _100 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _410 = _100 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _412 = _386 != 0.0;
    bool _414 = isnan(_386);
    bool _416 = _412 || _414;
    bool _418 = isnan(0.0);
    bool _420 = _416 || _418;
    float _422 = rint(_368);
    float _424 = precise::max(_422, 0.0);
    uint _426 = uint(_424);
    uint _428 = clamp(_426, 0u, 65535u);
    bool _430 = _406 != 1.0;
    bool _432 = isnan(_406);
    bool _434 = _430 || _432;
    bool _436 = isnan(1.0);
    bool _438 = _434 || _436;
    float _440 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[28].x, _410);
    bool _442 = _406 != 0.0;
    bool _444 = isnan(_406);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _308);
    float _454 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _314);
    float _456 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _440);
    float _458 = _404;
    if (_402)
    {
        float _460 = _392 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _458 = _460;
    }
    float _462 = _458;
    float _464 = _100 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _466 = rint(_386);
    float _468 = precise::max(_466, 0.0);
    uint _470 = uint(_468);
    uint _472 = clamp(_470, 0u, 65535u);
    float _474 = _370 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _476 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _316);
    float _478 = _462;
    float _480 = _474;
    if (!_420)
    {
        float _482 = _360 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _478 = _482;
    }
    float _484 = _478;
    if (_402)
    {
        float _486 = _454 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _480 = _486;
    }
    float _488 = _480;
    float _490 = _488;
    if (_438)
    {
        float _492 = _280 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _356 = _492;
    }
    float _494 = _356;
    float _496 = _100 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _498 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[22].x, _278);
    float _500 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[25].x, _288);
    float _502 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[29].x, _408);
    float _504 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[17].x, _496);
    float _506 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[31].x, _464);
    float _508 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _498);
    float _510 = rint(_406);
    float _512 = precise::max(_510, 0.0);
    uint _514 = uint(_512);
    uint _516 = clamp(_514, 0u, 65535u);
    float _518 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _502);
    float _520 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _506);
    float _522 = _494;
    if (!_450)
    {
        float _524 = _340 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _522 = _524;
    }
    float _526 = _522;
    float _528 = _344 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _530 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _500);
    float _532 = _528;
    if (_402)
    {
        float _534 = _508 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _532 = _534;
    }
    float _536 = _532;
    float _538 = _456 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _540 = _518 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _542 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _504);
    float _544 = _538;
    float _546 = _540;
    float _548 = _536;
    if (_438)
    {
        float _550 = _520 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _544 = _550;
    }
    float _552 = _544;
    float _554 = _552;
    if (_438)
    {
        float _556 = _350 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _546 = _556;
    }
    float _558 = _546;
    float _560 = _558;
    if (!_450)
    {
        float _562 = _530 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _554 = _562;
    }
    float _564 = _554;
    if (!_450)
    {
        float _566 = _452 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _560 = _566;
    }
    float _568 = _560;
    float _570 = 0.0 + _526;
    float _572 = precise::clamp(_570, 0.0, 1.0);
    if (!_420)
    {
        float _574 = _542 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _490 = _574;
    }
    float _576 = _490;
    if (!_420)
    {
        float _578 = _476 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _548 = _578;
    }
    float _580 = _548;
    float _582 = 0.0 + _484;
    float _584 = precise::clamp(_582, 0.0, 1.0);
    float3 _1651 = float3(_564, _568, float(int(_516)));
    float3 _1655 = select(_1651, float3(0.0), isnan(_1651));
    float _586 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1655.xy, uint(rint(_1655.z)), _572);
    float3 _1664 = float3(_580, _576, float(int(_472)));
    float3 _1666 = select(_1664, float3(0.0), isnan(_1664));
    float _588 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1666.xy, uint(rint(_1666.z)), _584);
    float3 _1675 = float3(_330, _332, float(int(_428)));
    float3 _1677 = select(_1675, float3(0.0), isnan(_1675));
    float _590 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1677.xy, uint(rint(_1677.z)), _336);
    float _592 = -_68;
    float _594 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _596 = _592 + _594;
    float _598 = -_68;
    float _600 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _602 = _598 + _600;
    float _604 = _596 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _606 = precise::clamp(_604, 0.0, 1.0);
    float _608 = _586 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _610 = fma(_588, (*spvDescriptorSet0.fp_c3)._m0[49].z, _608);
    float _612 = _602 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = _590 + _606;
    float _618 = _610 + _614;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _616;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _618;
    return out;
}

