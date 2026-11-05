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
    bool _130 = false;
    bool _128 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _645 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_645, float2(0.0), isnan(_645))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_645, float2(0.0), isnan(_645))).x;
    float2 _656 = float2(_52, _54);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_656, float2(0.0), isnan(_656))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_656, float2(0.0), isnan(_656))).x;
    float _60 = in.m_42.y;
    float _62 = -_56;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = in.m_42.x;
    float _74 = -_70;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _80 = -_70;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _84 = -_70;
    bool _86 = _84 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _88 = !_78;
    int _91 = _88 ? 0 : 1;
    int _93 = 2;
    if (!_78)
    {
        _93 = 1;
    }
    int _95 = _93;
    int _97 = _95;
    if (!_82)
    {
        _97 = _91;
    }
    int _99 = _97;
    int _101 = _99 + 1;
    uint _104 = uint(_101);
    if (!_86)
    {
        _104 = uint(_99);
    }
    uint _106 = _104;
    uint _108 = min(_106, 2u);
    int _110 = int(_108) << 2;
    float _112 = _70 * _72;
    float _114 = _70 * _60;
    uint _116 = uint(int(uint(_110) >> uint(2)));
    uint _118 = uint(int(uint(int(_116)) >> uint(2)));
    int _120 = int(_116) & 3;
    float _122 = (*spvDescriptorSet0.fp_c1)._m0[int(_118)][_120];
    bool _124 = as_type<int>(_122) == 448;
    if (!_124)
    {
        bool _126 = as_type<int>(_122) == 720;
        _128 = _126;
        if (!_128)
        {
            _130 = true;
        }
    }
    float _164;
    float _166;
    float _168;
    float _170;
    if (!_128)
    {
        if (!_130)
        {
            float _132 = _114 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _134 = _114 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _136 = _114 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _138 = _114 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _140 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[0].x, _132);
            float _142 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[1].x, _134);
            float _144 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[2].x, _136);
            float _146 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[3].x, _138);
            float _148 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _140);
            float _150 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _142);
            float _152 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _144);
            float _154 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _146);
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _160 = _152 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _162 = _154 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _164 = _162;
            _166 = _156;
            _168 = _158;
            _170 = _160;
        }
    }
    if ((false || _130) || _128)
    {
        if ((!_130) || _128)
        {
            _128 = false;
            float _172 = _114 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _174 = _114 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _176 = _114 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _178 = _114 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _180 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[4].x, _172);
            float _182 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[5].x, _174);
            float _184 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[6].x, _176);
            float _186 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[7].x, _178);
            float _188 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, _180);
            float _190 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].z, _182);
            float _192 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].z, _184);
            float _194 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].z, _186);
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _200 = _192 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _202 = _194 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _164 = _202;
            _166 = _196;
            _168 = _198;
            _170 = _200;
        }
        if (false || _130)
        {
            _130 = false;
            float _204 = _114 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _206 = _114 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _208 = _114 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _210 = _114 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _212 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[8].x, _204);
            float _214 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[9].x, _206);
            float _216 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[10].x, _208);
            float _218 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[11].x, _210);
            float _220 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].z, _212);
            float _222 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].z, _214);
            float _224 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].z, _216);
            float _226 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].z, _218);
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _232 = _224 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _234 = _226 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _164 = _234;
            _166 = _228;
            _168 = _230;
            _170 = _232;
        }
    }
    float _236 = _164;
    float _238 = _166;
    float _240 = _168;
    float _242 = _170;
    float _244 = -_114;
    float _246 = _244 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _248 = -_112;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _252 = -_114;
    float _254 = _252 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _256 = -_112;
    float _258 = _256 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _260 = _246 * _246;
    float _262 = -_70;
    float _264 = _262 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _266 = _114 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _268 = _114 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _270 = fma(_250, _250, _260);
    float _272 = _254 * _254;
    float _274 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[30].x, _266);
    float _276 = fma(_264, _264, _270);
    float _278 = -_70;
    float _280 = _278 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _282 = fma(_258, _258, _272);
    float _284 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[33].x, _268);
    float _286 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _274);
    float _288 = fma(_280, _280, _282);
    float _290 = sqrt(_276);
    float _292 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _284);
    float _294 = _286 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _296 = _114 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _298 = _114 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _300 = _114 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _302 = _114 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _304 = _114 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _306 = sqrt(_288);
    float _308 = _114 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _310 = _114 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _312 = _114 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _314 = _114 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _316 = _114 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _318 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[20].x, _296);
    float _320 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[18].x, _300);
    bool _322 = _290 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _324 = 1.0 / _236;
    bool _326 = _290 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _328 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[26].x, _310);
    bool _330 = !_322;
    int _332 = _330 ? 0 : 1;
    float _334 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[19].x, _302);
    float _336 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[17].x, _304);
    float _338 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[27].x, _312);
    bool _340 = _306 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _342 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[31].x, _314);
    bool _344 = _306 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _346 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[32].x, _316);
    bool _348 = !_340;
    int _350 = _348 ? 0 : 1;
    float _352 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _318);
    int _354 = 2;
    int _356 = 2;
    float _358 = _294;
    if (!_322)
    {
        _354 = 1;
    }
    int _360 = _354;
    float _362 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _338);
    int _364 = _360;
    if (!_326)
    {
        _364 = _332;
    }
    int _366 = _364;
    float _368 = _114 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _370 = _324 * _238;
    float _372 = _324 * _240;
    float _374 = float(_366);
    float _376 = _114 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_340)
    {
        _356 = 1;
    }
    int _378 = _356;
    float _380 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[21].x, _368);
    int _382 = _378;
    if (!_344)
    {
        _382 = _350;
    }
    int _384 = _382;
    float _386 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[24].x, _376);
    float _388 = precise::min(_374, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _390 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _380);
    float _392 = float(_384);
    float _394 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _386);
    bool _396 = _388 != 1.0;
    bool _398 = isnan(_388);
    bool _400 = _396 || _398;
    bool _402 = isnan(1.0);
    bool _404 = _400 || _402;
    float _406 = _390 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _408 = precise::min(_392, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _410 = _114 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _412 = _114 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _414 = _388 != 0.0;
    bool _416 = isnan(_388);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = _324 * _242;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    bool _428 = _408 != 1.0;
    bool _430 = isnan(_408);
    bool _432 = _428 || _430;
    bool _434 = isnan(1.0);
    bool _436 = _432 || _434;
    float _438 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[29].x, _412);
    bool _440 = _408 != 0.0;
    bool _442 = isnan(_408);
    bool _444 = _440 || _442;
    bool _446 = isnan(0.0);
    bool _448 = _444 || _446;
    float _450 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _334);
    float _452 = float(int(_106));
    float _454 = rint(_388);
    float _456 = precise::max(_454, 0.0);
    uint _458 = uint(_456);
    uint _460 = clamp(_458, 0u, 65535u);
    float _462 = _406;
    if (_404)
    {
        float _464 = _394 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _462 = _464;
    }
    float _466 = _462;
    float _468 = _114 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _470 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _438);
    float _472 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _342);
    float _474 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _346);
    float _476 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _320);
    float _478 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _328);
    float _480 = _466;
    if (_436)
    {
        float _482 = _292 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _358 = _482;
    }
    float _484 = _358;
    float _486 = _114 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _488 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[22].x, _468);
    float _490 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[23].x, _298);
    float _492 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[25].x, _308);
    float _494 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[16].x, _486);
    float _496 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[28].x, _410);
    float _498 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _490);
    float _500 = _352 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _502 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _488);
    float _504 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _496);
    float _506 = _500;
    float _508 = _484;
    if (_404)
    {
        float _510 = _498 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _506 = _510;
    }
    float _512 = _506;
    float _514 = _512;
    if (!_448)
    {
        float _516 = _362 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _508 = _516;
    }
    float _518 = _508;
    float _520 = rint(_408);
    float _522 = precise::max(_520, 0.0);
    uint _524 = uint(_522);
    uint _526 = clamp(_524, 0u, 65535u);
    float _528 = _450 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _530 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _492);
    float _532 = _528;
    if (_404)
    {
        float _534 = _502 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _532 = _534;
    }
    float _536 = _532;
    float _538 = _504 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _540 = _470 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _542 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _336);
    float _544 = _538;
    float _546 = _540;
    float _548 = _536;
    if (_436)
    {
        float _550 = _472 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _544 = _550;
    }
    float _552 = _544;
    float _554 = rint(_452);
    float _556 = precise::max(_554, 0.0);
    uint _558 = uint(_556);
    uint _560 = clamp(_558, 0u, 65535u);
    float _562 = _552;
    if (_436)
    {
        float _564 = _474 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _546 = _564;
    }
    float _566 = _546;
    float _568 = _566;
    if (!_422)
    {
        float _570 = _476 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _480 = _570;
    }
    float _572 = _480;
    if (!_448)
    {
        float _574 = _530 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _562 = _574;
    }
    float _576 = _562;
    float _578 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _494);
    if (!_448)
    {
        float _580 = _478 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _568 = _580;
    }
    float _582 = _568;
    float _584 = 0.0 + _518;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    if (!_422)
    {
        float _588 = _542 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _514 = _588;
    }
    float _590 = _514;
    if (!_422)
    {
        float _592 = _578 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _548 = _592;
    }
    float _594 = _548;
    float _596 = 0.0 + _572;
    float _598 = precise::clamp(_596, 0.0, 1.0);
    float3 _1689 = float3(_576, _582, float(int(_526)));
    float3 _1693 = select(_1689, float3(0.0), isnan(_1689));
    float _600 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1693.xy, uint(rint(_1693.z)), _586);
    float3 _1702 = float3(_594, _590, float(int(_460)));
    float3 _1704 = select(_1702, float3(0.0), isnan(_1702));
    float _602 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1704.xy, uint(rint(_1704.z)), _598);
    float3 _1713 = float3(_370, _372, float(int(_560)));
    float3 _1715 = select(_1713, float3(0.0), isnan(_1713));
    float _604 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1715.xy, uint(rint(_1715.z)), _426);
    float _606 = -_70;
    float _608 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _610 = _606 + _608;
    float _612 = -_70;
    float _614 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _616 = _612 + _614;
    float _618 = _610 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _620 = precise::clamp(_618, 0.0, 1.0);
    float _622 = _616 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _624 = precise::clamp(_622, 0.0, 1.0);
    float _626 = _600 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _628 = fma(_602, (*spvDescriptorSet0.fp_c3)._m0[49].z, _626);
    float _630 = _604 + _620;
    float _632 = _628 + _624;
    out.m_45.x = _58;
    out.m_45.y = _630;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _632;
    return out;
}

