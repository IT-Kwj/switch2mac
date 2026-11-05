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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
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
    bool _126 = false;
    bool _124 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _723 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_723, float2(0.0), isnan(_723))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_723, float2(0.0), isnan(_723))).x;
    float _56 = in.m_40.y;
    float _58 = -_54;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _56;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = -_66;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _80 = -_66;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _84 = !_74;
    int _87 = _84 ? 0 : 1;
    int _89 = 2;
    if (!_74)
    {
        _89 = 1;
    }
    int _91 = _89;
    int _93 = _91;
    if (!_78)
    {
        _93 = _87;
    }
    int _95 = _93;
    int _97 = _95 + 1;
    uint _100 = uint(_97);
    if (!_82)
    {
        _100 = uint(_95);
    }
    uint _102 = _100;
    uint _104 = min(_102, 2u);
    int _106 = int(_104) << 2;
    float _108 = in.m_40.x;
    uint _110 = uint(int(uint(_106) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.fp_c1)._m0[int(_112)][_114];
    float _118 = _66 * _108;
    bool _120 = as_type<int>(_116) == 416;
    if (!_120)
    {
        bool _122 = as_type<int>(_116) == 688;
        _124 = _122;
        if (!_124)
        {
            _126 = true;
        }
    }
    float _160;
    float _162;
    float _164;
    float _166;
    if (!_124)
    {
        if (!_126)
        {
            float _128 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _130 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _132 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _134 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _136 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
            float _138 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
            float _140 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[2].x, _132);
            float _142 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[3].x, _134);
            float _144 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
            float _146 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _138);
            float _148 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _140);
            float _150 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _160 = _158;
            _162 = _152;
            _164 = _154;
            _166 = _156;
        }
    }
    if ((false || _126) || _124)
    {
        if ((!_126) || _124)
        {
            _124 = false;
            float _168 = _68 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _170 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _172 = _68 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _174 = _68 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _176 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[4].x, _168);
            float _178 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[5].x, _170);
            float _180 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[6].x, _172);
            float _182 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[7].x, _174);
            float _184 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _176);
            float _186 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _178);
            float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _180);
            float _190 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _182);
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _160 = _198;
            _162 = _192;
            _164 = _194;
            _166 = _196;
        }
        if (false || _126)
        {
            _126 = false;
            float _200 = _68 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _202 = _68 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _204 = _68 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _206 = _68 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _208 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[8].x, _200);
            float _210 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
            float _212 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[10].x, _204);
            float _214 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[11].x, _206);
            float _216 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _208);
            float _218 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _210);
            float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _212);
            float _222 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _214);
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _160 = _230;
            _162 = _224;
            _164 = _226;
            _166 = _228;
        }
    }
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = -_68;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _244 = -_118;
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _248 = -_68;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _252 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _254 = _242 * _242;
    float _256 = -_66;
    float _258 = _256 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _260 = _250 * _250;
    float _262 = -_66;
    float _264 = _262 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _266 = fma(_246, _246, _254);
    float _268 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _270 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _272 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _274 = fma(_258, _258, _266);
    float _276 = -_118;
    float _278 = _276 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _280 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _282 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _284 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _286 = fma(_278, _278, _260);
    float _288 = sqrt(_274);
    float _290 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _292 = fma(_264, _264, _286);
    float _294 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _296 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _298 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _300 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _302 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _304 = sqrt(_292);
    float _306 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _308 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _310 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _312 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _314 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[19].x, _268);
    float _316 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[20].x, _272);
    bool _318 = _288 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _320 = 1.0 / _232;
    bool _322 = _288 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _324 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[21].x, _282);
    bool _326 = !_318;
    int _328 = _326 ? 0 : 1;
    float _330 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[22].x, _270);
    float _332 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[23].x, _280);
    float _334 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[24].x, _284);
    float _336 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _314);
    bool _338 = _304 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _340 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _316);
    float _342 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _324);
    float _344 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[29].x, _302);
    int _346 = 2;
    if (!_318)
    {
        _346 = 1;
    }
    int _348 = _346;
    float _350 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _330);
    bool _352 = _304 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _354 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    int _356 = _348;
    if (!_322)
    {
        _356 = _328;
    }
    int _358 = _356;
    float _360 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[26].x, _252);
    bool _362 = !_338;
    int _364 = _362 ? 0 : 1;
    float _366 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _332);
    float _368 = float(_358);
    float _370 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _334);
    float _372 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[16].x, _290);
    float _374 = precise::min(_368, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _376 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[17].x, _294);
    int _378 = 2;
    if (!_338)
    {
        _378 = 1;
    }
    int _380 = _378;
    float _382 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[18].x, _296);
    int _384 = _380;
    if (!_352)
    {
        _384 = _364;
    }
    int _386 = _384;
    float _388 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[25].x, _298);
    bool _390 = _374 != 1.0;
    bool _392 = isnan(_374);
    bool _394 = _390 || _392;
    bool _396 = isnan(1.0);
    bool _398 = _394 || _396;
    float _400 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[27].x, _354);
    float _402 = float(_386);
    float _404 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[28].x, _300);
    float _406 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[30].x, _306);
    float _408 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[31].x, _308);
    float _410 = precise::min(_402, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _412 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[32].x, _310);
    float _414 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[33].x, _312);
    float _416 = _336 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _418 = _340 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _420 = _342 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _422 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _344);
    float _424 = _416;
    float _426 = _418;
    float _428 = _420;
    if (_398)
    {
        float _430 = _350 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _424 = _430;
    }
    float _432 = _424;
    float _434 = _432;
    if (_398)
    {
        float _436 = _366 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _426 = _436;
    }
    float _438 = _426;
    float _440 = _438;
    if (_398)
    {
        float _442 = _370 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _428 = _442;
    }
    float _444 = _428;
    bool _446 = _410 != 1.0;
    bool _448 = isnan(_410);
    bool _450 = _446 || _448;
    bool _452 = isnan(1.0);
    bool _454 = _450 || _452;
    float _456 = _422 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    bool _458 = _374 != 0.0;
    bool _460 = isnan(_374);
    bool _462 = _458 || _460;
    bool _464 = isnan(0.0);
    bool _466 = _462 || _464;
    float _468 = _320 * _234;
    bool _470 = _410 != 0.0;
    bool _472 = isnan(_410);
    bool _474 = _470 || _472;
    bool _476 = isnan(0.0);
    bool _478 = _474 || _476;
    float _480 = _320 * _236;
    float _482 = _320 * _238;
    float _484 = precise::clamp(_482, 0.0, 1.0);
    float _486 = float(int(_102));
    float _488 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _406);
    float _490 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _404);
    float _492 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _414);
    float _494 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _382);
    float _496 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _408);
    float _498 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _400);
    float _500 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _412);
    float _502 = _488 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _504 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _360);
    float _506 = rint(_486);
    float _508 = precise::max(_506, 0.0);
    uint _510 = uint(_508);
    uint _512 = clamp(_510, 0u, 65535u);
    float _514 = _490 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _516 = _502;
    float _518 = _444;
    float _520 = _514;
    float _522 = _456;
    if (_454)
    {
        float _524 = _492 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _516 = _524;
    }
    float _526 = _516;
    float _528 = _526;
    if (!_466)
    {
        float _530 = _494 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _518 = _530;
    }
    float _532 = _518;
    if (_454)
    {
        float _534 = _496 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _520 = _534;
    }
    float _536 = _520;
    float _538 = _536;
    if (!_478)
    {
        float _540 = _498 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _528 = _540;
    }
    float _542 = _528;
    if (_454)
    {
        float _544 = _500 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _522 = _544;
    }
    float _546 = _522;
    float _548 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _484;
    float _550 = _546;
    if (!_478)
    {
        float _552 = _504 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _550 = _552;
    }
    float _554 = _550;
    float _556 = rint(_374);
    float _558 = precise::max(_556, 0.0);
    uint _560 = uint(_558);
    uint _562 = clamp(_560, 0u, 65535u);
    float _564 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _372);
    float _566 = 0.0 + _532;
    float _568 = precise::clamp(_566, 0.0, 1.0);
    float _570 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _572 = 0.0 + _542;
    float _574 = precise::clamp(_572, 0.0, 1.0);
    float _576 = _548 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _578 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    if (!_466)
    {
        float _580 = _564 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _434 = _580;
    }
    float _582 = _434;
    float _584 = rint(_410);
    float _586 = precise::max(_584, 0.0);
    uint _588 = uint(_586);
    uint _590 = clamp(_588, 0u, 65535u);
    float _592 = _548 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _594 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _376);
    float _596 = _570 * _574;
    float _598 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _388);
    float _600 = fma(_576, 0.5, _468);
    float _602 = fma(_576, -0.5, _468);
    float _604 = _568 * _578;
    float _606 = fma(_592, 0.5, _480);
    float _608 = fma(_592, -0.5, _480);
    if (!_466)
    {
        float _610 = _594 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _440 = _610;
    }
    float _612 = _440;
    float _614 = _568 * _570;
    float _616 = fma(_596, 0.5, _554);
    if (!_478)
    {
        float _618 = _598 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _538 = _618;
    }
    float _620 = _538;
    float _622 = _578 * _574;
    float _624 = fma(_596, -0.5, _554);
    float _626 = fma(_604, 0.5, _582);
    float _628 = fma(_604, -0.5, _582);
    float _630 = fma(_614, 0.5, _612);
    float _632 = fma(_614, -0.5, _612);
    float _634 = fma(_622, 0.5, _620);
    float _636 = fma(_622, -0.5, _620);
    float3 _1833 = float3(_602, _606, float(int(_512)));
    float3 _1837 = select(_1833, float3(0.0), isnan(_1833));
    float _638 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1837.xy, uint(rint(_1837.z)), _484);
    float3 _1846 = float3(_600, _606, float(int(_512)));
    float3 _1848 = select(_1846, float3(0.0), isnan(_1846));
    float _640 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1848.xy, uint(rint(_1848.z)), _484);
    float3 _1857 = float3(_600, _608, float(int(_512)));
    float3 _1859 = select(_1857, float3(0.0), isnan(_1857));
    float _642 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1859.xy, uint(rint(_1859.z)), _484);
    float3 _1868 = float3(_602, _608, float(int(_512)));
    float3 _1870 = select(_1868, float3(0.0), isnan(_1868));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1870.xy, uint(rint(_1870.z)), _484);
    float3 _1879 = float3(_628, _630, float(int(_562)));
    float3 _1881 = select(_1879, float3(0.0), isnan(_1879));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1881.xy, uint(rint(_1881.z)), _568);
    float3 _1890 = float3(_626, _630, float(int(_562)));
    float3 _1892 = select(_1890, float3(0.0), isnan(_1890));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1892.xy, uint(rint(_1892.z)), _568);
    float3 _1901 = float3(_636, _616, float(int(_590)));
    float3 _1903 = select(_1901, float3(0.0), isnan(_1901));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1903.xy, uint(rint(_1903.z)), _574);
    float3 _1912 = float3(_634, _616, float(int(_590)));
    float3 _1914 = select(_1912, float3(0.0), isnan(_1912));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1914.xy, uint(rint(_1914.z)), _574);
    float3 _1923 = float3(_626, _632, float(int(_562)));
    float3 _1925 = select(_1923, float3(0.0), isnan(_1923));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1925.xy, uint(rint(_1925.z)), _568);
    float3 _1934 = float3(_634, _624, float(int(_590)));
    float3 _1936 = select(_1934, float3(0.0), isnan(_1934));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1936.xy, uint(rint(_1936.z)), _574);
    float3 _1945 = float3(_628, _632, float(int(_562)));
    float3 _1947 = select(_1945, float3(0.0), isnan(_1945));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1947.xy, uint(rint(_1947.z)), _568);
    float3 _1956 = float3(_636, _624, float(int(_590)));
    float3 _1958 = select(_1956, float3(0.0), isnan(_1956));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1958.xy, uint(rint(_1958.z)), _574);
    float _662 = _640 + _638;
    float _664 = _662 + _642;
    float _666 = -_66;
    float _668 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _670 = _666 + _668;
    float _672 = -_66;
    float _674 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _676 = _672 + _674;
    float _678 = _664 + _644;
    float _680 = _670 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _682 = precise::clamp(_680, 0.0, 1.0);
    float _684 = _676 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _686 = precise::clamp(_684, 0.0, 1.0);
    float _688 = _648 + _646;
    float _690 = fma(_678, 0.25, _682);
    float _692 = _652 + _650;
    float _694 = _688 + _654;
    float _696 = _692 + _656;
    float _698 = _694 + _658;
    float _700 = _696 + _660;
    float _702 = _698 * 0.25;
    float _704 = _700 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _706 = _704 * 0.25;
    float _708 = fma(_702, (*spvDescriptorSet0.fp_c3)._m0[49].z, _706);
    float _710 = _708 + _686;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _690;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _710;
    return out;
}

