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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
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
    bool _116 = false;
    bool _114 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _631 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_631, float2(0.0), isnan(_631))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_631, float2(0.0), isnan(_631))).x;
    float2 _642 = float2(_52, _54);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_642, float2(0.0), isnan(_642))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_642, float2(0.0), isnan(_642))).x;
    float _60 = in.m_42.y;
    float _62 = in.m_42.x;
    float _64 = -_56;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[46].z, _66);
    float _70 = _68 * _62;
    float _72 = -_68;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = _68 * _60;
    float _80 = -_68;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _84 = !_76;
    uint _87 = uint(_84 ? 0 : 1);
    uint _89 = 2u;
    if (!_76)
    {
        _89 = 1u;
    }
    uint _91 = _89;
    uint _93 = _91;
    if (!_82)
    {
        _93 = _87;
    }
    uint _95 = _93;
    uint _97 = min(_95, 2u);
    int _100 = int(_97) << 2;
    uint _102 = uint(int(uint(_100) >> uint(2)));
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
            float _118 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _78 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _78 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
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
            float _158 = _78 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _78 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _78 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _78 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
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
            float _190 = _78 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _78 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _78 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _78 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
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
    float _230 = -_78;
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _234 = -_70;
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _238 = -_78;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _242 = -_70;
    float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _246 = _232 * _232;
    float _248 = -_68;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _252 = _78 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _254 = _78 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _256 = fma(_236, _236, _246);
    float _258 = _240 * _240;
    float _260 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _252);
    float _262 = fma(_250, _250, _256);
    float _264 = -_68;
    float _266 = _264 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _268 = fma(_244, _244, _258);
    float _270 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _254);
    float _272 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _260);
    float _274 = fma(_266, _266, _268);
    float _276 = sqrt(_262);
    float _278 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _270);
    float _280 = _272 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _282 = _78 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _284 = _78 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _286 = _78 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _288 = _78 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _290 = _78 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _292 = sqrt(_274);
    float _294 = _78 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _296 = _78 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _298 = _78 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _300 = _78 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _302 = _78 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _304 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _282);
    float _306 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _286);
    bool _308 = _276 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _310 = 1.0 / _222;
    bool _312 = _276 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _314 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _296);
    bool _316 = !_308;
    int _318 = _316 ? 0 : 1;
    float _320 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _288);
    float _322 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _290);
    float _324 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _298);
    bool _326 = _292 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _328 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _300);
    bool _330 = _292 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _332 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _302);
    bool _334 = !_326;
    int _336 = _334 ? 0 : 1;
    float _338 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _304);
    int _340 = 2;
    int _342 = 2;
    float _344 = _280;
    if (!_308)
    {
        _340 = 1;
    }
    int _346 = _340;
    float _348 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _324);
    int _350 = _346;
    if (!_312)
    {
        _350 = _318;
    }
    int _352 = _350;
    float _354 = _78 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _356 = _310 * _224;
    float _358 = _310 * _226;
    float _360 = float(_352);
    float _362 = _78 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_326)
    {
        _342 = 1;
    }
    int _364 = _342;
    float _366 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _354);
    int _368 = _364;
    if (!_330)
    {
        _368 = _336;
    }
    int _370 = _368;
    float _372 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _362);
    float _374 = precise::min(_360, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _376 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _366);
    float _378 = float(_370);
    float _380 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _372);
    bool _382 = _374 != 1.0;
    bool _384 = isnan(_374);
    bool _386 = _382 || _384;
    bool _388 = isnan(1.0);
    bool _390 = _386 || _388;
    float _392 = _376 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _394 = precise::min(_378, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _396 = _78 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _398 = _78 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _400 = _374 != 0.0;
    bool _402 = isnan(_374);
    bool _404 = _400 || _402;
    bool _406 = isnan(0.0);
    bool _408 = _404 || _406;
    float _410 = _310 * _228;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    bool _414 = _394 != 1.0;
    bool _416 = isnan(_394);
    bool _418 = _414 || _416;
    bool _420 = isnan(1.0);
    bool _422 = _418 || _420;
    float _424 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _398);
    bool _426 = _394 != 0.0;
    bool _428 = isnan(_394);
    bool _430 = _426 || _428;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    float _436 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _320);
    float _438 = float(int(_95));
    float _440 = rint(_374);
    float _442 = precise::max(_440, 0.0);
    uint _444 = uint(_442);
    uint _446 = clamp(_444, 0u, 65535u);
    float _448 = _392;
    if (_390)
    {
        float _450 = _380 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _448 = _450;
    }
    float _452 = _448;
    float _454 = _78 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _456 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _424);
    float _458 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _328);
    float _460 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _332);
    float _462 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _306);
    float _464 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _314);
    float _466 = _452;
    if (_422)
    {
        float _468 = _278 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _344 = _468;
    }
    float _470 = _344;
    float _472 = _78 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _474 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _454);
    float _476 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _284);
    float _478 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _294);
    float _480 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _472);
    float _482 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _396);
    float _484 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _476);
    float _486 = _338 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _488 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _474);
    float _490 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _482);
    float _492 = _486;
    float _494 = _470;
    if (_390)
    {
        float _496 = _484 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _492 = _496;
    }
    float _498 = _492;
    float _500 = _498;
    if (!_434)
    {
        float _502 = _348 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _494 = _502;
    }
    float _504 = _494;
    float _506 = rint(_394);
    float _508 = precise::max(_506, 0.0);
    uint _510 = uint(_508);
    uint _512 = clamp(_510, 0u, 65535u);
    float _514 = _436 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _516 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _478);
    float _518 = _514;
    if (_390)
    {
        float _520 = _488 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _518 = _520;
    }
    float _522 = _518;
    float _524 = _490 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _526 = _456 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _528 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _322);
    float _530 = _524;
    float _532 = _526;
    float _534 = _522;
    if (_422)
    {
        float _536 = _458 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _530 = _536;
    }
    float _538 = _530;
    float _540 = rint(_438);
    float _542 = precise::max(_540, 0.0);
    uint _544 = uint(_542);
    uint _546 = clamp(_544, 0u, 65535u);
    float _548 = _538;
    if (_422)
    {
        float _550 = _460 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _532 = _550;
    }
    float _552 = _532;
    float _554 = _552;
    if (!_408)
    {
        float _556 = _462 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _466 = _556;
    }
    float _558 = _466;
    if (!_434)
    {
        float _560 = _516 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _548 = _560;
    }
    float _562 = _548;
    float _564 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _480);
    if (!_434)
    {
        float _566 = _464 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _554 = _566;
    }
    float _568 = _554;
    float _570 = 0.0 + _504;
    float _572 = precise::clamp(_570, 0.0, 1.0);
    if (!_408)
    {
        float _574 = _528 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _500 = _574;
    }
    float _576 = _500;
    if (!_408)
    {
        float _578 = _564 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _534 = _578;
    }
    float _580 = _534;
    float _582 = 0.0 + _558;
    float _584 = precise::clamp(_582, 0.0, 1.0);
    float3 _1655 = float3(_562, _568, float(int(_512)));
    float3 _1659 = select(_1655, float3(0.0), isnan(_1655));
    float _586 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1659.xy, uint(rint(_1659.z)), _572);
    float3 _1668 = float3(_580, _576, float(int(_446)));
    float3 _1670 = select(_1668, float3(0.0), isnan(_1668));
    float _588 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1670.xy, uint(rint(_1670.z)), _584);
    float3 _1679 = float3(_356, _358, float(int(_546)));
    float3 _1681 = select(_1679, float3(0.0), isnan(_1679));
    float _590 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1681.xy, uint(rint(_1681.z)), _412);
    float _592 = -_68;
    float _594 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _596 = _592 + _594;
    float _598 = -_68;
    float _600 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _602 = _598 + _600;
    float _604 = _596 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _606 = precise::clamp(_604, 0.0, 1.0);
    float _608 = _602 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _610 = precise::clamp(_608, 0.0, 1.0);
    float _612 = _586 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _614 = fma(_588, (*spvDescriptorSet0.fp_c3)._m0[49].z, _612);
    float _616 = _590 + _606;
    float _618 = _614 + _610;
    out.m_45.x = _58;
    out.m_45.y = _616;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _618;
    return out;
}

